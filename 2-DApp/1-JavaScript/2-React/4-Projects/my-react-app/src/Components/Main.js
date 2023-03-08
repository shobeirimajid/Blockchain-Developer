import Car from './Car.js'

function Main() {

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
        { name: "Ford", model: "Mustang", year: 2020, stock: 10 },
        { name: "Benz", model: undefined, year: 2023, stock: 50 },
        { name: "Benz", model: "Sedan", year: 2015, stock: 0 },
        { name: "BMW", model: "BMW X6", year: 2023, stock: 0 }
    ];

    return (
        <div className="Container">
          <div className="Cars-Container">
            { 
                carsAry.map( (elm, idx) => {

                    /*let obj = {
                        id: idx + 1,
                        name: elm.name,
                        model: elm.model,
                        year: elm.year,
                        stock: elm.stock
                    };*/

                    return <Car key={idx} info={{...elm, key: idx}} />
                } ) 
            }
          </div>
        </div>
      );
}

export default Main;