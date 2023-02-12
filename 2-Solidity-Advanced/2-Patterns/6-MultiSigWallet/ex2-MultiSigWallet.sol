
/**
    ------------------
    Multi-Sig Wallet
    ------------------
    Let's create an multi-sig wallet. 

    The wallet owners can:
        1. submit a transaction
        2. approve and revoke approval of pending transcations
        3. anyone can execute a transcation after enough owners has approved it
*/


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract MultiSigWallet {

    event Deposit(address indexed sender, uint amount, uint balance);
    event SubmitTransaction(address indexed owner, uint indexed txIndex, address indexed to, uint value, bytes data);
    event ConfirmTransaction(address indexed owner, uint indexed txIndex);
    event RevokeConfirmation(address indexed owner, uint indexed txIndex);
    event ExecuteTransaction(address indexed owner, uint indexed txIndex);

    address[] public owners;

    mapping(address => bool) public isOwner;

    uint public numConfirmationsRequired;

    struct Transaction {
        address to;
        uint value;
        bytes data;
        bool executed;
        uint numConfirmations;
    }

    // txIndex => owner => bool
    mapping(uint => mapping(address => bool)) public isConfirmed;

    Transaction[] transactions;

    modifier onlyOwner() {
        require(isOwner[msg.sender], "not owner");
        _;
    }

    modifier txExists(uint _txIndex) {
        require(_txIndex < transactions.length, "tx does not exist");
        _;
    }

    modifier notExecuted(uint _txIndex) {
        require(!transactions[_txIndex].executed, "tx already executed");
        _;
    }

    modifier notConfirmed(uint _txIndex) {
        require(!isConfirmed[_txIndex][msg.sender], "tx already confirmed by you");
        _;
    }


    constructor(uint _numConfirmationsRequired) {

        address[3] memory _owners = 
            [0x367395559a1b8AA49B520409A48e8b1477247b39, 
            0x8E76f8f41ae019016aF18E15F7A80A610E7c61C2, 
            0xc952dc1646699dDFb69E256E83c0AA6de122214c];

        require(_owners.length > 0, "owners required");
        require(_numConfirmationsRequired > 0 && _numConfirmationsRequired <= _owners.length, "invalid number of required confirmations");

        for (uint i = 0; i < _owners.length; i++) {

            address owner = _owners[i];

            require(owner != address(0), "invalid owner");
            require(!isOwner[owner], "owner not unique");

            isOwner[owner] = true;
            owners.push(owner);
        }

        numConfirmationsRequired = _numConfirmationsRequired;
    }


    receive() external payable {
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }


    // Txs should be submit by one of registered owners.
    function submitTransaction(address _to, uint _value, bytes memory _data) public onlyOwner {

        uint txIndex = transactions.length;

        transactions.push(
            Transaction({
                to: _to,
                value: _value,
                data: _data,
                executed: false,
                numConfirmations: 0
            })
        );

        emit SubmitTransaction(msg.sender, txIndex, _to, _value, _data);
    }


    function confirmTransaction(uint _txIndex) public onlyOwner txExists(_txIndex) notExecuted(_txIndex) notConfirmed(_txIndex) {

        Transaction storage transaction = transactions[_txIndex];
        transaction.numConfirmations += 1;
        isConfirmed[_txIndex][msg.sender] = true;

        emit ConfirmTransaction(msg.sender, _txIndex);
    }


    function executeTransaction(uint _txIndex) public onlyOwner txExists(_txIndex) notExecuted(_txIndex) returns (bool success) {

        Transaction storage transaction = transactions[_txIndex];

        require(transaction.numConfirmations >= numConfirmationsRequired, "cannot execute tx");

        transaction.executed = true;

        // value must be provided by this wallet contract
        (success, ) = transaction.to.call{value: transaction.value}(transaction.data);
        require(success, "tx failed");

        emit ExecuteTransaction(msg.sender, _txIndex);
    }


    function batchExecute() public onlyOwner {

        for (uint i=0; i<transactions.length; i++) {

            if(!transactions[i].executed)
                executeTransaction(i);
        }
    }


    function revokeConfirmation(uint _txIndex) public onlyOwner txExists(_txIndex) notExecuted(_txIndex) {

        Transaction storage transaction = transactions[_txIndex];

        require(isConfirmed[_txIndex][msg.sender], "tx not confirmed");

        transaction.numConfirmations -= 1;
        isConfirmed[_txIndex][msg.sender] = false;

        emit RevokeConfirmation(msg.sender, _txIndex);
    }


    function getOwners() public view returns (address[] memory) {
        return owners;
    }


    function getTransactionCount() public view returns (uint) {
        return transactions.length;
    }


    function getTransaction(uint _txIndex) public view returns (address to, uint value, bytes memory data, bool executed, uint numConfirmations) {
        Transaction storage transaction = transactions[_txIndex];
        return (transaction.to, transaction.value, transaction.data, transaction.executed, transaction.numConfirmations);
    }


    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}




// Here is a contract to test sending transactions from the multi-sig wallet

pragma solidity ^0.8.17;

contract TestContract {

    event Received(address sender, uint amount);

    uint public i;

    function callMe(uint j) public payable {
        i += j;
        emit Received(msg.sender, msg.value);
    }


    // to generate some calldata for test mutiSigWallet
    function getData() public pure returns (bytes memory) {
        return abi.encodeWithSignature("callMe(uint256)", 10);
    }


    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}




/*
    1. Constructor()
        _owners : 
            ['0x367395559a1b8AA49B520409A48e8b1477247b39', 
            '0x8E76f8f41ae019016aF18E15F7A80A610E7c61C2', 
            '0xc952dc1646699dDFb69E256E83c0AA6de122214c']

        _numConfirmationsRequired : 3


    2. SubmitTransaction()

        _to: 0x53B741C64dB3F0567334e651ce62BfEe020b802a // address of TestContract
        _value: 1000000000000000000
        _data: 0xe73620c3000000000000000000000000000000000000000000000000000000000000000a // TestContract.callMe(10)

         _to: 0x53B741C64dB3F0567334e651ce62BfEe020b802a // address of TestContract
        _value: 2000000000000000000
        _data: 0xe73620c3000000000000000000000000000000000000000000000000000000000000000a // TestContract.callMe(10)

         _to: 0x53B741C64dB3F0567334e651ce62BfEe020b802a // address of TestContract
        _value: 3000000000000000000
        _data: 0xe73620c3000000000000000000000000000000000000000000000000000000000000000a // TestContract.callMe(10)


    3.  confirmTransaction(_txIndex)
        each of owners can confirm arbitrary numbers of TXs.
        each Tx to be able to execute, have to be confirmed at least by _numConfirmationsRequired of owners
        

    4. 
        First send at least 6 ether to this contract
        because the value of each tx will be sent from SC's balance.

        executeTransaction(0)
        value: 1000000000000000000
        transaction cost:	85_625 gas 

        executeTransaction(1)
        value: 2000000000000000000
        transaction cost:	85_625 gas 

        executeTransaction(2)
        value: 3000000000000000000
        transaction cost:	85_625 gas 

    
        or
            batchExecute()
            transaction cost ( 5 tx in 1 tx) :  266_514 
            running batchExecute() in compare to executeTransaction() save 50% gas per each tx
*/