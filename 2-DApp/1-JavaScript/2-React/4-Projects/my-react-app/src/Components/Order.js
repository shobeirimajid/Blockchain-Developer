import { useState } from 'react';
//import ReactDOM from 'react-dom/client';

function Order() {
  const [inputs, setInputs] = useState({});
  //const [name, setName] = useState("");
  
  const handleSubmit = (event) => {
    event.preventDefault();
    //alert(`The name you entered was: ${name}`);
    console.log(inputs);
  }

  const handleChange = (event) => {
    const name = event.target.name;
    const value = event.target.value;
    setInputs(values => ({ ...values, [name]: value }))
    //console.log(`name: ${inputs.username} - count: ${inputs.count} - car: ${inputs.car} - comment: ${inputs.comment}`);
  }

  return (
    <div className="Container">
      <div className="OrderForm">

        <form onSubmit={handleSubmit}>

          <label>Enter your name:</label><br/>
          <input
            style={{width: `50%`}} 
            type="text"
            name="username"
            value={inputs.username || ""}
            onChange={handleChange}
          /><br/>
          
          <label>Enter order count:</label><br/>
          <input
            style={{width: `50%`}} 
            type="number"
            name="count"
            value={inputs.count || ""}
            onChange={handleChange}
          /><br/>

          <label>Select your car:</label><br/>
          <select 
            style={{width: `50%`}} 
            name="car" 
            value={inputs.car} 
            onChange={handleChange}
          >
            <option value="Benz">Benz</option>
            <option value="BMW">BMW</option>
            <option value="Ford">Ford</option>
            <option value="Volvo">Volvo</option>
          </select><br/><br/>

          <label>Write your comment:</label><br/>
          <textarea 
            style={{width: `50%`}} 
            rows={`5`}
            placeholder="We'd be grateful for any suggestions you might have."
            name="comment"
            value={inputs.comment} 
            onChange={handleChange} 
          /><br/><br/>
          
          <input 
            style={{width: `50%`}} 
            type="submit" 
          />

        </form>

      </div>
    </div>
  );
}

export default Order;