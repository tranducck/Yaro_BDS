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
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require react
//= require react_ujs
//= require components
//= require ckeditor/init
//= require_tree .
//= require bootstrap-4-material-admin/vendor/popper.js/umd/popper.min.js
//= require bootstrap-4-material-admin/vendor/bootstrap/js/bootstrap.min.js
//= require bootstrap-4-material-admin/vendor/jquery.cookie/jquery.cookie.js
//= require bootstrap-4-material-admin/vendor/jquery-validation/jquery.validate.min.js
//= require bootstrap-4-material-admin/js/front.js
//= require jquery.tmpl

function showFlash(msg, type) {
  var html = "<div class='alert alert-" + type + "'>" + msg +"</div>";
  $("#flash").html(html);
  setTimeout(function() {
    $(".alert").hide("slow", function() { $(".alert").remove() })
  }, 5000)
}
