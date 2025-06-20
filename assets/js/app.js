$(document).foundation();

var elem = new Foundation.Sticky($('.top-bar'));

//# sourceMappingURL=app.js.map
$('#client-list .column').shuffle();
window.setInterval(function(){
    /// call your function here
    $('#client-list .column').shuffle();
}, 7000);
