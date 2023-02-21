/**
    ----------------------------
            Ether Units
    ----------------------------
    https://docs.soliditylang.org/en/v0.8.18/units-and-global-variables.html#ether-units

    Transactions are paid with ether.
    Similar to how :

        1 dollar = 100 cent
        1 ether = 1018 we



    A literal number can take a suffix to specify a subdenomination of Ether
        - wei
        - gwei
        - ether 


    Ether numbers without a postfix are assumed to be Wei
        1 wei ~ 1


    Unit	Sci	        Exp         Wei
    ----    ----        ----        ----
    wei	    1           1	        1
    Kwei	1e3         10^3	    1,000
    Mwei	1e6         10^6	    1,000,000
    Gwei	1e9         10^9	    1,000,000,000
    Ether	1e18	    10^18       1,000,000,000,000,000,000


    Note:
        
    The "finney" and "szabo" have been removed in version 0.7.0.


    uint public oneWei = 1 wei;

    // 1 wei is equal to 1
    bool public isOneWei = 1 wei == 1;

    uint public oneEther = 1 ether;
    
    // 1 ether is equal to 10^18 wei
    bool public isOneEther = 1 ether == 1e18;



    ----------------------------
            Time Units
    ----------------------------

    https://docs.soliditylang.org/en/v0.8.18/units-and-global-variables.html#time-units


    Suffixes like seconds, minutes, hours, days and weeks after literal numbers can be used to specify units of time 
        seconds are the base unit and units are considered naively in the following way:


       Unit                Equ
    ----------          ----------       
    1 seconds           1
    1 minutes           60 seconds
    1 hours             60 minutes
    1 days              24 hours
    1 weeks             7 days


    Take care if you perform calendar calculations using these units
        because of "leap seconds" : 
            not every year equals 365 days
            not every day has 24 hours
    
    Due to the fact that "leap seconds" cannot be predicted, 
        an "exact calendar library" has to be updated by an "external oracle"


    Note:

    The suffix "years" has been removed in version 0.5.0 due to the "leap seconds".


    Note:
        
    These suffixes cannot be applied to variables.
    For example: if you want to interpret a function parameter in days, you can in the following way:

        function f(uint startDay, uint daysAfter) public {
            if (block.timestamp >= startDay + daysAfter * 1 days) {
                // ...
            }
        }
*/


