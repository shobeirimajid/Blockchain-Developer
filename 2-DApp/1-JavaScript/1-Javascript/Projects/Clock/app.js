window.onload = function() {

    var today = document.getElementById('today');
    var elH = document.getElementById('elH');
    var elM = document.getElementById('elM');
    var elS = document.getElementById('elS');

    setInterval(printTime, 1000);
    setInterval(printDate, 1000);
};


// prints the current time every second.
function printTime() {

    var d = new Date();

    var hours = d.getHours().toString().padStart(2, '0');
    var mins = d.getMinutes().toString().padStart(2, '0');
    var secs = d.getSeconds().toString().padStart(2, '0');

    elH.innerHTML = hours;
    elM.innerHTML = mins;
    elS.innerHTML = secs;
}


function printDate() {
    var d = new Date();
    today.innerHTML = d.toDateString();
}
