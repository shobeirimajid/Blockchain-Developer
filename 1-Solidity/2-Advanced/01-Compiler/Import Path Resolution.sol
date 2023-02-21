/*
    ------------------------
    Import Path Resolution
    ------------------------
    https://docs.soliditylang.org/en/latest/path-resolution.html


    In order to be able to support reproducible builds on all platforms, 
    the Solidity compiler has to abstract away the details of the filesystem 
    where source files are stored. 
    
    Paths used in imports must work the same way everywhere while the command-line interface 
    must be able to work with platform-specific paths to provide good user experience. 
    
    This section aims to explain in detail how Solidity reconciles these requirements.

    

*/