////////////////////////////////////////////////////////////////
//                    React useMemo Hook
////////////////////////////////////////////////////////////////

// The React `useMemo` Hook returns a `memoized value`

// Think of memoization as caching a value so that it does not need to be recalculated.

// The useMemo Hook only runs when one of its dependencies update.

// This can improve performance.


// The `useMemo` and `useCallback` Hooks are similar. 

// The main difference is that :
//      useMemo          returns a memoized value 
//      useCallback      returns a memoized function. 



//----------------------------
//  Performance
//----------------------------

// The useMemo Hook can be used to keep expensive,
// resource intensive functions from needlessly running.

// In this example, we have an expensive function that runs on every render.

// When changing the count or adding a todo, you will notice a delay in execution.


// Example

// A poor performing function. 
// The expensiveCalculation function runs on every render:

import { useState } from "react";
import ReactDOM from "react-dom/client";

const App = () => {

  const [count, setCount] = useState(0);
  const [todos, setTodos] = useState([]);

  const calculation = expensiveCalculation(count);

  const increment = () => {
    setCount((c) => c + 1);
  };

  const addTodo = () => {
    setTodos((t) => [...t, "New Todo"]);
  };

  return (
    <div>
      <div>

        <h2>My Todos</h2>

        {todos.map((todo, index) => {
          return <p key={index}>{todo}</p>;
        })}
        <button onClick={addTodo}>Add Todo</button>
      </div>
      <hr />
      <div>
        Count: {count}
        <button onClick={increment}>+</button>
        <h2>Expensive Calculation</h2>
        {calculation}
      </div>
    </div>
  );
};


const expensiveCalculation = (num) => {

  console.log("Calculating...");

  for (let i = 0; i < 1000000000; i++) {
    num += 1;
  }
  return num;
};

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<App />);



//----------------------------
//  Use useMemo
//----------------------------

// To fix this performance issue, 
// we can use the `useMemo` Hook 
// to memoize the expensiveCalculation function. 
// This will cause the function to only run when needed.

// We can wrap the expensive function call with useMemo.

// The useMemoHook accepts a second parameter to declare dependencies. 
// The expensive function will only run when its dependencies have changed.

// In the following example, 
// the expensive function will only run when count is changed and not when todo's are added.



// Example

// Performance example using the useMemo Hook:


import { useState, useMemo } from "react";
import ReactDOM from "react-dom/client";

const App = () => {

  const [count, setCount] = useState(0);
  const [todos, setTodos] = useState([]);

  const calculation = useMemo(() => expensiveCalculation(count), [count]);

  const increment = () => {
    setCount((c) => c + 1);
  };

  const addTodo = () => {
    setTodos((t) => [...t, "New Todo"]);
  };

  return (
    <div>
      <div>

        <h2>My Todos</h2>

        {todos.map((todo, index) => {
          return <p key={index}>{todo}</p>;
        })}

        <button onClick={addTodo}>Add Todo</button>

      </div>

      <hr />

      <div>

        Count: {count}

        <button onClick={increment}>+</button>

        <h2>Expensive Calculation</h2>

        {calculation}

      </div>
    </div>
  );
};

const expensiveCalculation = (num) => {

  console.log("Calculating...");
  
  for (let i = 0; i < 1000000000; i++) {
    num += 1;
  }
  return num;

};

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<App />);