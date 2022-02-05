pragma solidity >=0.6.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract PaymentProcessor {
    address public merchantAddress;
    IERC20 public dai;

    event PaymentDone(
        address payer,
        uint amount,
        uint paymentId,
        uint date
    );

    constructor(address _merchantAddress, address daiAddress){
        merchantAddress = _merchantAddress;
        dai = IERC20(daiAddress);
    }

    function pay(uint amount, uint paymentId) external {
        dai.transferFrom(msg.sender, merchantAddress, amount);
        emit PaymentDone(msg.sender, amount, paymentId, block.timestamp);
    }
}