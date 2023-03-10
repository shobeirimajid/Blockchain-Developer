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


// Even though components 2-4 did not need the state, 
// they had to pass the state along so that it could reach component 5.



//----------------------------
//  Create Context
//----------------------------

// The solution is to create context.
// To create context, you must Import createContext and initialize it:

// 1- Import createContext
import { useState, createContext } from "react";

import ReactDOM from "react-dom/client";

// 2- initialize createContext
const UserContext = createContext()


// 3- wrap the tree of components that need the state Context via the `Context Provider`
function Component1() {

    const [user, setUser] = useState("Jesse Hall");
  
    return (
      // Wrap child components in the `Context Provider` and supply the state value.
      // Now, all components in this tree will have access to the user Context.
      <UserContext.Provider value={user}>
        <h1>{`Hello ${user}!`}</h1>
        <Component2 user={user} />
      </UserContext.Provider>
    );
}


//----------------------------
//  useContext
//----------------------------

// In order to use the Context in a child component, 
// we need to access it using the `useContext` Hook


// First, include the useContext in the import statement:
import { useState, createContext, useContext } from "react";


// Then you can access the user Context in all components:
function Component5() {

    const user = useContext(UserContext);
  
    return (
      <>
        <h1>Component 5</h1>
        <h2>{`Goodby ${user}`}</h2>
      </>
    );
}




//----------------------------
//  Full Example
//----------------------------

// Here is the full example using React Context:


// 1- import the `createContext` , `useContext`
import { useState, createContext, useContext } from "react";

import ReactDOM from "react-dom/client";

// 2- initialize the `createContext`
const UserContext = createContext();


function Component1() {

  const [user, setUser] = useState("Jesse Hall");

  return (

    // 3- Wrap child components in the `Context Provider` and supply the state value.
    <UserContext.Provider value={user}>
      <h1>{`Hello ${user}!`}</h1>
      <Component2 />
    </UserContext.Provider>
    // Now, all components in this tree will have access to the user Context.
  );
}

function Component2() {
  return (
    <>
      <h1>Component 2</h1>
      <Component3 />
    </>
  );
}

function Component3() {
  return (
    <>
      <h1>Component 3</h1>
      <Component4 />
    </>
  );
}

function Component4() {
  return (
    <>
      <h1>Component 4</h1>
      <Component5 />
    </>
  );
}


function Component5() {

  // 4- access the user Context in child components
  const user = useContext(UserContext);

  return (
    <>
      <h1>Component 5</h1>
      <h2>{`Hello ${user} again!`}</h2>
    </>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Component1 />);