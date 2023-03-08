/////////////////////////////////////////////////////////////////
//                       JSX
/////////////////////////////////////////////////////////////////


//-------------------------------
// What is JSX?
//-------------------------------

// JSX stands for JavaScript XML.

// JSX allows us to write HTML in React.

// JSX makes it easier to write and add HTML in React.



//-------------------------------
// Coding JSX
//-------------------------------

// JSX allows us to write HTML elements in JavaScript 
// and place them in the DOM without any createElement() , appendChild() methods.

// JSX converts HTML tags into react elements.

// You are not required to use JSX, 
// but JSX makes it easier to write React applications.


const myElement = <></>;


// Example 1:  Create myElement With JSX 
myElement = <h1>HelloWorld!</h1>;

// Example 2:  Create myElement Without JSX
myElement = React.createElement('h1', {}, 'HelloWorld!');


const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(myElement);


// As you can see in the first example, 
// JSX allows us to write HTML directly within the JavaScript code.

// JSX is an extension of the JavaScript language based on ES6, 
// and is translated into regular JavaScript at runtime.



//-------------------------------
// Expressions in JSX
//-------------------------------

// With JSX you can write expressions inside curly braces { }

// The expression can be a React variable, or property, or any other valid JavaScript expression. 

// JSX will execute the expression and return the result:

// Example:
// Execute the expression 5 + 5:

myElement = <h1>React is {5 + 5} times better with JSX</h1>;



//-------------------------------
// Inserting a Large Block of HTML
//-------------------------------

// To write HTML on multiple lines, put the HTML inside parentheses:
// Create a list with three list items:

myElement = (
    <ul>
      <li>Apples</li>
      <li>Bananas</li>
      <li>Cherries</li>
    </ul>
);



//-------------------------------
// One Top Level Element
//-------------------------------

// The HTML code must be wrapped in ONE top level element.

// So if you like to write two paragraphs, 
// you must put them inside a parent element, like a div element.

// JSX will throw an error if the HTML is not correct, 
// or if the HTML misses a parent element.


// Example:

// Wrap two paragraphs inside one DIV element:

myElement = (
    <div>
      <p>I am a paragraph.</p>
      <p>I am a paragraph too.</p>
    </div>
);



//-------------------------------
// fragment
//-------------------------------

// you can use a "fragment" to wrap multiple lines, without adding top level element (node)
// This will prevent unnecessarily adding extra nodes to the DOM.

// A fragment looks like an empty HTML tag: <></>

// Example:

// Wrap two paragraphs inside a fragment:

myElement = (
  <>
    <p>I am a paragraph.</p>
    <p>I am a paragraph too.</p>
  </>
);



//-------------------------------
// Elements Must be Closed
//-------------------------------

// JSX follows XML rules, and therefore HTML elements must be properly closed.
// JSX will throw an error if the HTML is not properly closed.


// Example:

// Close empty elements with />

myElement = <input type="text" />;


//-------------------------------
// Attribute class = className
//-------------------------------

// The `class` attribute is a much used attribute in HTML, 
// but since JSX is rendered as JavaScript, and the `class` keyword is a reserved word in JavaScript, 
// you are not allowed to use `class` keyword in JSX

// JSX solved this by using `className` instead. 
// When JSX is rendered, it translates className attributes into class attributes.

// Example

// Use attribute className instead of class in JSX:

myElement = <h1 className="myclass">Hello World</h1>;



//-------------------------------
// Conditions - if statements
//-------------------------------

// React supports if statements, 
// but not inside JSX.

// To be able to use conditional statements in JSX you have two option:
//      (1) you could put the if statements outside of the JSX
//      (2) you could use a ternary expression instead


// Example:
// Write "Hello" if x is less than 10, otherwise "Goodbye":


// Option 1:    Write if statements outside of the JSX code

x = 5;
let text = "Goodbye";
if (x < 10) {
  text = "Hello";
}
myElement = <h1>{text}</h1>;


// Option 2:    Use ternary expressions instead

x = 5;
myElement = <h1>{(x) < 10 ? "Hello" : "Goodbye"}</h1>;


// NOTE :
//    in order to embed a JavaScript expression inside JSX, 
//    the JavaScript must be wrapped with curly braces, {}