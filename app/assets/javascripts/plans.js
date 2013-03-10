$(document).ready(function(){
  $('#cand_spots, #plan_spots').sortable({
    connectWith: ".connectedSortable",
    axis: 'y',
    dropOnEmpty: true,
    handle: '.handle',
    cursor: 'crosshair',
    items: 'li',
    opacity: 0.4,
    scroll: true,
    update: function(){
      $("[id^=cand_spot_]").attr("id",function(i, old_id){
        return old_id.replace('cand', 'plan')
      });
      var plan_id = $('#plan_id').val();
      $.ajax({
        type: 'post',
        data: $('#plan_spots').sortable('serialize'),
        dataType: 'script',
        complete: function(request){
          $('#plan_spots').effect('highlight');
        },
        url: '/plans/' + plan_id + '/cand_sort'})
    }
  });
});