# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("#request_spots").bind "cocoon:after-insert", (e, insertedItem) ->
    init_ggl_autocomplete()

  $("#request_hotels").bind "cocoon:after-insert", (e, insertedItem) ->
    init_ggl_autocomplete()

