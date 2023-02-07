/**
    Function abi.encode pads all arguments, to 32-bytes. 
    4-bytes function selector was padded to 32-bytes effectively 

    Ex:
        abi.encodeWithSignature("balanceOf(address)", sender)

        abi.encodeWithSelector(bytes4(keccak256(bytes("balanceOf(address)"))), sender)

        abi.encodeWithSelector(this.balanceOf().selector, sender)

        


*/