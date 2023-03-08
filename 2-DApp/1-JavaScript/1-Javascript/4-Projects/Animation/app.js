window.onload = function() {

    var pos = 0; 

    // our box element
    var box = document.getElementById('box');
    var t = setInterval(move, 10);

    function move() {
        if(pos >= 150) {
            clearInterval(t);
        }
        else {
            pos += 1;
            box.style.left = pos + 'px';
        }
    }
};