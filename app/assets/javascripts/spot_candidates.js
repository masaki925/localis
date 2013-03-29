$(document).ready(function() {
  $('#spots').bind('cocoon:after-insert', function(e, insertedItem) {
    init_ggl_autocomplete();
  });
});
