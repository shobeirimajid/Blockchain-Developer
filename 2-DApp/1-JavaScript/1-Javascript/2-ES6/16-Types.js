///////////////////////////////////////////////////////
//                     typeof
///////////////////////////////////////////////////////
/*

//---------------------
    Data Types
//---------------------

Primitive :  A primitive data value is a single simple data value with no additional properties and methods.
Complex   :  A complex data value can includes additional properties and methods.


In JavaScript there are 7 different `data types` :

        Primitive DataTypes |    1. string
                            |    2. number
                            |    3. boolean
                            |    4. undefined    // can't contain `values` 

        Complex DataTypes   |    5. function
                            |    6. object

                            |    7. null         // can't contain `values`



//---------------------
    Objects
//--------------------- 

There are 6 types of `objects` in JS :

    1. String
    2. Number
    3. Boolean
    1. Object
    2. Date
    3. Array

*/


//---------------------
// typeof
//---------------------
// typeof is a operator that returns a string (type of the operand)
// you can use the typeof operator to find the data type of a JavaScript variable.
// The typeof operator can return one of these primitive types:

    // string
    // number
    // boolean
    // undefined


    //----------------
    // Primitive
    //----------------
    typeof "John"                 // Returns "string"
    typeof 3.14                   // Returns "number"
    typeof NaN                    // Returns "number"
    typeof false                  // Returns "boolean"
    typeof myCar                  // Returns "undefined" *

    //----------------
    // Complex 
    //----------------
    typeof [1,2,3,4]              // Returns "object"
    typeof {name:'John', age:34}  // Returns "object"
    typeof new Date()             // Returns "object"
    typeof null                   // Returns "object"
    typeof function myFunc() {}   // Returns "function"

/*
        typeof(NaN)         :   number
        typeof(date)        :   object
        typeof(array)       :   object
        typeof(null)        :   object
        typeof(function)    :   function
        typeof(undefined)   :   undefined *
        typeof(variable)    :   undefined *
                  |
                  |
                that has not been assigned a value
*/

    //----------------
    // typeof arrays
    //----------------
    // The typeof operator returns "object" for arrays 
    //  because in JavaScript arrays are object

    // You cannot use `typeof` to determine if a JavaScript object is an `array` (or a `date`)
    //   typeof both of them will be object




//---------------------
// constructor
//---------------------
// constructor property returns the constructor function for all JavaScript variables

"John".constructor                // String()   {[native code]}
(3.14).constructor                // Number()   {[native code]}
false.constructor                 // Boolean()  {[native code]}
[1,2,3,4].constructor             // Array()    {[native code]}
{name:'John',age:34}.constructor  // Object()   {[native code]}
new Date().constructor            // Date()     {[native code]}
function myFunc() {}.constructor  // Function() {[native code]}



// You can check the constructor property to find out 
//   if an object is an Array (contains the word "Array")
function isArray(myArray) {
    return myArray.constructor.toString().indexOf("Array") > -1;
}

// Or even simpler, you can check if the object is an Array function:
function isArray(myArray) {
    return myArray.constructor === Array;
}



// You can check the constructor property to find out 
//    if an object is a Date (contains the word "Date")
function isDate(myDate) {
    return myDate.constructor.toString().indexOf("Date") > -1;
}

// Or even simpler, you can check if the object is a Date function:
function isDate(myDate) {
    return myDate.constructor === Date;
}


//---------------------
// Undefined
//---------------------
// In JavaScript, a variable without a value, has the value undefined
// The type is also undefined

let car;    // Value is undefined, type is undefined

// Any variable can be emptied, by setting the value to undefined 
// The type will also be undefined

car = undefined;    // Value is undefined, type is undefined



//---------------------
// Empty Values
//---------------------
// An empty value has nothing to do with undefined.
// An empty string has both a legal value and a type.

let mycar = "";    // value is ""  ,  typeof is "string"



//---------------------
// Null
//---------------------
// In JavaScript null is "nothing" 
// It is supposed to be something that doesn't exist

// Unfortunately, in JavaScript, the `data type` of `null` is an `object`
//  You can consider it a `bug in JavaScript`
//  It should be `null`



// You can empty an object by setting it to null:

let person = {firstName:"John", lastName:"Doe", age:50, eyeColor:"blue"};

person = null;          // value  is   `null`
                        // type   is   `object`


// You can also empty an object by setting it to undefined:

let persons = {firstName:"John", lastName:"Doe", age:50, eyeColor:"blue"};

persons = undefined;    // value    is  undefined
                        // type     is  undefined



//---------------------
//  Undefined vs Null
//---------------------
/*
`undefined` and `null` are :

      equal         in value 
      different     in type
*/

typeof undefined           // undefined
typeof null                // object

null === undefined         // false
null == undefined          // true



//---------------------
//  instanceof
//---------------------
// The instanceof operator returns true 
//   if an object is an instance of the specified object

const cars = ["Saab", "Volvo", "BMW"];

(cars instanceof Array);    // true
(cars instanceof Object);   // true
(cars instanceof String);   // false
(cars instanceof Number);   // false



//---------------------
//  void 
//---------------------
// The void operator evaluates an expression and returns undefined. 
// This operator is often used to obtain the undefined primitive value, using "void(0)"
//   (useful when evaluating an expression without using the return value)

/*
    <a href="javascript:void(0);">
        Useless link
    </a>

    <a href="javascript:void(document.body.style.backgroundColor='red');">
        Click me to change the background color of body to red
    </a>
*/



































