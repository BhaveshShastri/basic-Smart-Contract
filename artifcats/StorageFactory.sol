//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory{

    //stores and returns address of contract
    SimpleStorage[] public simpleStorageArray;

    //creating smart contract using another contract
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    //interaction with other contracts
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        /**to interact we need :
          *Address
          *ABI(Application Binary Interface
          */
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) view public returns(uint256){
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.retrieve();
    }
}