$(document).ready(function() {
    var f = document.getElementById('letsGo');
    setInterval(function() {
        f.style.display = (f.style.display == 'none' ? '' : 'none');
    }, 1000); 
});

$(document).ready(function() {
    var f = document.getElementById('teamName');
    setInterval(function() {
        f.style.display = (f.style.display == 'block' ? '' : 'block');
    }, 1000);  
});

