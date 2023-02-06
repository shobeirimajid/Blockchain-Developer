// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <0.9.0;

contract Token {

    // 'TokenCreator' is a contract type that is defined below.
    // It is fine to reference it as long as it is not used to create a new contract.
    TokenCreator creator;
    address owner;
    string name;

    // This is the constructor which registers the
    // creator and the assigned name.

    constructor(string memory name_) {

        name = name_;

        // "State variables" are accessed "via their name" and not via e.g. "this.owner"
        // "Functions" can be accessed "directly" or through "this.f"
        //    "this.f" provides an "external" view to the function.
        //    Especially in the constructor, you should not access functions externally, because the function does not exist yet.
        owner = msg.sender;

        // This code, does not create a new contract!
        // Just perform an "explicit type conversion" from "address" to "TokenCreator" 
        // assume that the type of the calling contract is "TokenCreator", even though there is no real way to verify that.
        creator = TokenCreator(msg.sender);
    }

    function changeName(string memory newName) public {

        // Only the creator can alter the name.
        // We compare the contract based on its address which can be retrieved by explicit conversion to address.
        if (msg.sender == address(creator)) {
            name = newName;
            creator.modifyName(address(this), newName);
        }
    }

    function changeOwner(address newOwner) public {

        // Only the current owner can change owner of the token.
        if (msg.sender != owner) 
            return;

        // We ask the creator contract if the changeOwner should proceed by using "isChangeOwnerOK" function of the `TokenCreator` contract.
        // If the call fails (e.g. due to out-of-gas), the execution also fails here.
        if (creator.isChangeOwnerOK(owner, newOwner))
            owner = newOwner;
    }
}



contract TokenCreator {

    mapping(address => string) public tokenNames;
    address[] public tokenAdrs;

    function createToken(string memory name) public returns (Token tokenType) {

        // Create a new "Token" contract and return its address.
        tokenType = new Token(name);

        tokenNames[address(tokenType)] = name;
        tokenAdrs.push(address(tokenType));
 
        // return new Token(name);
        // In this case, the return type of this function, From the JavaScript side is `address`
        // as this is the closest type available in the ABI.

        return tokenType;
    }


    function changeName(Token tokenAddress, string memory newName) public {
        // put to function modifyName
        //tokenNames[address(tokenAddress)] = newName;

        // Again, the external type of `tokenAddress` is simply `address`.
        tokenAddress.changeName(newName);
    }

    // to call externally by Token, When Token.changeName has been called.
    function modifyName(address tokenAddress, string memory newName) external {
        tokenNames[tokenAddress] = newName;
    }

    function changeOwnerOfToken(Token tokenAddress, address newOwner_) public {
        tokenAddress.changeOwner(newOwner_);
    }

    // Perform checks to determine if transferring a token to the `Token` contract should proceed
    function isChangeOwnerOK(address currentOwner, address newOwner) public pure returns (bool isOk) {
        // Check an arbitrary condition to see if isChangeOwnerOK should proceed or not

        // return keccak256(abi.encodePacked(currentOwner, newOwner))[0] == 0x7f;
        return true;
    }
}