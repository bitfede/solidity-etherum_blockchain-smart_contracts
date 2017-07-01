contract School {

	struct Student {

		string studentName;
		uint studentAge;
		bool active;

	}

	mapping(address => Student) public myStudents;

	function register (string _myName, uint myAge) {

		myStudents[msg.sender] = Student({

			studentName: _myName,
			studentAge: _myAge,
			active: true
			
			});
	}



}