////////////////////////////////////////////////////////////////
//                        React Memo
////////////////////////////////////////////////////////////////

// This section uses React Hooks. 
// See the React Hooks section for more information on Hooks.
// https://www.w3schools.com/react/react_hooks.asp

// Using memo will cause React to skip rendering a component if its props have not changed.
// This can improve performance.


//----------------------
//  Problem
//----------------------

// In this example, the `Todos` component `re-renders` even when the `todos` have not changed.



// Example:


// index.js:
import { useState } from "react";
import ReactDOM from "react-dom/client";
import Todos from "./Todos";

const App = () => {

  const [count, setCount] = useState(0);
  const [todos, setTodos] = useState(["todo 1", "todo 2"]);

  const increment = () => {
    setCount((c) => c + 1);
  };

  return (
    <>
      <Todos todos={todos} />
      <hr />
      <div>
        Count: {count}
        <button onClick={increment}>+</button>
      </div>
    </>
  );
};

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<App />);


// Todos.js:
const Todos = ({ todos }) => {

  console.log("child render");

  return (
    <>
      <h2>My Todos</h2>
      {todos.map((todo, index) => {
        return <p key={index}>{todo}</p>;
      })}
    </>
  );

};

export default Todos;


// When you click the increment button, the Todos component re-renders.
// If this component was complex, it could cause performance issues.



//----------------------
//  Solution
//----------------------
