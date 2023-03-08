function Car(props) {
  return    <p>
                Hi, I am a Car.<br/>
                Name: { props.info.name }<br/>
                Model: { props.info.model }
            </p>;
}

export default Car;