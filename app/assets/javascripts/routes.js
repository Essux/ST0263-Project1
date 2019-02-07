$(function(){
    // always pass csrf tokens on ajax calls
    $.ajaxSetup({
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') }
    });
});

//$(document).ready(function (){
document.addEventListener("turbolinks:load", function() {
    $("#start-record").click(function () {
        console.log("starting");
        var interval = window.setInterval(function() {
            var route_id = $("#route-id").text();
            $.post("/locations", 
            {
                longitude: -1.0,
                latitude: -1.0,
                route_id: route_id,
            });
        }, 10000);
        console.log(interval);
        sessionStorage.setItem('interval-update', interval)
    });

    $("#stop-record").click(function () {
        console.log("stopping");
        var interval = sessionStorage.getItem('interval-update');
        console.log(interval);
        window.clearInterval(interval);
    });
});