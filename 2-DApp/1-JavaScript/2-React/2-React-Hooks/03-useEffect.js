////////////////////////////////////////////////////////////////
//                    React useEffect Hooks
////////////////////////////////////////////////////////////////

// The `useEffect` Hook allows you to perform `side effects` in your components.



// Examples of side effects : 

    // 3- Fetching data
    // 2- Updating the DOM (directly)
    // 1- Timers



// useEffect accepts two arguments :

//      useEffect( <function>, <dependency> )

//      <dependency> is optional



// Example 1. No dependency passed

// Let's use a timer as an example.
// Use setTimeout() to count 1 second after initial render:

import { useState, useEffect } from "react";
import ReactDOM from "react-dom/client";

function Timer() {

  const [count, setCount] = useState(0);

  useEffect(() => {

    setTimeout(() => {
      setCount( (count) => count + 1 );
    }, 1000);

  });

  return <h1>I've rendered {count} times!</h1>;
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Timer />);



//----------------------------
//  This is not what we want
//----------------------------

// It keeps counting even though it should only count once!

// useEffect runs on every `render`
// That means that when the count changes, a render happens, which then triggers another effect.



//----------------------------
//  dependencies
//----------------------------

// There are several ways to control when side effects run.

// We should always include the second parameter which accepts an array. 
// We can optionally pass dependencies to useEffect in this array.


// 1. No dependency passed

useEffect(() => {
    //-----------------------------------
    //  Runs on every render
    //-----------------------------------
});



// 2. An empty array

useEffect(() => {
    //-----------------------------------
    //  Runs only on the first render
    //-----------------------------------
}, []);



// 3. Props or state values

useEffect(() => {
    //-----------------------------------
    // Runs on the first render
    // And any time any dependency value changes
    //-----------------------------------
}, [prop, state]);



// Example 2: An empty array

// To fix the issue, 
// let's only run the effect on the initial render.

import { useState, useEffect } from "react";
import ReactDOM from "react-dom/client";

function Timer() {

  const [count, setCount] = useState(0);

  useEffect(() => {

    setTimeout(() => {
      setCount((count) => count + 1);
    }, 1000);

  }, []); // <- add empty brackets here

  return <h1>I've rendered {count} times!</h1>;
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Timer />);




// Example 3. Props or state values

// Here is an example of a useEffect Hook that is dependent on a variable. 
// If the count variable updates, the effect will run again:

import { useState, useEffect } from "react";
import ReactDOM from "react-dom/client";

function Counter() {

  const [count, setCount] = useState(0);
  const [calculation, setCalculation] = useState(0);

  useEffect(() => {
    setCalculation(() => count * 2);
  }, [count]);  // <- add the count variable here
                // If there are multiple dependencies, 
                // they should be included in the useEffect dependency array.

  return (
    <>
      <p>Count: {count}</p>
      <button onClick={() => setCount((c) => c + 1)}>+</button>
      <p>Calculation: {calculation}</p>
    </>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Counter />);

/*
    Count:       1          Count:       2          Count:       3
    |+|                     |+|                     |+|
    Calculation: 2          Calculation: 4          Calculation: 6
*/




//----------------------------
//  Effect Cleanup
//----------------------------

// Some effects require cleanup to reduce memory leaks.

    // Timeouts
    // subscriptions
    // event listeners

// and other effects that are no longer needed, should be disposed.

// We do this by including a return function at the end of the useEffect Hook.



// Example:
// Clean up the timer at the end of the useEffect Hook:

import { useState, useEffect } from "react";
import ReactDOM from "react-dom/client";

function Timer() {

  const [count, setCount] = useState(0);


  useEffect(() => {

    // to be able to clear the timer, we had to name it
    let timer = setTimeout(() => {
      setCount((count) => count + 1);
    }, 1000);

    return () => clearTimeout(timer)

  }, []);


  return <h1>I've rendered {count} times!</h1>;
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Timer />);





