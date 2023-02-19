// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;

contract Getter {

    uint[] public myArray;

    mapping(uint => uint) public map;


    // The mapping and arrays (with the exception of byte arrays) 
    // in the struct are omitted in getter
    // because there is no good way to select individual struct members 
    //   or provide a key for the mapping

    struct Data {
        uint a;
        bytes3 b;                       
        //mapping(uint => uint) map;    // mapping inside struct    / omitted in getter
        uint[3] c;                      // array inside struct      / omitted in getter
        uint[] d;                       // array inside struct      / omitted in getter
        bytes e;
    }
    Data[] public dataAry;

    mapping(uint => mapping(bool => Data[])) public data;


    // function that returns entire array
    function getArray() public view returns (uint[] memory) {
        return myArray;
    }


    // function that returns entire mapping
    // dosen't work
    // Type mapping(uint256 => uint256) is only valid in storage because it contains a (nested) mapping.
    /*
    function getEntrieMap() internal returns (mapping(uint => uint) memory) {
        return map;
    }
    */


    function setArray(uint elm) public {
        myArray.push(elm);
    }


    function setMap(uint key, uint value) public {
        map[key] = value;
    }


    function setDataAry(  

        uint _a, 
        bytes3 _b, 
        // mapping(uint => uint) storage _map,
        uint[3] memory _c,
        uint[] memory _d,
        bytes memory _e

    ) public {

        //mapping(uint => uint) storage _map = map;

        dataAry.push( 
            Data(_a, _b, /*_map,*/ _c, _d, _e) 
        );
    }


    function setDataMap(

        uint _key1, 
        bool _key2

        //Data[] storage _dataAry

    ) public {

        data[_key1][_key2] = dataAry;

    }
}