// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract FunctionScope {

     uint256 private  number;
    string private   _string;
    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public returns(string memory) {
        number = num;
        return "data is set";
    }
    function setText(string memory _text) private {
        _string = _text;
    }
    function getText() internal view returns (string memory) {
        return _string;
    }
    function multiply(uint256 a, uint256 b) external pure returns (uint256) {
        return a * b;
    }
    function getData() public view returns (uint256) {
        return number;
    }
    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function experimentWithScope(string memory _text) public returns (string memory) {
        setText(_text); // Call private function
        return getText(); // Call internal function
    }
}
    

//what is gas and gas limit in remix
