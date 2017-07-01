contract School {

	struct Student {

		string studentName;
		uint studentAge;
		bool active;

	}

	mapping(address => Student) public myStudents;





}