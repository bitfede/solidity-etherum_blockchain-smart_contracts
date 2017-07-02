// AUTHOR: 		Federico Giorgio De Faveri
// DATE: 			Jul 2nd 2017
// PURPOSE: 	This smart contract aims to introduce in a very simple way the notion of MODIFIERS in Solidity.
//						It will be accomplished by creating an "onlyOwner" modifier that will be used to secure some critical
//						function in our school contract that were previously unrestricted from the public
// LANGUAGE:  Solidity


contract OwnedByFederico {

	string public brandName = "Fede Development";

	address public owner;

  function OwnedByFederico() {

  	owner = msg.sender;

  }

  // this is the MODIFIER. it checks that whoever is triggering this action is the owner
  modifier onlyOwner {

  	// this is the checking condition
  	if (msg.sender != owner) {

  		// if you are not the owner dont allow further interaction with the contract.
  		throw;

  	}
  	else {

  		// in this case you are the owner, so you allow interaction
  		//pay attention! No semicolon here!
  		_

  	}

  } 

  function killTheContract() {

  	suicide(owner);

  }

}


contract ProgrammingSchool is OwnedByFederico {

	struct Student {

		string studentName;
		uint studentAge;
		bool active;

	}

	uint256 public registrationFee;

	mapping(address => Student) public myStudents;

	function ProgrammingSchool (uint256 initialRegistrationFee) {

		registrationFee = initialRegistrationFee;

	}

	function register (string _myName, uint myAge) {


		if (msg.value == registrationFee) {

			myStudents[msg.sender] = Student({

				studentName: _myName,
				studentAge: _myAge,
				active: true

				});

		}
		else {

			throw;

		}

	}

	function setFee (uint256 _newRegistrationFee) {

		registrationFee = _newRegistrationFee;

	}

}