// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage {

     uint256 public number;
    bool public a;
    address public addvar;
    uint256[3] public fixedarray;
    int248 public integer;
    uint256[] public dynamicarray;
    string public _string;
    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num, bool b, address addressvar, uint256[3] memory fixarr, int248 integ, uint256[] memory dynarr, string memory _str) public {
        number = num;
        a=b;
        addvar=addressvar;
        fixedarray=fixarr;
        integer= integ;
        dynamicarray= dynarr;
        _string= _str;
    }
    

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256,bool, address, uint256[3] memory, int248, uint256[] memory, string memory){
        return(
            number,a,addvar, fixedarray, integer, dynamicarray, _string
        );
        
    }
    
}
//what is gas and gas limit in remix
