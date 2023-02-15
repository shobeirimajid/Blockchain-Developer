// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;
pragma abicoder v2;

//import "https://github.com/Uniswap/uniswap-v3-periphery/blob/main/contracts/interfaces/ISwapRouter.sol";
//import "https://github.com/Uniswap/uniswap-v3-periphery/blob/main/contracts/interfaces/IQuoter.sol";
import '@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol';
import '@uniswap/v3-periphery/contracts/interfaces/IQuoter.sol';

interface IUniswapRouter is ISwapRouter {
    function refundETH() external payable;
}

contract Uniswap3 {

  IUniswapRouter public constant uniswapRouter = IUniswapRouter(0xE592427A0AEce92De3Edee1F18E0157C05861564);
  IQuoter public constant quoter = IQuoter(0xb27308f9F90D607463bb33eA1BeBb41C27CE5AB6);
  address private constant multiDaiKovan = 0xdc31Ee1784292379Fbb2964b3B9C4124D8F89C60; //0x4F96Fe3b7A6Cf9725f59d353F723c1bDb64CA6Aa;
  address private constant WETH9 = 0xb4fbf271143f4fbf7b91a5ded31805e42b2208d6; //0xd0A1E359811322d97991E03f863a0C30C2cF029C;



  function convertExactEthToDai() external payable {

    require(msg.value > 0, "Must pass non 0 ETH amount");

    uint256 deadline = block.timestamp + 15; // using 'now' for convenience, for mainnet pass deadline from frontend!
    address tokenIn = WETH9;
    address tokenOut = multiDaiKovan;
    uint24 fee = 3000;
    address recipient = msg.sender;
    uint256 amountIn = msg.value;
    uint256 amountOutMinimum = 1;
    uint160 sqrtPriceLimitX96 = 0;
    
    ISwapRouter.ExactInputSingleParams memory params = ISwapRouter.ExactInputSingleParams(
        tokenIn,
        tokenOut,
        fee,
        recipient,
        deadline,
        amountIn,
        amountOutMinimum,
        sqrtPriceLimitX96
    );
    
    uniswapRouter.exactInputSingle{ value: msg.value }(params);
    uniswapRouter.refundETH();
    
    // refund leftover ETH to user
    (bool success,) = msg.sender.call{ value: address(this).balance }("");
    require(success, "refund failed");
  }
  


  function convertEthToExactDai(uint256 daiAmount) external payable {

    require(daiAmount > 0, "Must pass non 0 DAI amount");
    require(msg.value > 0, "Must pass non 0 ETH amount");
      
    uint256 deadline = block.timestamp + 15; // using 'now' for convenience, for mainnet pass deadline from frontend!
    address tokenIn = WETH9;
    address tokenOut = multiDaiKovan;
    uint24 fee = 3000;
    address recipient = msg.sender;
    uint256 amountOut = daiAmount;
    uint256 amountInMaximum = msg.value;
    uint160 sqrtPriceLimitX96 = 0;

    ISwapRouter.ExactOutputSingleParams memory params = ISwapRouter.ExactOutputSingleParams(
        tokenIn,
        tokenOut,
        fee,
        recipient,
        deadline,
        amountOut,
        amountInMaximum,
        sqrtPriceLimitX96
    );

    uniswapRouter.exactOutputSingle{ value: msg.value }(params);
    uniswapRouter.refundETH();

    // refund leftover ETH to user
    (bool success,) = msg.sender.call{ value: address(this).balance }("");
    require(success, "refund failed");
  }
  


  // do not used on-chain, gas inefficient!
  function getEstimatedETHforDAI(uint daiAmount) external payable returns (uint256) {
    
    address tokenIn = WETH9;
    address tokenOut = multiDaiKovan;
    uint24 fee = 3000;
    uint160 sqrtPriceLimitX96 = 0;

    return quoter.quoteExactOutputSingle(
        tokenIn,
        tokenOut,
        fee,
        daiAmount,
        sqrtPriceLimitX96
    );
  }
  
  // important to receive ETH
  receive() payable external {}
}