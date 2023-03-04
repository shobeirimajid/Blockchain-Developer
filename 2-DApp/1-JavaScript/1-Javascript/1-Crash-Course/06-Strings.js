///////////////////////////////////////////////////////
//                      Strings 
///////////////////////////////////////////////////////

/*
A string (or a text string) is a series of characters like "John Doe".
Strings are written with quotes. 
You can use single quotes (') or double quotes (")
*/

    // Using double quotes:
    var carName1 = "Hello, world";

    // Using single quotes:
    var carName2 = 'Hello, world';


    
// Strings are concatenated with +

    "Hello " + "world!";                // = "Hello world!"


// You can use quotes inside a string, 
// as long as they don't match the quotes surrounding the string:

    // Single quote inside double quotes:
    let answer1 = "It's alright";

    // Single quotes inside double quotes:
    let answer2 = "He is called 'Johnny'";

    // Double quotes inside single quotes:
    let answer3 = 'He is called "Johnny"';



// ... which works with more than just strings

    "1, 2, " + 3;                       // = "1, 2, 3"
    "Hello " + ["world", "!"];          // = "Hello world,!"



// and are compared with < and >

    "a" < "b";                          // = true



// Type coercion is performed for comparisons with double equals...

    "5" == 5;                           // = true



// ...unless you use ===

    "5" === 5;                          // = false



// ...which can result in some weird behaviour...

    13 + !0;                            // 14
    "13" + !0;                          // '13true'



/*
---------------------------
Escape Character
---------------------------
Because strings must be written within quotes, JavaScript will misunderstand this string:
*/
    var text = "We are the so-called "Vikings" from the north.";

/*
The string will be chopped to "We are the so-called ".
The solution to avoid this problem, is to use the backslash escape character.
The backslash (\) escape character turns special characters into string characters:

    Code	Result	    Description
    ----    -------     -------------
    \'	    '	        Single quote
    \"	    "	        Double quote
    \\	    \	        Backslash

*/

// The sequence \"  inserts a double quote in a string:
var text = "We are the so-called \"Vikings\" from the north.";


// The sequence \'  inserts a single quote in a string:
var text= 'It\'s alright.';


// The sequence \\  inserts a backslash in a string:
let text = "The character \\ is called backslash.";

/*
Six other escape sequences are valid in JavaScript:

    Code	Result
    ----    -----------------------
    \b	    Backspace
    \f	    Form Feed
    \n	    New Line
    \r	    Carriage Return
    \t	    Horizontal Tabulator
    \v	    Vertical Tabulator

The 6 escape characters above were originally designed to control 
    typewriters, 
    teletypes, 
    and fax machines. 
They do not make any sense in HTML.

*/



// You can also break up a code line within a text string with a single backslash:
document.getElementById("demo").innerHTML = "Hello \
Dolly!";

// You cannot break up a code line with a backslash:
document.getElementById("demo").innerHTML = \
"Hello Dolly!";

// The \ method is not the preferred method. 
// It might not have universal support.
// Some browsers do not allow spaces behind the \ character.
// A safer way to break up a string, is to use string addition:

document.getElementById("demo").innerHTML = "Hello " +
"Dolly!";


/*
---------------------
Strings as Objects
---------------------
strings can also be defined as objects with the keyword new:
Do not create Strings objects.
The new keyword complicates the code and slows down execution speed.
*/

// Comparing JavaScript objects and string returns false.
let x = "John";                 // x is string
let y = new String("John");     // x is object
x==y;       // true
x===y;      // false

// Comparing two JavaScript objects always returns false.
let a = new String("John");
let b = new String("John");
a==b;       // false
a===b;      // false



/*
--------------------
String Methods
--------------------
All string methods return a new string. 
They don't modify the original string.

    Formally said:

Strings are immutable: Strings cannot be changed, only replaced.



 length                     The length property returns the length of a string
                            "Hello".length;                     // = 5

 slice(start, end)          extracts a part of a string and returns the extracted part in a new string. (end not included)
 slice(start)               slice out the rest of the string starting from start
                            If a parameter is negative, the position is counted from the end of the string:
                            text.slice(-12, -6) slices out a portion of a string from position -12 to position -6

 substring(start, end)      is similar to slice(). The difference is that start and end values less than 0 are treated as 0
                            "Hello world".substring(0, 5);      // = "Hello"

 substring(start)           slice out the rest of the string starting from start
                            

 substr(start, length)      is similar to slice() The difference is that the second parameter specifies the length of the extracted part.
 substr(start)              slice out the rest of the string starting from start
                            If the first parameter is negative, the position counts from the end of the string.

 replace(oldS, newS)        replaces a specified value with another value in a string
                            replace() method is case sensitive.
                                To replace case insensitive, use a regular expression with an /i flag (insensitive)
                                var newText = text.replace(/MICROSOFT/i, "W3Schools");
                            replace() method does not change the string it is called on.
                            replace() method returns a new string.
                            replace() method replaces only the first match
                                If you want to replace all matches, use a regular expression with the /g flag set.
                                var newText = text.replace(/Microsoft/g, "W3Schools");


 replaceAll()               allows you to specify a regular expression instead of a string to be replaced
                            If the parameter is a regular expression, the global flag (g) must be set set, otherwise a TypeError is thrown
                            text = text.replaceAll(/Cats/g,"Dogs");
                            text = text.replaceAll(/cats/g,"dogs");
                            replaceAll() is an ES2021 feature.
                            replaceAll() does not work in Internet Explorer.

 toUpperCase()              convert to upper case
 toLowerCase()              convert to lower case

 concat()                   joins two or more strings
                            text3 = text1.concat(" ", text2)
                            can be used instead of the plus operator
                            text = "Hello" + " " + "World!";
                            text = "Hello".concat(" ", "World!");

 trim()                     removes whitespace from both sides of a string
 trimStart()                removes whitespace only from the start of a string - ECMAScript 2019
 trimEnd()                  removes whitespace only from the end of a string - ECMAScript 2019

 padStart()                 pads a string with another string - ECMAScript 2017
 padEnd()                   pads a string with another string - ECMAScript 2017
                            To pad a number, convert the number to a string first.

 charAt()                   returns the character at a specified index (position) in a string
                            "This is a string".charAt(0);       // = 'T'

 charCodeAt()               returns the unicode of the character at a specified index in a string

 access [ ]                 access to specified index of strings - ECMAScript 5 (2009)
                            It makes strings look like arrays (but they are not)
                            If no character is found, [ ] returns undefined, while charAt() returns an empty string
                            It is read only. str[0] = "A" gives no error (but does not work!)
                            text[0] = "A";    // Gives no error, but does not work

 split()                    convert string to an array
                            text.split(",")    // Split on commas
                            text.split(" ")    // Split on spaces
                            text.split("|")    // Split on pipe
                            If the separator is omitted, the returned array will contain the whole string in index [0].
                            If the separator is "", the returned array will be an array of single characters


 indexOf()                  returns the index of (position of) the first occurrence of a string in a string
                            return -1 if the text is not found:
                            can accept a second parameter as the starting position for the search

 lastIndexOf()              returns the index of the last occurrence of a specified text in a string
                            return -1 if the text is not found:
                            can accept a second parameter as the starting position for the search
                            searches backwards (from the end to the beginning), 
                            meaning: if the second parameter is 15, the search starts at position 15, and searches to the beginning of the string

 search()                   searches a string for a string (or a regular expression) and returns the position of the match
                            search() method cannot take a second start position argument.
                            indexOf() method cannot take powerful search values (regular expressions).
 match()                    returns an array containing the results of matching a string against a string (or a regular expression)
                            text.match("ain")       search for "ain"
                            text.match(/ain/)       search for "ain" - If a regular expression does not include the g modifier (global search), match() will return only the first match in the string
                            text.match(/ain/g)      global search for "ain"
                            text.match(/ain/gi)     global, case-insensitive search for "ain"

 matchAll()                 returns an iterator containing the results of matching a string against a string (or a regular expression)
                            If the parameter is a regular expression, the global flag (g) must be set, otherwise a TypeError is thrown.
                                text.matchAll(/Cats/g)
                            If you want to search case insensitive, the insensitive flag (i) must be set
                                const iterator = text.matchAll(/Cats/gi);
                            is an ES2020 feature & does not work in Internet Explorer.

 includes()                 returns true if a string contains a specified value Otherwise it returns false
                            text.includes("world")          Check if a string includes "world"
                            text.includes("world", 12)      Check if a string includes "world". Start at position 12
                            is case sensitive
                            is an ES6 feature and not supported in Internet Explorer

 startsWith()               returns true if a string begins with a specified value. Otherwise it returns false
                            text.startsWith("world", 5)     A start position for the search can be specified
                            is case sensitive.
                            is an ES6 feature and not supported in Internet Explorer.

 endsWith()                 returns true if a string ends with a specified value. Otherwise it returns false
                            endsWith("world", 11)           Check if the 11 first characters of a string ends with "world"
                            is case sensitive.
                            is an ES6 feature and not supported in Internet Explorer.
*/





/*
-----------------------
Template Literals
----------------------
ES6 feature (JavaScript 2015)
*/
text = `Hello World!`;
text = `He's often called "Johnny"`;
text =
        `The quick
        brown fox
        jumps over
        the lazy dog`;

/*
------------------------------
string  Interpolation
------------------------------
Automatic replacing of variables with real values
${...}


------------------------------
Variable Substitutions
------------------------------
*/
var firstName = "John";
var lastName = "Doe";
var text = `Welcome ${firstName}, ${lastName}!`;


/*
------------------------------
Expression Substitution
------------------------------
*/
var price = 10;
var VAT = 0.25;
var total = `Total: ${(price * (1 + VAT)).toFixed(2)}`;


/*
------------------------------
HTML Templates
------------------------------
*/

var header = "Templates Literals";
var tags = ["template literals", "javascript", "es6"];

var html = '';

html +=`<h2>${header}</h2>`;
html +=`<ul>`;

for (const x of tags) {
    html += `<li>${x}</li>`;
}

html += `</ul>`;