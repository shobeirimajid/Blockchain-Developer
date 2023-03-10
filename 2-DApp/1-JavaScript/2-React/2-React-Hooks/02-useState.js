////////////////////////////////////////////////////////////////
//                    React useState Hook
////////////////////////////////////////////////////////////////

// The React `useState` Hook allows us to `track state` in a `function component`

// State generally refers to `data or properties` that need to be  `tracking`  in an application


//----------------------------
//  Import useState
//----------------------------

// To use the useState Hook, 
// we first need to import it into our component.


// At the top of your component, import the useState Hook.

import { useState } from "react";

// Notice that we are  `destructuring`  useState from react as it is a `named export`

// To learn more about destructuring, check out the ES6 section.
// https://www.w3schools.com/react/react_es6_destructuring.asp



//----------------------------
// Initialize useState
//----------------------------

// We  `initialize`  our state by calling  `useState`  in our function component.


// const [`current_state`, `updater_function`] = useState(`initial state`);


// `useState`  accepts an  `initial state`  and returns two  `values` :

    // a  `current state`
    // a  `function` that updates the state




// Example:
// Initialize state at the top of the function component.

import { useState } from "react";

function FavoriteColor() {

  // Destructuring the returned values from useState :
  //    color :       our current state
  //    setColor :    the function that is used to update our state

  // names `color` , `setColor` are variables that can be named anything you would like.

  // initial state had been set to an empty string ( useState("") )

  const [color, setColor] = useState("");
}



//----------------------------
// Read State
//----------------------------

// We can now include our state anywhere in our component.

// Example:
// Use the state variable in the rendered component.

import { useState } from "react";
import ReactDOM from "react-dom/client";

function FavoriteColor() {

  const [color, setColor] = useState("red");

  return <h1>My favorite color is {color}!</h1>
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<FavoriteColor />);




//----------------------------
// Update State
//----------------------------

// To update our state, we use our state updater function.

// We should never directly update state. 
// Ex: 
// color = "red"    //  is not allowed.


// Example:
// Use a button to update the state:

import { useState } from "react";
import ReactDOM from "react-dom/client";

function FavoriteColor() {

  const [color, setColor] = useState("red");

  return (
    <>
      <h1>My favorite color is {color}!</h1>

      <button
        type="button"
        onClick={() => setColor("blue")}
      >Blue</button>

    </>
  )
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<FavoriteColor />);




//----------------------------
// What Can State Hold
//----------------------------

// The useState Hook can be used to keep track of :

    // strings
    // numbers
    // booleans
    // arrays
    // objects
    // and any combination of these



// We could create `multiple state Hooks` to track individual values.
// Or, we can just use `one state `and include an `object` instead!


// Example:



// (1) - Create multiple state Hooks:

import { useState } from "react";
import ReactDOM from "react-dom/client";

function Car() {

  const [brand, setBrand] = useState("Ford");
  const [model, setModel] = useState("Mustang");
  const [year, setYear] = useState("1964");
  const [color, setColor] = useState("red");

  return (
    <>
      <h1>My {brand}</h1>
      <p>
        It is a {color} {model} from {year}.
      </p>
    </>
  )
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Car />);



// (2) - Create a single Hook that holds an object

import { useState } from "react";
import ReactDOM from "react-dom/client";

function Car() {

  const [car, setCar] = useState( {brand: "Ford", model: "Mustang", year: "1964", color: "red"} );

    // Since we are now tracking a single object, 
    // we need to reference that object and then the property of that object when rendering the component. 
    // (Ex: car.brand)

  return (
    <>
      <h1>My {car.brand}</h1>
      <p>
        It is a {car.color} {car.model} from {car.year}.
      </p>
    </>
  )
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Car />);




//----------------------------
// Updating Objects and Arrays in State
//----------------------------

// When state is updated, the entire state gets overwritten.

// What if we only want to update the color of our car?

// If we only called setCar({color: "blue"}), 
// this would remove the brand, model, and year from our state.

// We can use the JavaScript `spread` operator to help us.


// Example

import { useState } from "react";
import ReactDOM from "react-dom/client";

function Car() {

  const [car, setCar] = useState( {brand: "Ford", model: "Mustang", year: "1964", color: "red"} );

    // Because we need the current value of state, 
    // we pass a function into setCar()
    // This function receives the previous state object (previousState)
    // Then spreading the previousState and overwriting only the color 
    // and finally returns modified state object

  const updateColor = () => {

    setCar(previousState => {
        // Use the JavaScript `spread` operator to update only the `color` of the car:
        return { ...previousState, color: "blue" }
    });

  }

  return (
    <>
      <h1>My {car.brand}</h1>
      <p>It is a {car.color} {car.model} from {car.year}.</p>

      <button
        type="button"
        onClick={updateColor}
      >Blue</button>

    </>
  )
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Car />);













