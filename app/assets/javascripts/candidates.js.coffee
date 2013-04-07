# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $("#candidate_spots").bind "cocoon:after-insert", (e, insertedItem) ->
    init_ggl_autocomplete()

  $("#exist_candidate_spots").bind "cocoon:after-remove", (e, removedItem) ->
    target_id = removedItem.find("input").filter(->
      @id.match /.*id$/
    )[0].value
    $("<input type='hidden' name='removed_spots[]' value='" + target_id + "'>").appendTo $("#removed_spots")
