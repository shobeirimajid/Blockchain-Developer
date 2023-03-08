import logo from '../img/logo.svg';

function Header() {
    return (
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <h1>Who lives in my Garage?</h1>
      </header>
    );
}

export default Header;