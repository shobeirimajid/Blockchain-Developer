///////////////////////////////////////////////////////
//                      Numbers
///////////////////////////////////////////////////////
/*
Most programming languages have many number types:

Whole numbers (integers):
    byte (8-bit)
    short (16-bit)
    int (32-bit)
    long (64-bit)

Real numbers (floating-piont):
    float (32-bit) 
    double (64-bit)


Javascript are always one type:   double (64-bit floating point - 64-bit IEEE 754 double).


Value (aka Fraction/Mantissa)	    Exponent	            Sign
-----------------------------       -----------------       ----------
52 bits (0 - 51) 	                11 bits (52 - 62)	    1 bit (63)


All JavaScript numbers are stored as decimal numbers (floating point).
Doubles have a 52-bit mantissa, which is enough to store integers up to about 9✕10¹⁵ precisely.
Numbers can be written with, or without decimals:
*/
    // With decimals:
    var x1 = 34.00;

    // Without decimals:
    var x2 = 34;


// Extra large or extra small numbers can be written with scientific (exponential) notation:

    var y = 123e5;    // 12300000
    var z = 123e-5;   // 0.00123

/*
-----------------------------
Integer Precision
-----------------------------
Integers (numbers without a period or exponent notation) are accurate up to 15 digits.
*/
    Example:
    var x = 999999999999999;   // x will be 999999999999999
    var y = 9999999999999999;  // y will be 10000000000000000


/*
-----------------------------
Floating  Precision
-----------------------------
Floating point arithmetic is not always 100% accurate:
*/
    var x = 0.2 + 0.1;                  // 0.30000000000000004

    // To solve the problem above, it helps to multiply and divide:
    var x = (0.2*10 + 0.1*10) / 10;     // 0.3


// Some basic arithmetic works as you'd expect.

    1 + 1;          // = 2
    8 - 1;          // = 7
    10 * 2;         // = 20
    35 / 5;         // = 7



// Including uneven division.

    5 / 2;          // = 2.5



// And modulo division.

    10 % 2;         // = 0
    30 % 4;         // = 2
    18.5 % 7;       // = 4.5



// Bitwise operations also work; 
// when you perform a bitwise operation your float is converted to a signed int *up to* 32 bits.

    1 << 2;         // = 4



// Precedence is enforced with parentheses.

    (1 + 3) * 2;    // = 8



// Equality is ===

    1 === 1;        // = true
    2 === 1;        // = false



// Inequality is !==

    1 !== 1;        // = false
    2 !== 1;        // = true



// More comparisons

    1 < 10;          // = true
    1 > 10;          // = false
    2 <= 2;          // = true
    2 >= 2;          // = true


/*
-----------------------------
    NaN
-----------------------------    
Trying to do arithmetic with a non-numeric string will result in NaN (Not a Number)     
NaN is a JavaScript reserved word indicating that a number is not a legal number.
*/

    Example:
    0/0;
    100 / "Apple";
    
    // You can use the global JavaScript function isNaN() to find out if a value is a not a number
    x = 100 / "Apple";
    isNaN(x);

    // If you use NaN in a mathematical operation, the result will also be NaN
    x = NaN;
    y = 5;
    z = x + y;  // NaN

    y = "5";
    z = x + y;  // NaN5

    // NaN is a number: 
    // typeof NaN returns number
    typeof NaN;



/*
-----------------------------
    Infinity
-----------------------------  
the value JavaScript will return if you calculate a number outside the largest possible number.
Division by 0 (zero) also generates Infinity
Infinity is a number: typeof Infinity returns number.

*/

    Example:
    1/0     // Infinity
    -1/0    // -Infinity


    Example:
    var myNumber = 2;
    // Execute until Infinity
    while (myNumber != Infinity) {
        myNumber = myNumber * myNumber;
    }


    typeof Infinity;



/*
-----------------------------
    Hexadecimal
-----------------------------
JavaScript interprets numeric constants as hexadecimal if they are preceded by 0x.
*/

    var x = 0xFF;

/*
Hexadecimal is base 16. 
Decimal is base 10. 
Octal is base 8. 
Binary is base 2.

By default, JavaScript displays numbers as base 10 decimals.

Never write a number with a leading zero (like 07).
Some JavaScript versions interpret numbers as octal if they are written with a leading zero.

you can use the toString(x) method to output numbers from base 2 to base x.
*/

    var myNumber = 32;
    console.log(myNumber.toString(32));     // 10
    console.log(myNumber.toString(16));     // 20
    console.log(myNumber.toString(12));     // 28
    console.log(myNumber.toString(10));     // 32
    console.log(myNumber.toString(8));      // 40
    console.log(myNumber.toString(2));      // 100000



/*
-----------------------------
JavaScript BigInt
-----------------------------
All JavaScript numbers are stored in a a 64-bit floating-point format.
JavaScript BigInt is a new datatype (2020) 
that can be used to store big integer values 
that are too big to be represented by a normal JavaScript Number.
*/

// JavaScript integers are only accurate up to 15 digits:

x = 999999999999999;        // 999999999999999
y = 9999999999999999;       // 10000000000000000

/*
In JavaScript, all numbers are stored in a 64-bit floating-point format (IEEE 754 standard).
With this standard, large integer cannot be exactly represented and will be rounded.

Because of this, JavaScript can only safely represent integers:

    [ -(2^53-1) .. +(2^53-1) ]

    [-9007199254740991 .. 9007199254740991]

Integer values outside this range lose precision.

How to Create a BigInt?
------------------------
To create a BigInt, append n to the end of an integer or call BigInt():
*/
    Example:
    x = 9999999999999999;               // 10000000000000000
    y = BigInt(9999999999999999);       // 9999999999999999
    z = 9999999999999999n;              // 9999999999999999


// Operators that can be used on a JavaScript Number can also be used on a BigInt.
x = 9007199254740995n;                  // 9007199254740995
y = 9007199254740995n;                  // 9007199254740995
z = x * y;                              // 81129638414606735738984533590025


// BigInt can also be written in hexadecimal, octal, or binary notation:
hex = 0x20000000000003n;                                            // 9007199254740995
oct = 0o400000000000000003n                                         // 9007199254740995
bin = 0b100000000000000000000000000000000000000000000000000011n;    // 9007199254740995


// Arithmetic between a BigInt and a Number is not allowed (type conversion lose information).
// Unsigned right shift (>>>) can not be done on a BigInt (it does not have a fixed width).


// A BigInt can not have decimals.
x = 5n;
y = x / 2;  // Error: Cannot mix BigInt and other types, use explicit conversion.


// Rounding can compromise program security:
9007199254740992 === 9007199254740993; // is true !!!



/*
----------------------------------
Minimum and Maximum Integers
----------------------------------
ES6 added some properties to the Number object:

Property	            Description
-----------------       -------------------------------------------------------
EPSILON	                The difference between 1 and the smallest floating point number greater than 1
MAX_VALUE	            The largest number possible in JavaScript
MIN_VALUE	            The smallest number possible in JavaScript
MAX_SAFE_INTEGER	    The maximum safe integer (2^53 - 1)
MIN_SAFE_INTEGER	    The minimum safe integer -(2^53 - 1)
POSITIVE_INFINITY	    Infinity (returned on overflow ~ Ex. 1/0)
NEGATIVE_INFINITY	    Negative infinity (returned on overflow ~ Ex. -1/0)
NaN	                    A "Not-a-Number" value -  for a number that is not a legal number - Ex. 100 / "Apple"

*/

Number.EPSILON                  // 2.220446049250313e-16
Number.MAX_VALU                 // 1.7976931348623157e+308
Number.MIN_VALUE                // 5e-324

Number.MAX_SAFE_INTEGER         // 9007199254740991
Number.MIN_SAFE_INTEGER         // -9007199254740991

Number.POSITIVE_INFINITY        // Infinity
Number.NEGATIVE_INFINITY        // -Infinity

Number.NaN                      // NaN



// isInteger() method returns true if the argument is an integer.
Number.isInteger(10)            // true

// isSafeInteger() returns true if the argument is a safe integer
// Safe Integer is an integer that can be exactly represented as a double precision number.
// Safe integers are all integers from -(253 - 1) to +(253 - 1).
// This is safe: 9007199254740991. 
// This is not safe: 9007199254740992.

Number.isSafeInteger(10)                    // true
Number.isSafeInteger(10.5)                  // false
Number.isSafeInteger(12345678901234567890)  // false


/*
------------------
Number Methods
------------------
These number methods can be used on all JavaScript numbers:


Method	            Description
---------------     --------------------------------------------------

toString()	        Returns a number as a string


toExponential()	    Returns a number written in exponential notation
                    returns a string, with a number rounded and written using exponential notation
                    A parameter defines the number of characters behind the decimal point
                    The parameter is optional. If you don't specify it, JavaScript will not round the number.
                    x = 9.656;
                    x.toExponential(2);     9.656e+0
                    x.toExponential(4);     9.656e+0
                    x.toExponential(6);     9.6560e+0


toFixed()	        Returns a number specified with a number of decimals
                    x = 9.656;
                    x.toFixed(0);           10
                    x.toFixed(2);           9.66
                    x.toFixed(4);           9.6560
                    x.toFixed(6);           9.656000


toPrecision()	    Returns a number written with a specified length
                    x = 9.656;
                    x.toPrecision();        9.656  
                    x.toPrecision(2);       9.7
                    x.toPrecision(4);       9.656
                    x.toPrecision(6);       9.65600


ValueOf()	        Returns a number as a number
                    x = 123;
                    x.valueOf();            123
                    (123).valueOf();        123
                    (100 + 23).valueOf();   123


                    In JavaScript, a number can be a primitive value (typeof = number) or an object (typeof = object).
                    The valueOf() method is used internally in JavaScript to convert Number objects to primitive values.
                    There is no reason to use it in your code.
                    All JavaScript data types have a valueOf() and a toString() method.

*/



/*
------------------------------------------
Converting Variables to Numbers
------------------------------------------
There are 3 JavaScript methods that can be used to convert a variable to a number:
These methods are not number methods. 
They are `global` JavaScript methods.


Method	            Description
-------------       ---------------------------------------------------------
Number()	        Returns a number converted from its argument.
parseInt()	        Parses its argument and returns a whole number
parseFloat()	    Parses its argument and returns a floating point number


------------------
Number()
------------------
can be used to convert JavaScript variables to numbers
If the number cannot be converted, NaN (Not a Number) is returned.

*/
    Number(true);       // 1
    Number(false);      // 0
    Number("10");       // 10
    Number("  10");     // 10
    Number("10  ");     // 10
    Number(" 10  ");    // 10
    Number("10.33");    // 10.33
    Number("10,33");    // NaN
    Number("10 33");    // NaN
    Number("John");     // NaN

    // Number() can also convert a date to a number.
    // The Date() method returns the number of milliseconds since 1.1.1970.
    // The number of milliseconds between 1970-01-02 and 1970-01-01 is 86400000
    Number(new Date("1970-01-01"))      // 0
    Number(new Date("2017-09-30"))      // 1506729600000
    


/*
------------------
parseInt()
------------------
parses a string and returns a whole number. 
Spaces are allowed. 
Only the first number is returned:
*/
parseInt("-10");            // -10
parseInt("-10.33");         // -10
parseInt("10");             // 10
parseInt("10.33");          // 10
parseInt("10 20 30");       // 10
parseInt("10 years");       // 10
parseInt("years 10");       // NaN

// If the number cannot be converted, NaN (Not a Number) is returned.



/*
------------------
parseFloat()
------------------
 parses a string and returns a number. 
 Spaces are allowed. 
 Only the first number is returned
*/
parseFloat("10");           // 10
parseFloat("10.33");        // 10.33
parseFloat("10 20 30");     // 10
parseFloat("10 years");     // 10
parseFloat("years 10");     // NaN

// If the number cannot be converted, NaN (Not a Number) is returned.




/*
----------------------------
Number Object Methods
----------------------------
These object methods belong to the Number object:

Method	                    Description
----------------------      ------------------------------------------------
Number.isInteger()	        Returns true if the argument is an integer
                            Number.isInteger(10);       // true
                            Number.isInteger(10.5);     // false

Number.isSafeInteger()	    Returns true if the argument is a safe integer
                            A safe integer is an integer that can be exactly represented as a double precision number.
                            Safe integers are all integers from -(253 - 1) to +(253 - 1).
                            This is safe:       9007199254740991
                            This is not safe:   9007199254740992
                            Number.isSafeInteger(10);                       // true
                            Number.isSafeInteger(12345678901234567890);     // false        

Number.parseFloat()	        Converts a string to a number
                            Number.parseFloat("10")             // 10
                            Number.parseFloat("10.33")          // 10.33
                            Number.parseFloat("10 20 30")       // 10
                            Number.parseFloat("10 years")       // 10
                            Number.parseFloat("years 10")       // NaN
                            If the number cannot be converted, NaN (Not a Number) is returned.

Number.parseInt()	        Converts a string to a whole number
                            Spaces are allowed. 
                            Only the first number is returned:
                            Number.parseInt("-10");             // -10
                            Number.parseInt("-10.33");          // -10
                            Number.parseInt("10");              // 10
                            Number.parseInt("10.33");           // 10
                            Number.parseInt("10 20 30");        // 10
                            Number.parseInt("10 years");        // 10
                            Number.parseInt("years 10");        // NaN
                            If the number cannot be converted, NaN (Not a Number) is returned.





Number Methods Cannot be Used on Variables
The number methods above belong to the JavaScript Number Object.
These methods can only be accessed like Number.isInteger().
Using X.isInteger() where X is a variable, will result in an error: TypeError X.isInteger is not a function.


The Number methods Number.parseInt() and Number.parseFloat() 
are the same as the Global methods parseInt() and parseFloat().
The purpose is modularization of globals 
(to make it easier to use the same JavaScript code outside the browser).



*/




/*
------------------
Number.isInteger()
------------------
*/




/*
------------------
Number.isSafeInteger()
------------------
*/




/*
------------------
Number.parseInt()
------------------
*/
parseInt("-10");
parseInt("-10.33");
parseInt("10");
parseInt("10.33");
parseInt("10 20 30");
parseInt("10 years");
parseInt("years 10");



/*
------------------
Number.parseFloat()
------------------
*/
parseFloat("10");
parseFloat("10.33");
parseFloat("10 20 30");
parseFloat("10 years");
parseFloat("years 10");

