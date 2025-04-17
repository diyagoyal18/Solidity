// SPDX-License-Identifier: MIT
// Name: Diya Goyal
// Roll no: 102215255
// Subgroup: 3NC11
pragma solidity ^0.8.0;

contract EmployeeSalaries {
    // Mapping to store employee salaries based on their unique ID
    mapping(uint256 => uint256) private employeeSalaries;
    // Event to log salary updates
    event SalaryUpdated(uint256 indexed employeeId, uint256 salary);
    // Function to update or add an employee's salary
    function updateSalary(uint256 employeeId, uint256 salary) public {
        require(employeeId > 0, "Invalid employee ID");
        require(salary > 0, "Salary must be greater than zero");

        employeeSalaries[employeeId] = salary;
        emit SalaryUpdated(employeeId, salary);
    }
    // Function to retrieve an employee's salary
    function getSalary(uint256 employeeId) public view returns (uint256) {
        require(employeeId > 0, "Invalid employee ID");
        require(employeeSalaries[employeeId] > 0, "Salary not found");
        return employeeSalaries[employeeId];
    }
}
