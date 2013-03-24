# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("form input").keydown (event) ->
    if event.keyCode is 13
      event.preventDefault()
      false

jQuery.fn.exists = ->
  @length > 0

initialize = ->
  inputs = $(".gPlaceAutoComplete")
  i = 0
  while i < inputs.length
    autocomplete = new google.maps.places.Autocomplete( inputs[i] )
    google.maps.event.addListener autocomplete, "place_changed", ((autocomplete, input) ->
      ->
        place = autocomplete.getPlace()
        if $( "#ggl_ref_" + input.id ).exists()
          $( "#ggl_ref_" + input.id ).replaceWith( $("<input type='hidden' id='ggl_ref_" + input.id + "' value='" + place.reference + "'>") )
        else
          $("<input type='hidden' id='ggl_ref_" + input.id + "' value='" + place.reference + "'>").insertAfter( $("#" + input.id ) )
      )(autocomplete, inputs[i])

    i++
google.maps.event.addDomListener window, "load", initialize

