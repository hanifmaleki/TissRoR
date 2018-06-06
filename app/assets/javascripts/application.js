// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require activestorage
//= require bootstrap-sprockets
//= require_tree .




$("toggle").click(function(){
    console.log( "ready!" );
    alert("Loslesh");
    $("#div1").fadeIn();
    $("#div2").fadeIn("slow");
    $("#div3").fadeIn(3000);
});



/*
 require rails-ujs
 require turbolinks
*/
$('a').on ("ajax:success", toggleFunction);
function toggleFunction(event, data) {
    alert("You entered p1!");
    //$(‘.book-list’).append(data.book)
}