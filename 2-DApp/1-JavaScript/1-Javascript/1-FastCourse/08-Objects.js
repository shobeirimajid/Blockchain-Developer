///////////////////////////////////////////////////////
//                      Objects
///////////////////////////////////////////////////////

// JavaScript's objects are equivalent to "dictionaries" or "maps" in other languages.
//  maps: an unordered collection of key-value pairs.
var myObj = {key1: "Hello", key2: "World"};

// Keys are strings, but quotes aren't required if they're a valid JavaScript identifier.
// Values can be any type.
var myObj = {
    myKey: "myValue", 
    "my other key": 4
};

// Object attributes can also be accessed using the subscript syntax,
myObj["my other key"]; // = 4

// ... or using the dot syntax, provided the key is a valid identifier.
myObj.myKey; // = "myValue"

// Objects are mutable; values can be changed and new keys added.
myObj.myThirdKey = true;

// If you try to access a value that's not yet set, you'll get undefined.
myObj.myFourthKey; // = undefined