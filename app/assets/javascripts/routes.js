$(function(){
    // always pass csrf tokens on ajax calls
    $.ajaxSetup({
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') }
    });
});

function post_location (position) {
    console.log("posting position");
    var route_id = $("#route-id").text();
    $.post("/locations", 
    {
        longitude: position.coords.longitude,
        latitude: position.coords.latitude,
        route_id: route_id,
    });
}

document.addEventListener("turbolinks:load", function() {
    $("#start-record").click(function () {
        var interval = window.setInterval(function() {
            console.log("getting position");
            navigator.geolocation.getCurrentPosition(post_location);
        }, 10000);
        console.log("starting");
        console.log(interval);
        sessionStorage.setItem('interval-update', interval);
    });

    $("#stop-record").click(function () {
        console.log("stopping");
        var interval = sessionStorage.getItem('interval-update');
        console.log(interval);
        window.clearInterval(interval);
    });
});