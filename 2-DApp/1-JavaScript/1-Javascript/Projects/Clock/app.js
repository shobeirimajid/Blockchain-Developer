window.onload = function() {

    var elH = document.getElementById('elH');
    var elM = document.getElementById('elM');
    var elS = document.getElementById('elS');

    //  prints the current time every second.
    function printTime() {

        var d = new Date();

        var hours = d.getHours().toString().padStart(2, '0');
        var mins = d.getMinutes().toString().padStart(2, '0');
        var secs = d.getSeconds().toString().padStart(2, '0');

        elH.innerHTML = hours;
        elM.innerHTML = mins;
        elS.innerHTML = secs;

        //console.log (hours + ":" + mins + ":" + secs);
    }
    setInterval(printTime, 1000);
};
