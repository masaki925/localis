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
        if ($("#gref_" + input.id).exists()) {
          return $("#gref_" + input.id).replaceWith($("<input type='hidden' id='gref_" + input.id + "' value='" + place.reference + "'>"));
        } else {
          return $("<input type='hidden' id='gref_" + input.id + "' name='" + input.name.replace(/name]$/, 'google_reference]') + "' value='" + place.reference + "'>").insertAfter($("#" + input.id));
        }
      };
    })(autocomplete, inputs[i]));
    i++;
  }
}
