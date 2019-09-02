// AUTHOR:          Federico Giorgio De Faveri
// DATE:            Aug 5th 2019
// PURPOSE:         This is a simple contract that powers an ethereum faucet. This contract is oversimplified and therefore
//                  flawed, do not use it in production.
// BOILERPLATE BY:  Mastering Ethereum by Andreas Antonopulous and Dr. Gavin Wood

contract Faucet {

  //give ether to anyone who asks
  function withdraw(uint withdraw_amount) public {
    //limit withdrawal amount
    require(withdraw_amount <= 100000000000000000);

    //send the amount to the address that requested it
    msg.sender.transfer(withdraw_amount);
  }

  //accept any incoming amount
  //->this function is the "default" function
  //  meaning it gets triggered whenever you send
  //  a transaction to the contract with no other data.
  //  `payable` makes the funds of the tx stay in the contract as balance
  function () public payable {}
}
