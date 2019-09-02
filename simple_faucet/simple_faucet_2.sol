// PURPOSE:         This code improves upon the previously numbered file of the simple_faucet contract.

// Version of the solidity compiler
pragma solidity ^0.4.22;

// the contract
contract faucet {

  address owner;

  // initializes the contract
  constructor() {
      owner = msg.sender;
  }

  //-------the rest of the contract from simple_faucet_1.sol
  //give ether to anyone who asks
  function withdraw(uint withdraw_amount) public {
    //limit withdrawal amount
    require(withdraw_amount <= 100000000000000000);

    //send the amount to the address that requested it
    msg.sender.transfer(withdraw_amount);
  }

  //accept any incoming amount
  function () public payable {}
  //-------end of the contract code from simple_faucet_1.sol

  // define a contract destructor function
  function destroy() public {
    require(msg.sender == owner);
  }

}
