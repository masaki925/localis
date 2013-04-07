# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
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

  mapOptions =
    center: new google.maps.LatLng(-34.397, 150.644),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP

  map = new google.maps.Map $('#map_canvas').get(0), mapOptions
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

        marker = new google.maps.Marker(
          map: map
          position: map_location
        )
        google.maps.event.addListener marker, 'click', ->
          infowindow.setContent(place.name)
          infowindow.open(map, this)