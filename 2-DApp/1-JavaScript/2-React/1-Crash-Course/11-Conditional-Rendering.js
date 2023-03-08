////////////////////////////////////////////////////////////////
//                  React Conditional Rendering
////////////////////////////////////////////////////////////////

// In React, you can conditionally render components.

// There are several ways to decide which component would render:

    // (1) if Statement
    // (2) Logical && Operator
    // (3) Ternary Operator


//----------------------------
//  (1) if Statement
//----------------------------

// We can use the if JavaScript operator to decide which component to render.


// Example

// We'll use these two components:

function MissedGoal() {
    return <h1>MISSED!</h1>;
}
  
function MadeGoal() {
    return <h1>Goal!</h1>;
}

// Now, we'll create another component that chooses which component to render based on a condition:

function Goal(props) {

    const isGoal = props.isGoal;
    
    if (isGoal) {
      return <MadeGoal/>;
    }
    return <MissedGoal/>;
}
  
root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Goal isGoal={false} />);


// Try changing the isGoal attribute to true:


root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Goal isGoal={true} />);



//----------------------------
//  (2) && Operator
//----------------------------

// Another way to conditionally render a React component is by using the && operator.

// Example:
// We can embed JavaScript expressions in JSX by using curly braces `{}`
// If cars.length > 0 is equates to true, the expression after && will render.

function Garage(props) {
    const cars = props.cars;
    return (
      <>
        <h1>Garage</h1>
        {cars.length > 0 &&
          <h2>
            You have {cars.length} cars in your garage.
          </h2>
        }
      </>
    );
  }

  
  const cars = ['Ford', 'BMW', 'Audi'];
  const root = ReactDOM.createRoot(document.getElementById('root'));
  root.render(<Garage cars={cars} />);




//----------------------------
//  (2) Ternary Operator
//----------------------------

// Another way to conditionally render elements is by using a ternary operator.

// condition ? true : false

// We will go back to the goal example.

// Return the MadeGoal component if isGoal is true, otherwise return the MissedGoal component:

function Goal(props) {
    const isGoal = props.isGoal;
    return (
      <>
        { isGoal ? <MadeGoal/> : <MissedGoal/> }
      </>
    );
}
  
root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Goal isGoal={false} />);