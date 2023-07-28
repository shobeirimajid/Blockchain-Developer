// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

error EtherTransferFail(address emitter);

contract BatchDistributor {

    using SafeERC20 for IERC20;

    struct Transaction {
        address payable recipient;
        uint256 amount;
    }

    Transaction[] txns;
    
    constructor() payable {}


    function pushTx(address _recipient, uint256 _amount) external {
        txns.push(Transaction(payable(_recipient), _amount));
    }


    function getTx() public view returns(Transaction[] memory) {
        return txns;
    }


    function distributeEther() external payable {

        Transaction[] memory _txns = getTx();

        uint256 length = _txns.length;


        for (uint256 i; i < length; i++) {
        
            (bool sent, ) = txns[i].recipient.call{
                value: _txns[i].amount
            }("");
            if (!sent) revert EtherTransferFail(address(this));
        }

        uint256 balance = address(this).balance;

        if (balance != 0) {
            (bool refunded, ) = payable(msg.sender).call{value: balance}("");
            if (!refunded) revert EtherTransferFail(address(this));
        }
    }


    function distributeToken(IERC20 token) external {

        Transaction[] memory _txns = getTx();

        uint256 length = _txns.length;

        uint256 total;

        for (uint256 i; i < length; i++) {
            total += _txns[i].amount;
        }

        token.safeTransferFrom(msg.sender, address(this), total);

        for (uint256 i; i < length; i++) {
            token.safeTransfer(_txns[i].recipient, _txns[i].amount);
        }
    }
}

/*
    [
        0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2,1000000000000000000000,
        0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db,1000000000000000000000,
        0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB,1000000000000000000000,
        0x617F2E2fD72FD9D5503197092aC168c91465E7f2,1000000000000000000000,
        0x17F6AD8Ef982297579C203069C1DbfFE4348c372,1000000000000000000000
    ]
*/