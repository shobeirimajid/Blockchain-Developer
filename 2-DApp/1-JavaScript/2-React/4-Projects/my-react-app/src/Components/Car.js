function Car(props) {

  const sayModel = (info, e) => {
    if(info.model !== undefined) 
        alert(`Model: ${info.model}. Event:${e.type}`);
    else
        alert(`Model: Unknown. Event:${e.type}`);
  }

  //const id = props.info.id;

  const year = props.info.year;
  const stock = props.info.stock;

  return (
    <div>
      <p>Name: { props.info.name }</p>
      { stock > 0 ? <p className="stock"> Stock: {stock}</p> : <p className="stock"> Sold out!</p> }
      <button onClick={(e) => sayModel(props.info, e)}>Model</button>
      { year >= 2020 && <span className="modernCar"> modern car!</span> }
      <hr/><br/>
    </div>
  );
}

export default Car;