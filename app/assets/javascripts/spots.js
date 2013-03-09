$(document).ready(function(){
  $('#spots').sortable({
    axis: 'y',
  dropOnEmpty: false,
  handle: '.handle',
  cursor: 'crosshair',
  items: 'li',
  opacity: 0.4,
  scroll: true,
  update: function(){
    $.ajax({
      type: 'post',
    data: $('#spots').sortable('serialize'),
    dataType: 'script',
    complete: function(request){
      $('#spots').effect('highlight');
    },
    url: '/spots/sort'})
  }
  });
});
