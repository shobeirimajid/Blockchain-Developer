/////////////////////////////////////////////////////////////////
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


