//= require jquery
//= require jquery_ujs

//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.en-GB.js

$(document).ready(function(){
  $('.datepicker').datepicker({
    format: 'dd/mm/yyyy'
  });
});