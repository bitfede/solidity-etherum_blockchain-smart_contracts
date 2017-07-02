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

  // here I added the `onlyOwner` modifier, now only the owner of the contract can kill it by executing this function!
  function killTheContract() onlyOwner {

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

	// for additional safety for the school students, I'm adding another modifier that allows the owner to
	// modify the fee of registration, ONLY after a month has passed from the contract deployment date.
	// again this increases trust in students because they know that for a month the school fee will not change.

	modifier onlyAfterOneMonth {
		
		// now is a built in function is solidity, and takes the timestamp of the current block. timestamp is in UNIX format.
		// Solidity support native language time suffix: minutes, hours, days, weeks and years.
    if (now < 1499008603 + 30 days) {

    	// following code is the same as the modifier `onlyOwner` above
    	throw;

    }
    else {

    	_

    }
	}


  // here I added the `onlyOwner` modifier, now only the owner of the contract can change the course/school fee.
  // I also added the `onlyAfterOneMonth` modifier, to give additional security and peace of mind to students.
	function setFee (uint256 _newRegistrationFee) onlyOwner onlyAfterOneMonth {

		registrationFee = _newRegistrationFee;

	}

}