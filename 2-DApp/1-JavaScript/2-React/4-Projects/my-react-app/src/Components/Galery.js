import Car from './Car.js'

function Galery() {

    //const carName = "Ford";
    //const carInfo = { name: "Ford", model: "Mustang" };

    /*return (
      <div className="Container">
        <div className="Cars-Container">
          <Car info={ { name: "Ford", model: "Mustang", year: 2020, stock: 10 } } />
          <Car info={ { name: "Benz", model: undefined, year: 2023, stock: 50 } } />
          <Car info={ { name: "Benz", model: "Sedan", year: 2015, stock: 0 } } />
          <Car info={ { name: "BMW", model: "BMW X6", year: 2023, stock: 0 } } />
        </div>
      </div>
    );*/

    const carsAry = [
        { id: "FordMustang", name: "Ford", model: "Mustang", year: 2020, stock: 10 },
        { id: "Benz2023", name: "Benz", model: undefined, year: 2023, stock: 50 },
        { id: "BenzSedan", name: "Benz", model: "Sedan", year: 2015, stock: 0 },
        { id: "BMWX6", name: "BMW", model: "BMW X6", year: 2023, stock: 0 }
    ];

    return (
        <div className="Container">
          <div className="Cars-Container">
            <ol>
              { carsAry.map( (elm, idx) => <Car key={elm.id} info={{...elm, index: idx}} />) }
            </ol>
          </div>
        </div>
    );
}

export default Galery;