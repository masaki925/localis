# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
initialize = ->
  input = document.getElementById("searchTextField")
  autocomplete = new google.maps.places.Autocomplete(input)
google.maps.event.addDomListener window, "load", initialize
