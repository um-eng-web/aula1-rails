// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function initialize(){
    var source = new EventSource('/alerts');
    source.addEventListener('message', function update(event){
        var div = $('<div>').text(event.data);
        $('#alerts').append(div);
        });
}

function clickAlert(event){
    if (event.target.checked){
        alert("You can reade the alert now");
    }
}

$(document).ready(initialize);
$(document).on(initialize);
$(document).on('click', '#alert_resolved', clickAlert);
