# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("#cand_spots, #plan_spots").sortable
    connectWith: ".connectedSortable"
    axis: "y"
    dropOnEmpty: true
    handle: ".handle"
    cursor: "crosshair"
    items: "li"
    opacity: 0.4
    scroll: true
    update: ->
      $("[id^=cand_spot_]").attr "id", (i, old_id) ->
        old_id.replace "cand", "plan"

      plan_day_id = $("#plan_day_id").val()
      $.ajax
        type: "post"
        data: $("#plan_spots").sortable("serialize")
        dataType: "script"
        complete: (request) ->
          $("#plan_spots").effect "highlight"

        url: "/plan_days/" + plan_day_id + "/cand_sort"
