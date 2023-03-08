import logo from './logo.svg';
import './App.css';
import Car from './Components/Car.js'

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}


function HelloWorld() {
  return (
    <div className="App">
      <header className="App-header">
        <h1>Hello World!</h1>
      </header>
    </div>
  );
}


function Garage() {
  const carName = "Ford";
  const carInfo = { name: "Ford", model: "Mustang" };
  return (
    <div className="App">
      <header className="App-header">
        <h1>Who lives in my Garage?</h1>
        <Car info={ carInfo } />
      </header>
    </div>
  );
}

export default Garage;
