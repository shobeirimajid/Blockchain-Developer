////////////////////////////////////////////////////////////////
//                   React useContext Hook
////////////////////////////////////////////////////////////////


//----------------------------
//  React Context
//----------------------------

// React Context is a way to `manage state globally`

// It can be used together with the `useState` Hook 
// to share state between deeply nested components more easily than with useState alone



//----------------------------
//  prop drilling
//----------------------------

// State should be held by the highest parent component in the stack that requires access to the state.

// There is a problem
// Suppose we have many nested components. 
// The component at the top and bottom of the stack need access to the state.

// To do this `without Context`
// we will need to pass the state as "props" through each nested component. 
// This is called "prop drilling"

// Example:
// Passing "props" through nested components

import { useState } from "react";
import ReactDOM from "react-dom/client";

function Component1() {

  const [user, setUser] = useState("Jesse Hall");

  return (
    <>
      <h1>{`Hello ${user}`}</h1>
      <Component2 user={user} />
    </>
  );
}


function Component2({ user }) {

  return (
    <>
      <h1>Component 2</h1>
      <Component3 user={user} />
    </>
  );
}


function Component3({ user }) {
  return (
    <>
      <h1>Component 3</h1>
      <Component4 user={user} />
    </>
  );
}


function Component4({ user }) {
  return (
    <>
      <h1>Component 4</h1>
      <Component5 user={user} />
    </>
  );
}


function Component5({ user }) {
  return (
    <>
      <h1>Component 5</h1>
      <h2>{`Goodby ${user}`}</h2>
    </>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Component1 />);

/*
        Hello Jesse Hall
        Component 2
        Component 3
        Component 4
        Component 5
        Goodby Jesse Hall
*/



