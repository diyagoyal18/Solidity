// SPDX-License-Identifier: MIT
// Name: Diya Goyal
// Roll no: 102215255
// Subgroup: 3NC11
pragma solidity ^0.8.0;

contract ProductTracker {
    // State variables
    string public productName;
    uint256 public productPrice;
    bool public isAvailable;

    // Function to set product details
    function setProductDetails(string memory _productName, uint256 _productPrice, bool _isAvailable) public {
        productName = _productName;
        productPrice = _productPrice;
        isAvailable = _isAvailable;
    }

    // Function to get product details
    function getProductDetails() public view returns (string memory, uint256, bool) {
        return (productName, productPrice, isAvailable);
    }
}
