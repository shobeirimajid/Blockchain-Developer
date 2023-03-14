//-------------------------
//  Install Truffle
//-------------------------

Before you can use Truffle, install it using the npm command. Refer to the installation instructions to install Truffle.

Requirements:
    Node.js v14 - v18
    Windows / Linux / macOS


1- Install Node.js
    https://nodejs.org/en/download/
    Latest LTS Version: 
        node 18.15.0 
        npm 9.5.0


2- install the latest version of npm:
    npm i -g npm


3- install node-gyp
    npm install -g node-gyp

    Truffle requires node-gyp for compiling native add-on modules for Node.js. Truffle recommends installing the following node-gyp to avoid errors when installing Truffle. Follow the installation instructions here:
    https://github.com/nodejs/node-gyp#installation


4- Confirm that Node.js has been installed correctly 
    node --version.


5- use NPM to install Truffle
    npm install -g truffle


6- To confirm that Truffle was installed correctly, run:
    truffle version


7- install Ganache  (Personal Ethereum client)
    https://trufflesuite.com/ganache/

    Truffle requires a running Ethereum client which supports the standard JSON-RPC API. 
    There are many to choose from, and some better than others for development. 