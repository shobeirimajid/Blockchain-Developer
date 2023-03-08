import logo from '../img/Mercedes-Logo.png';

function Header() {
    return (
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <h1>Buy your new car online</h1>
      </header>
    );
}

export default Header;