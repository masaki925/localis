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

  map = new google.maps.Map(document.getElementById('map-canvas'), {
    mapTypeId: google.maps.MapTypeId.ROADMAP,
  })
  bounds = new google.maps.LatLngBounds()
  infowindow = new google.maps.InfoWindow()
  service = new google.maps.places.PlacesService(map)
  spots_array = $('li input#plan_spot')
  spots_array.each ->
    request = { reference: this.value }
    service.getDetails request, (place, status) ->
      if status is google.maps.places.PlacesServiceStatus.OK
        map_location = place.geometry.location
        bounds.extend(map_location)
        map.fitBounds(bounds)
        location_LatLng.push(map_location)
        marker = new google.maps.Marker(
          map: map
          position: map_location
        )
        google.maps.event.addListener marker, 'click', ->
          infowindow.setContent(place.name)
          infowindow.open(map, this)
