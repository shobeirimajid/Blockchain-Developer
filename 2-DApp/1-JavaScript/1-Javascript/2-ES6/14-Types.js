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



//---------------------
//  Type Conversion
//---------------------
/*
    Strings   ->  Numbers
    Numbers   ->  Strings
    Dates     ->  Numbers
    Numbers   ->  Dates
    Booleans  ->  Numbers
    Numbers   ->  Booleans

    JavaScript variables can be converted to a new variable and another data type:

        - By the use of a JavaScript function
        - Automatically by JavaScript itself
*/



//-----------------------------
//  Strings   ->  Numbers
//-----------------------------
/*
    Method	            Description
    ------------      -----------------------------------------------------
    Number()	        Returns a number, converted from its argument
    parseFloat()	    Parses a string and returns a floating point number
    parseInt()	        Parses a string and returns an integer
*/

// The global method Number() converts a variable (or a value) into a number.

    Number("3.14")      //  3.14
    Number(Math.PI)     //  3.141592653589793
    Number(" ")         //  0
    Number("")          //  0

    // non numeric string will not convert:

    Number("99 88")     //  NaN (Not a Number)
    Number("John")      //  NaN (Not a Number)


// + (Unary Operator)
// `+` can be used to convert a variable to a number
let y = "5";      // y is a string
let x = + y;      // x is a number

// If the variable cannot be converted, 
// it will still become a number, but with the value NaN (Not a Number):

y = "John";   // y is a string
x = + y;      // x is a number (NaN)



//-----------------------------
//  Numbers   ->  Strings
//-----------------------------
/*
    Method	            Description
    ----------------    ------------------------------------------------------------------------------
    toExponential()	    Returns a string, with a number rounded and written using exponential notation.
    toFixed()	        Returns a string, with a number rounded and written with a specified number of decimals.
    toPrecision()	    Returns a string, with a number written with a specified length
*/


// The global method String() can convert numbers to strings.
// It can be used on any type of numbers, literals, variables, or expressions:

String(x)         // returns a string from a number variable x
String(123)       // returns a string from a number literal 123
String(100 + 23)  // returns a string from a number from an expression

// The Number method toString() does the same.

x.toString()
(123).toString()
(100 + 23).toString()


//-----------------------------
//  Dates  ->  Numbers
//-----------------------------

// The global method Number() can be used to convert dates to numbers.

d = new Date();
Number(d)          // returns 1404568027739


// The date method getTime() does the same.

d = new Date();
d.getTime()        // returns 1404568027739



//-----------------------------
//  Dates  ->  Strings
//-----------------------------
/*
    Method	            Description
    ----------------    -----------------------------------------------------
    getDate()	        Get the day as a number (1-31)
    getDay()	        Get the weekday a number (0-6)
    getFullYear()	    Get the four digit year (yyyy)
    getHours()	        Get the hour (0-23)
    getMilliseconds()	Get the milliseconds (0-999)
    getMinutes()	    Get the minutes (0-59)
    getMonth()	        Get the month (0-11)
    getSeconds()	    Get the seconds (0-59)
    getTime()	        Get the time (milliseconds since January 1, 1970)
*/

// The global method String() can convert dates to strings.

String(Date())  // returns "Thu Jul 17 2014 15:38:19 GMT+0200 (W. Europe Daylight Time)"

// The Date method toString() does the same.

Date().toString()  // returns "Thu Jul 17 2014 15:38:19 GMT+0200 (W. Europe Daylight Time)"



//-----------------------------
//  Booleans   ->  Numbers
//-----------------------------

// The global method Number() can also convert booleans to numbers.

Number(false)     // returns 0
Number(true)      // returns 1



//-----------------------------
//  Booleans   ->  Strings
//-----------------------------

// The global method String() can convert booleans to strings.

String(false)      // returns "false"
String(true)       // returns "true"

// The Boolean method toString() does the same.

false.toString()   // returns "false"
true.toString()    // returns "true"






//-----------------------------
// Automatic Type Conversion
//-----------------------------

// When JavaScript tries to operate on a "wrong" data type, 
// it will try to convert the value to a "right" type.

// The result is not always what you expect:

5 + null    // returns 5         because null is converted to 0
"5" + null  // returns "5null"   because null is converted to "null"
"5" + 2     // returns "52"      because 2 is converted to "2"
"5" - 2     // returns 3         because "5" is converted to 5
"5" * "2"   // returns 10        because "5" and "2" are converted to 5 and 2


//-----------------------------
// Automatic String Conversion
//-----------------------------

// JavaScript automatically calls the variable's toString() function 
//    when you try to "output" an object or a variable:


document.getElementById("demo").innerHTML = myVar;

myVar = {name:"Fjohn"}  // toString converts to "[object Object]"
myVar = [1,2,3,4]       // toString converts to "1,2,3,4"
myVar = new Date()      // toString converts to "Fri Jul 18 2014 09:08:55 GMT+0200"

// Numbers and booleans are also converted, but this is not very visible:

myVar = 123             // toString converts to "123"
myVar = true            // toString converts to "true"
myVar = false           // toString converts to "false"



//-----------------------------------
// JavaScript Type Conversion Table
//-----------------------------------
/*

Original            Converted       Converted           Converted
Value               to Number       to String           to Boolean
-----------         ----------      ----------          ------------         	
false	            0	            "false"	            false	
true	            1	            "true"	            true	
0	                0	            "0"	                false	
1	                1	            "1"	                true	
"0"	                0	            "0"	                true	
"000"	            0	            "000"	            true	
"1"	                1	            "1"	                true	
NaN	                NaN	            "NaN"	            false	
Infinity	        Infinity	    "Infinity"	        true	
-Infinity	        -Infinity	    "-Infinity"	        true	
""	                0	            ""	                false	
"20"	            20	            "20"	            true	
"twenty"	        NaN	            "twenty"	        true	
[ ]	                0	            ""	                true	
[20] 	            20	            "20"	            true	
[10,20]	            NaN	            "10,20"	            true	
["twenty"]	        NaN	            "twenty"	        true	
["ten","twenty"]    NaN	            "ten,twenty"	    true	
function(){}	    NaN	            "function(){}"	    true	
{ }	                NaN	            "[object Object]"	true	
null                0	            "null"	            false   	
undefined	        NaN	            "undefined"	        false	

*/