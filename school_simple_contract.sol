contract School {

	struct Student {

		string studentName;
		uint studentAge;
		bool active;

	}

	uint256 public registrationFee;

	mapping(address => Student) public myStudents;

	function register (string _myName, uint myAge) {

		myStudents[msg.sender] = Student({

			studentName: _myName,
			studentAge: _myAge,
			active: true

			});
	}

	function setFee(uint256 _newRegistrationFee) {

		registrationFee = _newRegistrationFee;
		
	}

}