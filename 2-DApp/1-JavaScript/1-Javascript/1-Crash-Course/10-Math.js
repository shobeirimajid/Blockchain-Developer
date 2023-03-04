///////////////////////////////////////////////////////
//                      Math Object
///////////////////////////////////////////////////////
/*
The Math object allows you to perform mathematical tasks, and includes several properties.
Math has no constructor. 
There's no need to create a Math object first.
*/

Math.E        // returns Euler's number
Math.PI       // returns PI
Math.SQRT2    // returns the square root of 2
Math.SQRT1_2  // returns the square root of 1/2
Math.LN2      // returns the natural logarithm of 2
Math.LN10     // returns the natural logarithm of 10
Math.LOG2E    // returns base 2 logarithm of E
Math.LOG10E   // returns base 10 logarithm of E

//-------------------------------------------
//  Method	                Description
//-------------------------------------------
    abs(x)	        // Returns the absolute value of x
    acos(x)	        // Returns the arccosine of x, in radians
    acosh(x)	    // Returns the hyperbolic arccosine of x
    asin(x)	        // Returns the arcsine of x, in radians
    asinh(x)	    // Returns the hyperbolic arcsine of x
    atan(x)	        // Returns the arctangent of x as a numeric value between -PI/2 and PI/2 radians
    atan2(y, x)	    // Returns the arctangent of the quotient of its arguments
    atanh(x)	    // Returns the hyperbolic arctangent of x
    cbrt(x)	        // Returns the cubic root of x
    ceil(x)	        // Returns x, rounded upwards to the nearest integer
    cos(x)	        // Returns the cosine of x (x is in radians)
    cosh(x)	        // Returns the hyperbolic cosine of x
    exp(x)	        // Returns the value of Ex
    floor(x)	    // Returns x, rounded downwards to the nearest integer
    log(x)	        // Returns the natural logarithm (base E) of x
    max(x, y, z, ..., n)	// Returns the number with the highest value
    min(x, y, z, ..., n)	// Returns the number with the lowest value
    pow(x, y)	    // Returns the value of x to the power of y
    random()	    // Returns a random number between 0 and 1
    round(x)	    // Rounds x to the nearest integer
    sign(x)	        // Returns if x is negative, null or positive (-1, 0, 1)
    sin(x)	        // Returns the sine of x (x is in radians)
    sinh(x)	        // Returns the hyperbolic sine of x
    sqrt(x)	        // Returns the square root of x
    tan(x)	        // Returns the tangent of an angle
    tanh(x)	        // Returns the hyperbolic tangent of a number
    trunc(x)	    // Returns the integer part of a number (x)


/*
-------------------
Math Methods
-------------------
*/

// There are 4 common methods to round a number to an integer


// Math.round(x)	
// round the x to its nearest integer

Math.round(4.6);    // 5
Math.round(4.5);    // 5    *
Math.round(4.4);    // 4
Math.round(-4.4);   // -4   *
Math.round(-4.5);   // -4   *
Math.round(-4.6);   // -5


// Math.ceil(x)	
// round up the x to its nearest integer

Math.ceil(4.6);     // 5
Math.ceil(4.5);     // 5
Math.ceil(4.4);     // 5
Math.ceil(-4.4);    // -4
Math.ceil(-4.5);    // -4
Math.ceil(-4.6);    // -4

// Math.floor(x)
// round down the x to its nearest integer

Math.floor(4.6);    // 4
Math.floor(4.5);    // 4
Math.floor(4.4);    // 4
Math.floor(-4.4);   // -5
Math.floor(-4.5);   // -5
Math.floor(-4.6);   // -5


// Math.trunc(x)	
// Returns the integer part of x 
// added to JavaScript 2015 - ES6

Math.trunc(4.6);    // 4
Math.trunc(4.5);    // 4
Math.trunc(4.4);    // 4
Math.trunc(-4.4);   // -4
Math.trunc(-4.5);   // -4
Math.trunc(-4.6);   // -4


function calcCent(x){
    return Math.ceil(x/100);
}
var dollar = 10.5
console.log(calcCent(dollar));


// Math.sign(x)
// returns if x is negative, null or positive
// added to JavaScript 2015 - ES6.

Math.sign(-4);      // -1
Math.sign(0);       // 0
Math.sign(4);       // 1



// Math.pow()
// returns the value of x to the power of y
Math.pow(8, 2); // 64


// Math.sqrt()
// returns the square root of x
Math.sqrt(64);  // 8


// Math.abs(x)
// returns the absolute (positive) value of x
Math.abs(-4.7); // 4.7


// Math.sin(x)
// returns the sine (a value between -1 and 1) of the angle x (given in radians)
// If you want to use degrees instead of radians, you have to convert degrees to radians:
//      radians = degrees x PI / 180

Math.sin(90 * Math.PI / 180);     // returns 1 (the sine of 90 degrees)


// Math.cos(x)
// returns the cosine (a value between -1 and 1) of the angle x (given in radians)

Math.cos(0 * Math.PI / 180);     // returns 1 (the cos of 0 degrees)


// Math.min() 
// Math.max()
// can be used to find the lowest or highest value in a list of arguments
Math.min(0, 150, 30, 20, -8, -200);     // -200
Math.max(0, 150, 30, 20, -8, -200);     // 150



// Math.log(x)
// returns the natural logarithm of x
// The natural logarithm returns the time needed to reach a certain level of growth:

Math.log(0);    // -Infinity
Math.log(1);    // 0
Math.log(2);    // 0.6931471805599453
Math.log(3);    // 1.0986122886681096
Math.log(10);   // 2.302585092994046

// Math.E
// E ^ log(n) =  n
// log(n) : How many times must we multiply `Math.E` to get `n`


// Math.log2(x)
// returns the base 2 logarithm of x
Math.log2(8);   // How many times must we multiply 2 to get 8


// Math.log10(x) 
// returns the base 10 logarithm of x
Math.log10(1000);   // How many times must we multiply 10 to get 1000?


// Math.random()
// eturns a random number in range [0 , 1)
// Math.random() always returns a number lower than 1.
Math.random();  // 0.9857392476369988

// Random Integers (with no decimals)
// Returns a random integer from 0 to 10
Math.floor(Math.random() * 11);

// Returns a random integer from 1 to 10:
Math.floor(Math.random() * 10) + 1;


// Proper Random Function
// returns a random number in range [min, max]
function getRndInteger(min, max) {
    return Math.floor(Math.random() * (max - min) ) + min;
}


function getRndInteger(min, max) {
    return Math.floor(Math.random() * (max - min + 1) ) + min;
}