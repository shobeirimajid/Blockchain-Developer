///////////////////////////////////////////////////////
//               Data Types and Variables
///////////////////////////////////////////////////////


/*
-----------------
Data Types
-----------------
In programming, data types is an important concept.
To be able to operate on variables, it is important to know something about the type.
    * When adding a number and a string, JavaScript will treat the number as a string.
    * JavaScript evaluates expressions from left to right. 
        Different sequences can produce different results:
*/

        16 + "Volvo" + 4    // ~  "16" + "Volvo" + "4"     ->  "16Volvo4"
        16 + 4 + "Volvo"    // ~   20 + "Volvo"            ->  "20Volvo"
        "Volvo" + 16 + 4    // ~   "Volvo" + "16" + "4"    -> "Volvo164"

        // JavaScript will try to convert strings to numbers in numeric operations
        100 / "20"          // 5
        "100"/"20"          // 5   
        "100"*"20"          // 2000
        "100"-"20"          // 80
        // But it will not work about `+` operator
        // JavaScript uses the + operator to concatenate the strings.
        "100"+"20"          // "10020"



/*
JavaScript has 8 Datatypes
    1. String
    2. Number
    3. Bigint
    4. Boolean
    5. Undefined
    6. Null
    7. Symbol
    8. Object

The object data type can contain:

    - object
    - array
    - date


JavaScript has dynamic types. 
This means that the same variable can be used to hold different data types:
*/
    var x;       // Now x is undefined
    x = 5;       // Now x is a Number
    x = "John";  // Now x is a String



/*
-------------
 typeof
-------------
You can use the JavaScript typeof operator to find the type of a JavaScript variable.
The typeof operator returns the type of a variable or an expression
*/

    typeof ""             // Returns "string"
    typeof "John"         // Returns "string"
    typeof "John Doe"     // Returns "string"
    typeof 0              // Returns "number"
    typeof 314            // Returns "number"
    typeof 3.14           // Returns "number"
    typeof (3)            // Returns "number"
    typeof (3 + 4)        // Returns "number"



/*
--------------------
null & undefined
--------------------
There's also `null` and `undefined`.

In JavaScript, a variable without a value, has the value undefined. 
The type is also undefined.
*/

null;                   // used to indicate a deliberate non-value
undefined;              // used to indicate a value is not currently present 
                        // (although `undefined` is actually a value itself)

null == undefined;      // = true
null === undefined;     // = false

var car;                // Value is undefined, type is undefined

// Any variable can be emptied, by setting the value to undefined. The type will also be undefined.

car = undefined;        // Value is undefined, type is undefined

// An empty value has nothing to do with undefined!
// An empty string has both a legal value and a type.

var car = "";           // The value is "", the typeof is "string"



/*
-----------------
Variabls
-----------------
Variables are containers for storing data values.
A JavaScript variable can hold any type of data.
*/



/*
-------------------
Identifiers
-------------------
    All JavaScript variables must be identified with unique names. 
    These unique names are called identifiers.
    Identifiers are used to name variables and keywords, and functions.
    The rules for legal names are the same in most programming languages.

    The general rules for constructing names for variables (unique identifiers) are:

        Names can contain:   A-Z   a-z   0-9   _   $
        Names must begin with a letter.
        Names can also begin with $ and _ (but we will not use it in this tutorial).
        Names are case sensitive (y and Y are different variables).
        Reserved words (like JavaScript keywords) cannot be used as names.

    Subsequent characters may be letters, digits, underscores, or dollar signs.

    * Numbers are not allowed as the first character in names.
        This way JavaScript can easily distinguish identifiers from numbers.

    * Since JavaScript treats a dollar sign as a letter, identifiers containing $ 
        are valid variable names:

        var $ = "Hello World";
        var $$$ = 2;
        var $myMoney = 5;

    Using the dollar sign is not very common in JavaScript, 
    but professional programmers often use it as an 
    alias for the main function in a JavaScript library.

    In the JavaScript library jQuery, for instance, 
    the main function $ is used to select HTML elements. 
    In jQuery $("p"); means "select all p elements".


    Since JavaScript treats underscore as a letter, 
    identifiers containing _ are valid variable names:

        let _lastName = "Johnson";
        let _x = 2;
        let _100 = 5;

    Using the underscore is not very common in JavaScript,
    but a convention among professional programmers is to use it 
    as an alias for "private (hidden)" variables.
*/



/*
------------------------
Variable declaration
------------------------
Variables are declared with the `var` keyword. 
JavaScript is dynamically typed, so you don't need to specify type. 
Assignment uses a single `=` character.
It's a good programming practice to declare all variables at the beginning of a script.
*/

    var someVar = 5;

/*
If you leave the `var` keyword off you won't get an error.
but your variable will be created in the global scope, 
not in the scope you defined it in.
*/
    someOtherVar = 10;


// Variables declared without being assigned to are set to undefined.

    var someThirdVar;       // = undefined

/*
One Statement, Many Variables
You can declare many variables in one statement.
If you want to declare a couple of variables, then you could use a comma separator
When separated by semicolons, multiple statements on one line are allowed
*/

    var someFourthVar = 2, someFifthVar = 4;

    a = 5; b = 6; c = a + b;




/*
--------------------------
Re-Declaring
--------------------------
If you re-declare a JavaScript variable declared with var, it will not lose its value.
The variable `carName` will still have the value "Volvo" after the execution of these statements:
*/

var carName = "Volvo";  // carName : "Volvo"
var carName;            // carName : "Volvo"

/*
Redeclaring a variable using the var keyword can impose problems.
Redeclaring a variable inside a block will also redeclare the variable outside the block:
*/

    var x = 1;
    // Here x is 1

    {
    var x = 2;
    // Here x is 2
    }

    // Here x is 2

    var x = 3;
    // Now x is 3



/*
--------------------------
Operators
--------------------------
Arithmetic operators perform arithmetic on numbers (literals or variables).

        Operator	Description
        --------    ------------------
        +	        Addition
        -	        Subtraction
        *	        Multiplication
        **	        Exponentiation (ES2016)
        /	        Division
        %	        Modulus (Remainder)
        ++	        Increment
        --	        Decrement

There's shorthand for performing math operations on variables:
*/

    someVar += 5;           // equivalent to someVar = someVar + 5; someVar is 10 now
    someVar *= 10;          // now someVar is 100
    
// and an even-shorter-hand for adding or subtracting 1

    someVar++;              // now someVar is 101
    someVar--;              // back to 100



/*
--------------------------
Operator Precedence
--------------------------
Operator precedence describes the order 
in which operations are performed in an arithmetic expression.

Multiplication (*) and division (/) have higher precedence than addition (+) and subtraction (-).

And (as in school mathematics) the precedence can be changed by using parentheses.
When using parentheses, the operations inside the parentheses are computed first

When many operations have the same precedence
like  `+ , /`  or  `* , /`
they are computed from left to right



    * Expressions in parentheses are computed before the rest of the expression
    * Function are executed before the result is used in the rest of the expression
    * Postfix increments are executed before prefix increments
    * Exponentiations are executed before multiplications
    * Multiplications and divisions are executed before additions and subtractions
    * Assignments are executed after all other operations

Val	Operator	Description	                Example
18	( )	        Expression Grouping	        (100 + 50) * 3
17	.	        Member Of	                person.name
17	[]	        Member Of	                person["name"]
17	?.	        Optional Chaining ES2020	x ?. y
17	()	        Function Call	            myFunction()
17	new	        New with Arguments	        new Date("June 5,2022")
16	new	        New without Arguments	    new Date()
15	++	        Postfix Increment	        i++
15	--	        Postfix Decrement	        i--
14	++	        Prefix Increment	        ++i
14	--	        Prefix Decrement	        --i
14	!	        Logical NOT	                !(x==y)
14	~	        Bitwise NOT	                ~x
14	+	        Unary Plus	                +x
14	-	        Unary Minus	                -x
14	typeof	    Data Type	                typeof x
14	void	    Evaluate Void	            void(0)
14	delete	    Property Delete	            delete myCar.color
13	**	        Exponentiation ES2016	    10 ** 2
12	*	        Multiplication	            10 * 5
12	/	        Division	                10 / 5
12	%	        Division Remainder	        10 % 5
11	+	        Addition	                10 + 5
11	-	        Subtraction	                10 - 5
11	+	        Concatenation	            "John" + "Doe"
10	<<	        Shift Left	                x << 2
10	>>	        Shift Right (signed)	    x >> 2
10	>>>	        Shift Right (unsigned)	    x >>> 2
9	in	        Property in Object	        "PI" in Math
9	instanceof	Instance of Object	        x instanceof Array
9	<	        Less than	                x < y 
9	<=	        Less than or equal	        x <= y
9	>	        Greater than	            x > y
9	>=	        Greater than or equal	    x >= Array
8	==	        Equal	                    x == y
8	===	        Strict equal	            x === y
8	!=	        Unequal	                    x != y
8	!==	        Strict unequal	            x !== y
7	&	        Bitwise AND	                x & y
6	^	        Bitwise XOR	                x ^ y
5	|	        Bitwise OR	                x | y
4	&&	        Logical AND	                x && y
3	||	        Logical OR	                x || y
3	??	        Nullish Coalescing ES2020	x ?? y
2	? :	        Condition	                ? "yes" : "no"
2	=	        Simple Assignment	        x = y
2	:	        Colon Assignment	        x: 5
2	+=	        Addition Assignment	        x += y
2	-=	        Subtraction Assignment	    x -= y
2	*=	        Multiplication Assignment	x *= y
2	**=	        Exponentiation Assignment	x **= y
2	/=	        Division Assignment	        x /= y
2	%=	        Remainder Assignment	    x %= y
2	<<=	        Left Shift Assignment	    x <<= y
2	>>=	        Right Shift Assignment	    x >>= y
2	>>>=	    Unsigned Right Shift	    x >>>= y
2	&=	        Bitwise AND Assignment	    x &= y
2	|=	        Bitwise OR Assignment	    x |= y
2	^=	        Bitwise XOR Assignment	    x ^= y
2	&&=	        Logical AND Assignment	    x &= y
2	||=	        Logical OR Assignment	    x ||= y
2	=>	        Arrow	                    x => y
2	yield	    Pause / Resume	            yield x
2	yield*	    Delegate	                yield* x
2	...	        Spread	                    ... x
1	,	        Comma	                    x , y

*/



/*
--------------------------
Case Sensitivity
--------------------------
All JavaScript identifiers are case sensitive. 
The variables `lastName` and `lastname`, are two different variables:
*/

var lastname, lastName;
lastName = "Doe";
lastname = "Peterson";



/*
------------------------------------
Variable Naming Style
------------------------------------
Historically, programmers have used different ways of joining multiple words into one variable name:

- Hyphens

    first-name, last-name, master-card, inter-city.
    Hyphens are not allowed in JavaScript. 
    They are reserved for subtractions.


- Underscore

    first_name, last_name, master_card, inter_city.


- Upper Camel Case (Pascal Case):

    FirstName, LastName, MasterCard, InterCity.


- Lower Camel Case:

    JavaScript programmers tend to use camel case that starts with a lowercase letter:
    firstName, lastName, masterCard, interCity.
*/