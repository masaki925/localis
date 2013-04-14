# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  mapOptions =
    center: new google.maps.LatLng(-34.397, 150.644),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new google.maps.Map $('#map_canvas').get(0), mapOptions
  service = new google.maps.places.PlacesService(map)
  directionsDisplay = new google.maps.DirectionsRenderer()
  directionsService = new google.maps.DirectionsService()

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
        url: "/plan_days/" + plan_day_id + "/cand_sort"
  spots = $('.span3 li.stub')
  waypoints = []
  spots.each (index) ->
    switch index
      when 0, spots.length - 1
        console.log "0"
      else
        waypoints.push location:new google.maps.LatLng(spots.find("#latitude")[index].value, spots.find("#longitude")[index].value)
  request =
    origin: new google.maps.LatLng(spots.find('#latitude')[0].value, spots.find('#longitude')[0].value),
    waypoints: waypoints,
    destination: new google.maps.LatLng(spots.find('#latitude')[spots.length - 1].value, spots.find('#longitude')[spots.length - 1].value),
    travelMode: google.maps.TravelMode.TRANSIT

  directionsService.route request, (response, status) ->
    if status is google.maps.DirectionsStatus.OK
      directionsDisplay.setDirections(response)
      directionsDisplay.setMap(map)