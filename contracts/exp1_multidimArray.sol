// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
// Diya Goyal
//102215255
contract MultiDimArrayBasic {
    uint[][] private multiArray;

    // Add a new row to the multidimensional array
    function addRow(uint[] memory _row) public {
        multiArray.push(_row);
    }

    // Get an element from the multidimensional array at a specific row and column
    function getElement(uint _row, uint _col) public view returns (uint) {
        require(_row < multiArray.length, "Row index out of bounds");
        require(_col < multiArray[_row].length, "Column index out of bounds");
        return multiArray[_row][_col];
    }

    // Get all elements of a specific row
    function getRow(uint _row) public view returns (uint[] memory) {
        require(_row < multiArray.length, "Row index out of bounds");
        return multiArray[_row];
    }
}
// Contract for Modifying Multidimensional Array Elements
contract MultiDimArrayModify {
    uint[][] private multiArray;

    // Update an element in the multidimensional array at a specific row and column
    function updateElement(uint _row, uint _col, uint _value) public {
        require(_row < multiArray.length, "Row index out of bounds");
        require(_col < multiArray[_row].length, "Column index out of bounds");
        multiArray[_row][_col] = _value;
    }

    // Delete a row from the multidimensional array
    function deleteRow(uint _row) public {
        require(_row < multiArray.length, "Row index out of bounds");
        for (uint i = _row; i < multiArray.length - 1; i++) {
            multiArray[i] = multiArray[i + 1];
        }
        multiArray.pop();
    }
}

// Contract for Array Operations - Size and Access
contract MultiDimArraySizeAccess {
    uint[][] private multiArray;

    // Get the total number of rows in the multidimensional array
    function getRowCount() public view returns (uint) {
        return multiArray.length;
    }

    // Get the total number of columns in a specific row
    function getColumnCount(uint _row) public view returns (uint) {
        require(_row < multiArray.length, "Row index out of bounds");
        return multiArray[_row].length;
    }

    // Get the number of elements in the entire array
    function getTotalElementCount() public view returns (uint) {
        uint totalCount = 0;
        for (uint i = 0; i < multiArray.length; i++) {
            totalCount += multiArray[i].length;
        }
        return totalCount;
    }
}
// Contract for Iterating Through the Multidimensional Array
contract MultiDimArrayIteration {
    uint[][] private multiArray;
    // Get all elements from all rows in the multidimensional array
    function getAllElements() public view returns (uint[] memory) {
        uint totalCount = 0;
        // Calculate total number of elements
        for (uint i = 0; i < multiArray.length; i++) {
            totalCount += multiArray[i].length;
        } 
        uint[] memory allElements = new uint[](totalCount);
        uint index = 0;
        // Fill the allElements array with the multidimensional array elements
        for (uint i = 0; i < multiArray.length; i++) {
            for (uint j = 0; j < multiArray[i].length; j++) {
                allElements[index] = multiArray[i][j];
                index++;
            }
        }
        return allElements;
    }
    // Get a specific element from a flattened view of the multidimensional array
    function getElementFlat(uint _index) public view returns (uint) {
        uint totalCount = 0;
        // Find the row and column that corresponds to the flattened index
        for (uint i = 0; i < multiArray.length; i++) {
            if (_index < totalCount + multiArray[i].length) {
                return multiArray[i][_index - totalCount];
            }
            totalCount += multiArray[i].length;
        }
        revert("Index out of bounds");
    }
}
//what is gas and gas limit in remix
