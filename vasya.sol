pragma solidity ^0.4.19;

contract Vasya {
    address owner;
    address last;
    
    uint256 lastAmount = 0;
    
    function Vasya() payable public {
        owner = msg.sender;
        last = msg.sender;
        lastAmount = msg.value;
    }
    
    function put() payable public {
        require(last != msg.sender);
        require(msg.value >= lastAmount * 2);
        last.transfer(lastAmount * 2);
        last = msg.sender;
        lastAmount = msg.value;
    }
  
  function get() constant public returns (uint256, address) {
      return (lastAmount, last);
  }
  
  function kill() public {
    require(msg.sender == owner);
    selfdestruct(owner);
  }
}