// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the rails generate channel command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

}).call(this);

$(document).ready(function() {
    $('select').material_select();
    $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears:  100, // Creates a dropdown of years to control year
    max: true
  });
});

