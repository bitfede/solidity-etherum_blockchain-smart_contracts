// AUTHOR: 		Federico Giorgio De Faveri
// DATE: 			Jul 1st 2017
// PURPOSE: 	This smart contract creates a super simple school contract. Students are able to interact
//						with this contract by registering to the school, provided that they pay a fee in Ether.
//						The list of students is permanently stored in the blockchain and it is immutable, just
//						like the transaction history of all the contract interactions. 100% transparency.
//						This contract can be deployed to the Ethereum blockchain.
// LANGUAGE:  Solidity

contract School {

	// here we create a student struct. just like we do in Java with objects.
	struct Student {
		// student struct will hold a string, an unsigned integer and a boolean

		string studentName;
		uint studentAge;
		bool active;

	}

	// this is an unsigned integer of 256 bits. The Ethereum Virtual Machine (EVM) works with 256 bit units.
	// In Solidity you can give unsigned integers different sizes, for example by declaring `uint8`. But the contract will
	// require more Gas because it requires the EVM to do more computational work to split its standard 256 bit size.
	uint256 public registrationFee;

	// Here we create a dictionary/list of Student structs, and it will be indexed by ETH address instead of numbers.
	mapping(address => Student) public myStudents;

  // This is the constructor function. In Solidity the constructor has the same of the contract.
  // It is only called and executed once, when the contract is first created and deployed to the Ethereum Blockchain.
	function School (uint256 initialRegistrationFee) {

		// here we are accepting an unsigned integer, the initial registration fee
		// and we are assigning it to the variable previously declared
		registrationFee = initialRegistrationFee;

	}

	// This is a regular function. Users can use functions like this to interact with this contract.
	// This function below is the registration function, and students will use it to register to our school.
	function register (string _myName, uint myAge) {

		// we accept a string for the student name and an unsigned int as the student age.

		// here we check if the student has sent the registration fee in ether.
		if (msg.value == registrationFee) {

			// the student has sent the correct fee, therefore we go ahead and register him.
			myStudents[msg.sender] = Student({

				studentName: _myName,
				studentAge: _myAge,
				active: true

				});

		}
		else {

			// the student has not sent the correct fee, or an error occurred during the transaction.
			// therefore we use "throw" to stop the contract flow and reimburse the student.
			throw;

		}

	}

	// this function can be used to set a new registration fee.
	// NOTE: this an unsafe implementation of setFee because anybody can modify the fee.
	//       but for the sake of this simple contract we are assuming that 
	//       all students have good and fair intentions.
	function setFee (uint256 _newRegistrationFee) {

		registrationFee = _newRegistrationFee;

	}

}