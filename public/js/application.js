$(document).ready(function() {
  $('#login-form').submit(function(event) {
    event.preventDefault()
    formData = $(this).serialize()
    $.ajax({
      method: "POST",
      url: "/login",
      data: formData
    }).done(function(response) {

      $('.errors').html(response)

    })
  })

  $('#registration-form').submit(function(event) {
    event.preventDefault()
    formData = $(this).serialize()
    $.ajax({
      type: "POST",
      url: '/users',
      data: formData
      }).done(function(response) { })
  })
});




