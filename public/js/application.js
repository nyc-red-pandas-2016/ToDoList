$(document).ready(function() {

  $('#task_button').click(function() {
    event.preventDefault();
    $(this).hide();
    $('#new_task_form').show();
  });

  $('#add_task').on('submit','#new_task_form',function(event) {
    event.preventDefault();
    var listID = $("#list_container").attr('id');
    $.ajax({
      type: "POST",
      url: "/lists"+listID,
      data: $("#new_task_form").serialize()
    }).done(function(response){

    });
  });
});
