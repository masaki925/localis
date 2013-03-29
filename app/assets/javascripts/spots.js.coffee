# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery.fn.exists = ->
  @length > 0

google.maps.event.addDomListener window, "load", init_ggl_autocomplete

