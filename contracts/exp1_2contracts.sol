// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
// Diya Goyal
//102215255
interface IQuadraticSolver {
    // Function to solve quadratic equation in Contract2
    function solveQuadratic(int256 a, int256 b, int256 c) external pure returns (int256, int256);
}
contract Contract1 {
    IQuadraticSolver public quadraticSolver;
    // Setting the address of Contract2 (QuadraticSolver contract)
    constructor(address _quadraticSolverAddress) {
        quadraticSolver = IQuadraticSolver(_quadraticSolverAddress);
    }
    // Function to accept the coefficients and call Contract2 to solve the quadratic equation
    function solveQuadraticEquation(int256 a, int256 b, int256 c) public view returns (int256, int256) {
        // Call the solveQuadratic function in Contract2
        return quadraticSolver.solveQuadratic(a, b, c);
    }
}
contract Contract2 {
    // Function to solve quadratic equation: ax^2 + bx + c = 0
    // Returns the two roots (x1, x2)
    function solveQuadratic(int256 a, int256 b, int256 c) public pure returns (int256, int256) {
        int256 discriminant = b * b - 4 * a * c; // Calculate the discriminant
        require(discriminant >= 0, "Discriminant must be non-negative"); // Ensure real roots

        // Calculate the two roots using the quadratic formula
        int256 sqrtDiscriminant = sqrt(discriminant); // Get the square root of the discriminant
        int256 root1 = (-b + sqrtDiscriminant) / (2 * a); // First root
        int256 root2 = (-b - sqrtDiscriminant) / (2 * a); // Second root

        return (root1, root2);
    }

    // Helper function to calculate the square root of a number (using a simple approximation)
    function sqrt(int256 x) internal pure returns (int256) {
        int256 z = (x + 1) / 2;
        int256 y = x;
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
        return z;
    }
}


//what is gas and gas limit in remix
