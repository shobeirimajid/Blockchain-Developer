////////////////////////////////////////////////////////////////
//                   Styling React Using CSS
////////////////////////////////////////////////////////////////

// `State` generally refers to  `application data`  or  `properties`  that need to be tracked.


// Before adding 'Hooks" to react, `state` had been handled via `class components`.

// Hooks were added to React in version 16.8
// `Hooks` allow  `function components`  to have access to `state` and other React features.

// Using `Hook`s together with `function components`, we no longer need to `class components`.
// Although Hooks generally replace class components, there are no plans to remove classes from React.



//----------------------------
//  What is a Hook?
//----------------------------

// Hooks allow us to access(hook) into React features such as :

//    state
//    lifecycle


// Here is an example of a Hook. 
// Don't worry if it doesn't make sense. 
// We will go into more detail in the next section.



// Example:

// You must import Hooks from react.
// Here we are using the `useState Hook` to keep track of the application state.

import React, { useState } from "react";
import ReactDOM from "react-dom/client";

function FavoriteColor() {

  const [color, setColor] = useState("blue");

  return (
    <>
      <h1>My favorite color is {color}!</h1>

      <button
        type="button"
        onClick={() => setColor("blue")}
      >Blue</button>

      <button
        type="button"
        onClick={() => setColor("red")}
      >Red</button>

      <button
        type="button"
        onClick={() => setColor("pink")}
      >Pink</button>

      <button
        type="button"
        onClick={() => setColor("green")}
      >Green</button>
    </>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<FavoriteColor />);




//----------------------------
//  Hook Rules
//----------------------------

// There are 3 rules for hooks:

    // Hooks can only be called :       
            // inside React  `function components` (will not work in `class components`)
            // at the `top level` of a component

    // Hooks `cannot be conditional`
    

//----------------------------
// Custom Hooks
//----------------------------

// If you have  `stateful logic`  that needs to be  `reused in several components`
// you can build your own `custom Hooks`

// We'll go into more detail in the Custom Hooks section.
// https://www.w3schools.com/react/react_customhooks.asp