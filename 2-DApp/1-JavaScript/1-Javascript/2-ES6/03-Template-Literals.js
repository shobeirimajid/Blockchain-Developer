/*
    --------------------------------------
    Template Literals in ES6
    --------------------------------------

    Template literals are a way to output variables in the string.

    Prior to ES6 we had to break the string, 
    for example:

        let name = 'David';
        let msg = 'Welcome ' + name + '!';
        console.log(msg);


    ES6 introduces a new way of outputting variable values in strings.

    The same code above can be rewritten as:

        let name = 'David';
        let msg = `Welcome ${name}!`;
        console.log(msg);


    ----------
    Notice
    ----------
    template literals are enclosed by the backtick (` `) character 
    instead of double or single quotes.

    The ${expression} is a placeholder, 
    and can include any expression, 
    which will get evaluated and inserted into the template literal.

    For example:

            let a = 8;
            let b = 34;
            let msg = `The sum is ${a+b}`;
            console.log(msg);


    To escape a backtick in a template literal, 
    put a backslash \ before the backtick.


    Example:

            function main() {
                var country = readLine();
                var capital = readLine();
                console.log(countryCard(country, capital));
            }

            function countryCard(country, capital){
                var msg = `Name: ${country}, Capital: ${capital}`;
                return msg;
            }


*/