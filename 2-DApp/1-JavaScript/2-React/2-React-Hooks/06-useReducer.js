////////////////////////////////////////////////////////////////
//                    React useReducer Hook
////////////////////////////////////////////////////////////////

// The `useReducer` Hook is similar to the `useState` Hook

// It allows for `custom state` logic.

// useReducer may be useful, 
// If you find yourself keeping track of `multiple pieces of state` that rely on complex logic, 



//----------------------------
//  Syntaxs
//----------------------------


const [current_state , dispatch_method] = useReducer(reducer_function, initialState);

//  arguments :

//      1- reducer_function       your custom state logic 
//      2- initialState           a simple value (but generally will contain an object)

//  returns :

//      1- current state 
//      2- dispatch method





//----------------------------
//  Example:
//----------------------------

// Here is an example of `useReducer` in a counter app

// This is just the logic to keep track of the todo `complete status`

// All of the logic to `add`, `delete`, and `complete` a todo 
// could be contained within a single `useReducer` Hook by adding more `actions`

import { useReducer } from "react";
import ReactDOM from "react-dom/client";


// argument 2 : initialState
const initialTodos = [
  {id: 1, title: "Todo 1", complete: false,},
  {id: 2,title: "Todo 2",complete: false,},
];


// argument 1 : reducer_function
const reducer = (state, action) => {

  switch (action.type) {
    case "COMPLETE":
      return state.map((todo) => {
        if (todo.id === action.id) {
          return { ...todo, complete: !todo.complete };
        } else {
          return todo;
        }
      });
    default:
      return state;
  }

};


function Todos() {

  // dispatch   :  dispatch_method
  // todos      :  current_state   
  const [todos, dispatch] = useReducer(reducer, initialTodos);

  const handleComplete = (todo) => {
    dispatch({ type: "COMPLETE", id: todo.id });
  };

  return (
    <>

      {todos.map((todo) => (

        <div key={todo.id}>
          <label>
            <input
              type="checkbox"
              checked={todo.complete}
              onChange={() => handleComplete(todo)}
            />
            {todo.title}
          </label>
        </div>

      ))}

    </>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Todos />);