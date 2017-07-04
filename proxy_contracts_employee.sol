// AUTHOR: 		Federico Giorgio De Faveri
// DATE: 			Jul 4th 2017
// PURPOSE: 	This smart contract aims to introduce in a very simple way the notion of PROXY CONTRACTS in Solidity.
//						It will be accomplished by creating an `employee` contract, which can be modified by an `employer` contract
//						
// LANGUAGE:  Solidity

contract Employee {

	//variables
	string public employeeName;
	uint public employeeAge;
	string public employeeRole;

	//constructor
	function Employee(string _name , uint _age) {
		employeeName = _name;
		employeeAge = _age;
	}

	function setEmployeeRole(string _role) {
		employeeRole = _role;
	}

}

contract Employer {

	address public employeeAddress;

	function Employer(address _addressOfTheEmployee) {

		employeeAddress = _addressOfTheEmployee;
		
	}

	function assignRoleToEmployee(string _role) {

		Employee myEmployee = Employee(employeeAddress);
		myEmployee.setEmployeeRole(_role);
		
	}
}