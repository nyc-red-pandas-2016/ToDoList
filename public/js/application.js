$(document).ready(function() {
  $("#new-list-form").submit(function(event) {
    event.preventDefault();
    $.ajax({
      url: $(event.target).attr("action"),
      type: $(event.target).attr("method"),
      data: $(event.target).serialize()
    }).done(function(response) {
      $("#list-of-lists").append(response);
      $("#new-list-name").val("");
    })
  })

  $("#delete-task-form").submit(function(event) {
    event.preventDefault();
    var task = $(event.target).parent("li")
    $.ajax({
      url: $(event.target).attr("action"),
      type: $(event.target).attr("method"),
      data: $(event.target).serialize()
    }).done(function(response) {
      $(task).remove();
    })
  })

  $("#modify-task-form").submit(function(event) {
    event.preventDefault();
    var task = $(event.target).parent("li")
    $.ajax({
      url: $(event.target).attr("action"),
      type: $(event.target).attr("method"),
      data: $(event.target).serialize()
    }).done(function(response) {
      $(task).replaceWith(response);
    })
  })

});
