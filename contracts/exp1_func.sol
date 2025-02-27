// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
//Diya Goyal
//102215255
contract FunctionScope {
     uint256 private  number;
    string private   _string;
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
    function experimentWithScope(string memory _text) public returns (string memory) {
        setText(_text); // Call private function
        return getText(); // Call internal function
    }
}
    

//what is gas and gas limit in remix
