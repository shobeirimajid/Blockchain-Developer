// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;
pragma abicoder v2;

import "https://github.com/Uniswap/v2-core/blob/master/contracts/interfaces/IUniswapV2Pair.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract Uniswap2 {

  // calculate price based on pair reserves
  function getTokenPrice(address pairAddress, uint amount) public view returns(uint) {

    IUniswapV2Pair pair = IUniswapV2Pair(pairAddress);

    IERC20 token1 = IERC20(pair.token1);

    (uint Res0, uint Res1,) = pair.getReserves();

    // decimals
    uint res0 = Res0*(10**token1.decimals());

    // return amount of token0 needed to buy token1
    return((amount*res0)/Res1); 
    
  }

}