///////////////////////////////////////////////////////
//                      Numbers
///////////////////////////////////////////////////////

// JavaScript has one number type (which is a 64-bit IEEE 754 double).
// Doubles have a 52-bit mantissa, which is enough to store integers
// up to about 9✕10¹⁵ precisely.

    3;          // = 3
    1.5;        // = 1.5


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


// Bitwise operations also work; when you perform a bitwise operation your float
// is converted to a signed int *up to* 32 bits.

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