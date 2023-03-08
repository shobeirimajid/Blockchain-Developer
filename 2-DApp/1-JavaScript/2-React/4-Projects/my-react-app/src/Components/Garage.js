import Car from './Car.js'

function Garage() {
    //const carName = "Ford";
    //const carInfo = { name: "Ford", model: "Mustang" };
    return (
      <div className="App">
        <header className="App-header">
          <h1>Who lives in my Garage?</h1>
          <Car info={ { name: "Ford", model: "Mustang" } } />
          <Car info={ { name: "Benz", model: "Sedan" } } />
        </header>
      </div>
    );
}

export default Garage;