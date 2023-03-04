///////////////////////////////////////////////////////
//                       Boolean 
///////////////////////////////////////////////////////

/*
    Very often, in programming, you will need a data type that 
     can only have one of two values, like

        YES / NO
        ON / OFF
        TRUE / FALSE

    For this, JavaScript has a Boolean data type.     
*/



// Booleans can only have two values:
    true;
    false;



// Booleans are often used in conditional testing.

    x = 5;
    y = 5;
    z = 6;

    Boolean(x > z)      // Returns false
    (x < z)             // Returns true          
    if(x == y)          // Returns true
    if(x <= y)          // Returns true



// Negation uses the ! symbol

    !true;      // = false
    !false;     // = true



// ----------
// falsy
// ----------
// Everything Without a "Value" is False
    false
    null
    undefined
    NaN 
    ""  
    0
    -0



// ----------
// truthy
// ----------
// Everything With a "Value" is True
    true
    100
    3.14
    -15
    "Hello"
    "false"
    "0"  



/*
----------
Note 
----------
*/
if(0)           // false
if("0")         // true

0 == "0"        // true
0 === "0"       // false