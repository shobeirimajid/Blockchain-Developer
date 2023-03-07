///////////////////////////////////////////////////////
//                 Regular Expression
///////////////////////////////////////////////////////
/*

/regexp/ is an ECMAScript1 (ES1) feature

------------------------------
Syntax
------------------------------

    /pattern/modifiers;


------------------------------
What Is a Regular Expression?
------------------------------
    A regular expression is a sequence of characters that forms a `search pattern`
    The search pattern can be used for text `search` and text `replace` operations.
    When you search for data in a text, you can use this search pattern to describe what you are searching for.
    A regular expression can be a single character, or a more complicated pattern.
    Regular expressions can be used to perform all types of text search and text replace operations.
    Regular expression arguments (instead of string arguments) can be used in the method /.../
    Regular expressions can make your search much more powerful (case insensitive for example)


    Ex.     /w3schools/i;

            /w3schools/i  is a regular expression
            w3schools  is a pattern (to be used in a search)
            i  is a modifier (modifies the search to be case-insensitive)



------------------------------
Using String Methods
------------------------------
    In JavaScript, regular expressions are often used with the two string methods:

        - search()     uses an expression to search for a match, and returns the position of the match
        - replace()    returns a modified string where the pattern is replaced



------------------------------
Regular Expression Modifiers
------------------------------
Modifiers can be used to perform case-insensitive more global searches:

    Modifier	Description
    ---------   -------------------------------------
    i	        case-insensitive matching	
    g	        a global match (find all matches rather than stopping after the first match)	
    m	        multiline matching



------------------------------
Regular Expression Patterns
------------------------------
Brackets are used to find a range of characters:

Expression	    Description	
-----------     -----------------------------------------------
[abc]	        Find any of the characters between the brackets	
[0-9]	        Find any of the digits between the brackets	
(x|y)	        Find any of the alternatives separated with |



------------------------------
Metacharacters 
------------------------------
Metacharacters are characters with a special meaning:

--------------      ----------------------------------------------------------------------
Metacharacter	    Description
--------------      ----------------------------------------------------------------------
\d	                Find a digit	

\s	                Find a whitespace character	

\b	                Find a match 
                        at the beginning of a word like this:   \bWORD 
                        or at the end of a word like this:      WORD\b	

\uxxxx	            Find the Unicode character specified by the hexadecimal number xxxx
-------------------------------------------------------------------------------------------



------------------------------
Quantifiers 
------------------------------

Quantifier	    Description
-----------     ------------------------------------------------------------------
n+	            Matches any string that contains    `at least`         one n
n*	            Matches any string that contains    `zero or more`     occurrences of n
n?	            Matches any string that contains    `zero or one`      occurrences of n


*/




//----------------
// search()
//----------------
// The search() method searches a string for a specified value and returns the position of the match

// Use a string to do a search for "W3schools" in a string:

let text = "Visit W3Schools!";
let n = text.search("W3Schools");   // n:6




// Use a regular expression to do a case-insensitive search for "w3schools" in a string:

text = "Visit W3Schools";
n = text.search(/w3schools/i);  // n:6


//----------------
// replace()
//----------------
// The replace() method replaces a specified value with another value in a string:

text = "Visit Microsoft!";
result = text.replace("Microsoft", "W3Schools");    // "Visit W3Schools!"



//-------------------------------------
// replace() With a Regular Expression
//-------------------------------------

// Use a case insensitive regular expression to replace Microsoft with W3Schools in a string:

text = "Visit Microsoft!";
result = text.replace(/microsoft/i, "W3Schools");   // "Visit W3Schools!"



//------------------------
//  RegExp Object
//------------------------
// In JavaScript, the RegExp object  
//   is a regular expression object with predefined `properties` and `methods`


//------------
// test()
//------------
// test() method searches a string for a pattern, 
//   and returns true or false, depending on the result.

// example: searches a string for the character "e"
const pattern = /e/;
pattern.test("The best things in life are free!");  // true


// You don't have to put the regular expression in a variable first. 
//   The two lines above can be shortened to one:

/e/.test("The best things in life are free!");


//------------
// exec()
//------------
// exec() method searches a string for a specified pattern, 
//   and returns the found text as an object.
// If no match is found, it returns an empty (null) object.

// example: searches a string for the character "e"
/e/.exec("The best things in life are free!");  // e can be see in position 2 in the text
// The best things in life are free!
