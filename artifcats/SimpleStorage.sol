//SPDX-License-Identifier: MIT -- make licensing and code sharing easier(optional)
//'^' means any version above 0.8.7 can  be used
pragma solidity ^0.8.7; //0.8.12
//pragma solidity >=0.8.7 <0.9.0;  any version van be used within this range

//DATA TYPES
// bool hasFavoritenumber = true;
// string favoriteNumberInText = "five";
// int256 favoriteInt = -5;
// address myAddress = 0x07b9Ee73b5667e06f4493BdBDb928d3Db141ce38;
// bytes32 favoriteBytes = "cat";
//contract -- tells compiler next section of code will be a contract
contract SimpleStorage{
    
    uint256 public favoriteNumber;  //viewing its value via public function do not cost fees
    //virtual: to make the function overrridable.
    function store(uint256 _favoriteNumber) public virtual {
        _favoriteNumber = favoriteNumber;
        //retrieve() despite a call function will cost fees since called inside store function
        //which costs gas fees
        retrieve();
    }

    //view, pure or other call function do not cost any gas fees
    function retrieve() public view returns(uint256){
    return favoriteNumber;
    }

    //STRUCT DATA STRUCTURE
    struct People{
        uint favoriteNumber;
        string name;
    }

    People public person1 = People({favoriteNumber:125, name:"Bhavesh"});

    //ARAY DATA STRUCTURE
    People[] public persons;  //dynamic array

    //MAPPING - creates a dictionary data structure
    mapping(string => uint256) public nameToFavoriteNumber;

    //add person to the persons array of struct type(costs gas fees)
    function addPerson(string memory name, uint256 _favoriteNumber) public {
        //persons.push(People(_favoriteNumber, name));
        //other way
        People memory newPerson = People({favoriteNumber:_favoriteNumber, name:name});
        persons.push(newPerson);
        nameToFavoriteNumber[name] = _favoriteNumber;
    }
}

