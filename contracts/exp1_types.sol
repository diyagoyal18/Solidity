// SPDX-License-Identifier: GPL-3.0
//Saumya Katiyar 102115248
pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage {

    uint256 public number;
    int256 public  number1;
    bool public  a;
    address public  addressvar;
    string public  stringVar;
    uint256[3] public fixedarray;
    uint256[] public dynamicarray;

    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public {
        number = num;
    }
    function store1(int256 num1) public {
        number1 = num1;
    }
    function store2(bool abc) public {
        a = abc;
    }
    function store3(address addvar) public {
        addressvar = addvar;
    }
    function store4(string memory newst) public {
        stringVar = newst;
    }
    function store5(uint256[3] memory fa) public {
        fixedarray = fa;
    }
    function store6(uint256[] memory da) public returns(uint256[] memory){
        dynamicarray = da;
        return dynamicarray;
    }
    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256,int256,bool,address,string memory,uint256[3] memory,uint256[] memory){
        return (number,
        number1,
        a,
        addressvar,
        stringVar,
        fixedarray,
        dynamicarray
        );

    }}