// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.25 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
// import "truffle/console.sol";             // work along with "truffle-assertions"
// import "console.sol";  // work along with "ganache"
import "@ganache/console.log/console.sol";  // work along with "ganache"

contract MyToken is ERC20, Ownable {
    constructor() ERC20("MyToken", "MTK") {}

    function safeMint(address account, uint amount) public onlyOwner {
        
        _mint(account, amount);
        console.log("minted tokens count: ", amount);
        
    }
}