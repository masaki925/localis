function init_ggl_autocomplete () {
  $("form input").keydown( function(event) {
    if (event.keyCode === 13) {
      event.preventDefault();
      return false;
    }
  });

  var autocomplete, i, inputs, _results;
  inputs = $(".gPlaceAutoComplete");
  i = 0;
  while (i < inputs.length) {
    autocomplete = new google.maps.places.Autocomplete(inputs[i]);
    google.maps.event.addListener(autocomplete, "place_changed", (function(autocomplete, input) {
      return function() {
        var place = autocomplete.getPlace();
        var ref   = place.reference
        var lat   = place.geometry.location.lat()
        var lng   = place.geometry.location.lng()
        var gRefName = input.name.replace(/name]$/, 'google_reference]');
        var gLatName = input.name.replace(/name]$/, 'lat]');
        var gLngName = input.name.replace(/name]$/, 'lng]');
        if ( $("#gref_" + input.id).exists() ) {
          $("#gref_" + input.id).replaceWith($("<input type='hidden' id='gref_" + input.id + "' name='" + gRefName + "' value='" + ref + "'>"));
          $("#glat_" + input.id).replaceWith($("<input type='hidden' id='glat_" + input.id + "' name='" + gLatName + "' value='" + lat + "'>"));
          $("#glng_" + input.id).replaceWith($("<input type='hidden' id='glng_" + input.id + "' name='" + gLngName + "' value='" + lng + "'>"));
        } else {
          $("<input type='hidden' id='gref_" + input.id + "' name='" + gRefName + "' value='" + ref + "'>").insertAfter($("#" + input.id));
          $("<input type='hidden' id='glat_" + input.id + "' name='" + gLatName + "' value='" + lat + "'>").insertAfter($("#" + input.id));
          $("<input type='hidden' id='glng_" + input.id + "' name='" + gLngName + "' value='" + lng + "'>").insertAfter($("#" + input.id));
        }
      };
    })(autocomplete, inputs[i]));
    i++;
  }
}
