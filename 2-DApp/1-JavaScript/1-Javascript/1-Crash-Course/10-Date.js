///////////////////////////////////////////////////////
//                      Date Object
///////////////////////////////////////////////////////
/*
The Date object enables us to work with dates.

A date object consists of:
        year
        month
        day
        hour
        minute
        second
        milliseconds

We can create a new date object with the current date and time Using new.

You cannot omit month. 

If you supply only one parameter it will be treated as milliseconds.

JavaScript stores dates as number of milliseconds since January 01, 1970.
Zero time is January 01, 1970 00:00:00 UTC

One day (24 hours) is 86,400,000 milliseconds.

JavaScript counts months from 0 to 11
    January is 0
    December is 11

Date objects are static, rather than dynamic. 
The computer time is ticking, but date objects don't change, once created.

When a Date object is created, a number of methods make it possible to perform operations on it
Date methods allow you to get and set the 
    year, month, day, hour, minute, second, and millisecond of date objects, 
using either local time or UTC (or GMT) time.
UTC (Universal Time Coordinated) is the same as GMT (Greenwich Mean Time).


-----------------------
JavaScript Date Input
-----------------------
There are generally 3 types of JavaScript date input formats:

    Type	        Example
    ---------       ---------------------------------------------
    ISO Date	    "2015-03-25" (The International Standard)
    Short Date	    "03/25/2015"
    Long Date	    "Mar 25 2015" or "25 Mar 2015"

The ISO format follows a strict standard in JavaScript.
The other formats are not so well defined and might be browser specific.


-----------------------
JavaScript Date Output
-----------------------
Independent of input format, 
JavaScript will (by default) output dates in full text string format:
JavaScript will (by default) use the browser's time zone 
    Fri Mar 03 2023 23:41:11 GMT+0330 (Iran Standard Time)


-----------------------
Time Zones
-----------------------
When setting a date, without specifying the time zone, JavaScript will use the browser's time zone.
When getting a date, without specifying the time zone, the result is converted to the browser's time zone.
*/


/*
-----------------------
Examples
-----------------------
*/

d = new Date()                              // creates a date object with the current date and time
d = new Date(date-string)                   // new Date("2022-03-25")
d = new Date(ms)                            // new Date(86400000)
d = new Date(year,month)                    // new Date(2018, 11)
d = new Date(year,month,day)                // new Date(2018, 11, 24)
d = new Date(year,month,day,hr)             // new Date(2018, 11, 24, 10)
d = new Date(year,month,day,hr,min)         // new Date(2018, 11, 24, 10, 33)
d = new Date(year,month,day,hr,min,sec)     // new Date(2018, 11, 24, 10, 33, 30)
d = new Date(year,month,day,hr,min,sec,ms)  // new Date(2018, 11, 24, 10, 33, 30, 0);

d = new Date("January 2, 2015 10:42:00");   // Fri Jan 02 2015 10:42:00

d = new Date(24 * 60 * 60 * 1000);  // Fri January 02 1970 00:00:00 ~ January 01 1970 + 24 hours
d = new Date(86400000);             // One day contains 86,400,000 millisecond.            
d = new Date(-100000000000);        // Mon Oct 31 1966 17:43:20 ~ January 01 1970 - 100,000,000,000 ms

// One and two digit years will be interpreted as 19xx:
d = new Date(99, 11, 24);   // Fri Dec 24 1999 00:00:00
d = new Date(9, 11, 24);    // Fri Dec 24 1909 00:00:00

// Specifying a month higher than 11, will not result in an error 
// but add the overflow to the next year:
d = new Date(2018, 12, 24, 10, 33, 30);   // ~ new Date(2019, 1, 24, 10, 33, 30);

// Specifying a day higher than max, will not result in an error 
// but add the overflow to the next month:
d = new Date(2018, 5, 35, 10, 33, 30);    // ~ new Date(2018, 6, 5, 10, 33, 30)

// JavaScript ISO Dates
// ISO 8601 is the international standard for the representation of dates and times
// The ISO 8601 syntax (YYYY-MM-DD) is also the preferred JavaScript date format
// The computed date will be relative to your time zone.
d = new Date("2022-03-25");
d = new Date("2015-03");    // ISO dates can be written without specifying the day (YYYY-MM)
d = new Date("2015");       // ISO dates can be written without month and day (YYYY)

// SO dates can be written with added hours, minutes, and seconds (YYYY-MM-DDTHH:MM:SSZ)
// Date and time is separated with a capital T
// UTC time is defined with a capital letter Z
// Omitting T or Z in a date-time string can give different results in different browsers.
// UTC (Universal Time Coordinated) is the same as GMT (Greenwich Mean Time).
d = new Date("2015-03-25T12:00:00Z"); 

// If you want to modify the time relative to UTC, remove the Z and add +HH:MM or -HH:MM instead
d = new Date("2015-03-25T12:00:00-03:30");

// Parsing Dates to ensure valid date string
msec = Date.parse("March 21, 2012");
d = new Date(msec);


// toString()
// converte date to a long string
d = new Date();
d.toString();   // Sat Mar 04 2023 00:45:24 GMT+0330 (Iran Standard Time)

// toDateString() 
// converts a date to a more readable format
d = new Date();
d.toDateString();   // Sat Mar 04 2023

// toUTCString()
// converts a date to a string using the UTC standard
d = new Date();
d.toUTCString();    // Fri, 03 Mar 2023 21:21:30 GMT

// toISOString()
// converts a date to a string using the ISO standard
d = new Date();
d.toISOString();    // 2023-03-03T21:22:06.738Z

// now()
// returns the number of milliseconds since January 1, 1970
d = Date.now();

// getTime()
// returns the number of milliseconds since `January 1, 1970` to `d`
d.getTime();


// getTimezoneOffset()
// returns the difference (in minutes) between local time and UTC time
diff = d.getTimezoneOffset();


/*
-----------------------
    Final Examples
-----------------------
*/

// print the current time every second
function printTime() {
    var d = new Date();
    var hours = d.getHours();
    var mins = d.getMinutes();
    var secs = d.getSeconds();
    console.log (hours + ":" + mins + ":" + secs);
}
setInterval(printTime, 1000);

 
// prints the day and month.
function getWeekDay(d) {
    var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    return days[d.getDay()];
}

function getMonthName(d) {
    const months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    return months[d.getMonth()];
}
var d = new Date();
console.log(
    getWeekDay(d) + ', ' + 
    d.getDate() + ' ' + 
    getMonthName(d) + ' ' +
    d.getFullYear()
);