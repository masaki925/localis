# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
setRmSpot = ->
  $(".rmSpot").click (e) ->
    e.target.parentElement.remove()

$ ->
  setRmSpot()

  cand_elems = $.merge( $("#unselected_spots li"), $("#selected_spots li") )
  cand_elems.click (e) ->
    li_elem = $("<li><span class='handle'>[drag]</span></li>")
    li_elem.append( $("<input type='hidden' name='plan_spot[]' value='" + e.target.id.replace(/(un)?selected_spot_/, "") + "'>" + e.target.textContent + "</input><span class='rmSpot'> [x]</span>") )
    $("#plan_spots").append( li_elem )
    setRmSpot()

  $("#plan_spots").sortable
    axis: "y"
    handle: ".handle"
    cursor: "crosshair"
    items: "li"
    opacity: 0.4
    scroll: true

  mapOptions =
    center: new google.maps.LatLng(-34.397, 150.644),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new google.maps.Map $('#map_canvas').get(0), mapOptions
  service = new google.maps.places.PlacesService(map)
  directionsDisplay = new google.maps.DirectionsRenderer()
  directionsService = new google.maps.DirectionsService()

  spots = $('.span3 li')
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
