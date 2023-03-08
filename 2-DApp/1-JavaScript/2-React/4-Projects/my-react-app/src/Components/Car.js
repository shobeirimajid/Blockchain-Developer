function Car(props) {

  const idx = props.info.index;
  const id = props.info.id;
  const year = props.info.year;
  const thisYear = new Date().getFullYear();
  const stock = props.info.stock;


  const sayModel = (info, e) => {
    if(info.model !== undefined) 
        alert(`${idx} - id: ${id} - Model: ${info.model} - Event:${e.type}`);
    else
        alert(`${idx} - id: ${id} - Model: Unknown - Event:${e.type}`);
  }


  return (
    <div>
      <li>
      <p>Name: { props.info.name }</p>
      { stock > 0 ? <p className="stock"> Stock: {stock}</p> : <p className="stock"> Sold out!</p> }
      <button onClick={(e) => sayModel(props.info, e)}>Model</button>
      { year === thisYear && <span className="modernCar"> {thisYear}!</span> }
      <hr/><br/>
      </li>
    </div>
  );
}

export default Car;