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
JavaScript BigInt

All JavaScript numbers are stored in a a 64-bit floating-point format.
JavaScript BigInt is a new datatype (2020) 
that can be used to store integer values 
that are too big to be represented by a normal JavaScript Number.
Example:
*/
    let x = BigInt("123456789012345678901234567890");



// Some basic arithmetic works as you'd expect.

    1 + 1;          // = 2
    0.1 + 0.2;      // = 0.30000000000000004
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



// There are three special not-a-real-number values:

    Infinity;       // result of e.g.   1/0
    -Infinity;      // result of e.g.   -1/0
    NaN;            // result of e.g.   0/0    stands for 'Not a Number'


    
var num = parseInt(10);
console.log(num);


