contract School {

	struct Student {

		string studentName;
		uint studentAge;
		bool active;

	}

	uint256 public registrationFee;

	mapping(address => Student) public myStudents;

	function School (uint256 initialRegistrationFee) {

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