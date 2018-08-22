$(document).ready(function() {
    var x = document.getElementById('letsGo');
    setInterval(function() {
        x.style.display = (x.style.display == 'none' ? '' : 'none');
    }, 1000); 
});

$(document).ready(function() {
    var x = document.getElementById('teamName');
    setInterval(function() {
        x.style.display = (x.style.display == 'block' ? '' : 'block');
    }, 1000);  
});

