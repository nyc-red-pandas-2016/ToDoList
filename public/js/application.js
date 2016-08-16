$(document).ready(function() {

  $('#task_button').click(function() {
    event.preventDefault();
    $(this).hide();
    $('#new_task_form').show();
  });

  $('#add_task').on('submit','#new_task_form',function(event) {
    event.preventDefault();
    $.ajax({
      type: "POST",
      url: $("#new_task_form").attr("action"),
      data: $("#new_task_form").serialize()
    }).done(function(response){
      var something= response.body;
      $('.list').append("<li class='list-item'>"+something+"</li>" );
      $('#new_task_form').find("input[type=text], textarea").val("");
      // $('#task_button').show();

    });
  });
});
