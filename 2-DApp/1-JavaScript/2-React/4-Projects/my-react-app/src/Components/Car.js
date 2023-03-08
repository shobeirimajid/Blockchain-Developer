function Car(props) {

  const shoot = (info, e) => {
    alert(`Hi, My model is: ${info.model}. Event:${e.type}`);
  }

  return (
    <>
      <p>My name is: { props.info.name }</p>
      <button onClick={(e) => shoot(props.info, e)}>Model</button>
    </>
  );
}

export default Car;