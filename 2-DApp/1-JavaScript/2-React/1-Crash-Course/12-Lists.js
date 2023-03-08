////////////////////////////////////////////////////////////////
//                           React Lists
////////////////////////////////////////////////////////////////

// In React, you will render lists with some type of loop.

// The JavaScript map() array method is generally the preferred method.
// https://www.w3schools.com/react/react_es6.asp


// Example:
// Let's render all of the cars from our garage:

function Car(props) {
  return <li>I am a { props.brand }</li>;
}

function Garage() {
  const cars = ['Ford', 'BMW', 'Audi'];
  return (
    <>
      <h1>Who lives in my garage?</h1>
      <ul>
        {cars.map((car) => <Car brand={car} />)}
      </ul>
    </>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Garage />);

// When you run this code in your create-react-app, 
// it will work but you will receive a warning :
//      Warning: Each child in a list should have a unique "key" prop.

// It is because there is no "key" provided for the list items



//---------
//  Keys    
//---------

// Keys allow React to keep track of elements. 
// This way, if an item is updated or removed, 
// only that item will be re-rendered instead of the entire list.

// Keys need to be unique to each sibling. 
// But they can be duplicated globally.


// Generally, the key should be a unique ID assigned to each item. 
// As a last resort, you can use the array index as a key.



// Example:
// Let's refactor our previous example to include keys:

function Car(props) {
    return <li>I am a { props.brand }</li>;
  }
  
  function Garage() {
    const cars = [
      {id: 1, brand: 'Ford'},
      {id: 2, brand: 'BMW'},
      {id: 3, brand: 'Audi'}
    ];
    return (
      <>
        <h1>Who lives in my garage?</h1>
        <ul>
          {cars.map((car) => <Car key={car.id} brand={car.brand} />)}
        </ul>
      </>
    );
  }
  
  root = ReactDOM.createRoot(document.getElementById('root'));
  root.render(<Garage />);
