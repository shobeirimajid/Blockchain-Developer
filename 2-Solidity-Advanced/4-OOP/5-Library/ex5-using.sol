// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

library Array {

    function indexOf(uint[] storage self, uint value) public view returns (uint) {

        for (uint i = 0; i < self.length; i++)
            if (self[i] == value) 
                return i;

        return type(uint).max;
    }


    // Array function to delete element at index and re-organize the array
    // so that there are no gaps between the elements

    function remove(uint[] storage arr, uint index) public {

        require(arr.length > 0, "Can't remove from empty array");

        // Move the last element into the place to delete
        arr[index] = arr[arr.length - 1];

        // drop last element
        arr.pop();
    }
}


// extend built-in types
// In this example, we will use a library

using Array for uint[];


contract TestArray {

    uint[] public arr;


    function append(uint value) public {

        arr.push(value);
    }


    function testReplace(uint oldValue, uint newValue) public {

        // This performs the library function call
        uint index = arr.indexOf(oldValue);

        if (index == type(uint).max)
            arr.push(newValue);
        else
            arr[index] = newValue;
    }


    function testRemove(uint index) public {

        arr.remove(index);
    }

}