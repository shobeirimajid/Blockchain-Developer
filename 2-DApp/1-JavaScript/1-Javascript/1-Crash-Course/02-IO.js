///////////////////////////////////////////////////////
//                   Input/Output
///////////////////////////////////////////////////////

// input
//----------------------------

let namevar = prompt("Please enter your name", "Ex. Shobeiri");
var msg = "Hello " + namevar + "! How are you today?";


// output
//----------------------------

document.write(msg);    // Writing into the HTML output / just for testing purposes / will delete all existing HTML
                        // var element = document.getElementById("demo")
element.innerHTML(msg); // Writing into an HTML element / a common way to display data in HTML

alert(msg);             // Writing into an alert box / display data using an alert box 

console.log(msg);       // Writing into the browser console / For debugging purposes

window.print();         // to print the content of the current window.


/*
    You cannot access output devices from JavaScript.
    The only exception is `window.print()`
*/


/*
    In JavaScript, the `window` object is the global scope object. 
    This means that variables, properties, and methods by default belong to the window object. 
    This also means that specifying the window keyword is optional.
    window.alert(msg) ~ alert(msg)
*/
