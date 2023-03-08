/////////////////////////////////////////////////////////////////
//                       React Props
////////////////////////////////////////////////////////////////

// props stands for properties.

// Props are `arguments` passed into React `components`.

// Props are passed to components via  HTML `attributes`.



//-----------------------
// React Props
//-----------------------

// React Props are like :

//  `function arguments`    in  JavaScript 
//  `attributes`            in  HTML

// To send props into a component, 
// use the same syntax as HTML attributes:


// Note:    React Props are read-only! 
//          You will get an error if you try to change their value.



// Example
// Add a "brand" attribute to the Car element:

const myElement = <Car brand="Ford" />;

// The component `Car` receives the argument as a `props` object:

// So we can use the `brand` attribute in the component `Car`:

function Car(props) {
    return <h2>I am a { props.brand }!</h2>;
}




//-----------------------
// Pass Data
//-----------------------

// Props are also how you pass data from one component to another, as parameters.


// Example
// Send the "brand" property from the Garage component to the Car component:

function Car(props) {
    return <h2>I am a { props.brand }!</h2>;
}
  
function Garage() {
    return (
      <>
        <h1>Who lives in my garage?</h1>
        <Car brand="Ford" />
      </>
    );
}
  
root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Garage />);


// If you have a variable to send, 
// and not a string as in the example above, 
// you just put the variable name inside curly brackets:


// Create a variable named carName and send it to the Car component:

function Car(props) {
  return <h2>I am a { props.brand }!</h2>;
}

function Garage() {
  const carName = "Ford";
  return (
    <>
      <h1>Who lives in my garage?</h1>
      <Car brand={ carName } />
    </>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Garage />);