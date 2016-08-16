$(document).ready(function() {
  $('#login-form').submit(function(event) {
    event.preventDefault()
    formData = $(this).serialize()
    $.ajax({
      method: "POST",
      url: "/login",
      data: (formData)
    }).done(function(response) {

      console.log(event.target)
      $('.errors').html(response)
    })
  })

  $('#registration-form').submit(function(event) {
    event.preventDefault()
    formData = $(this).serialize()
    $.ajax({
      type: "POST",
      url: '/users',
      data: formData,
      dataType: "json",
      success: function(data, textStatus) {
          console.log("I'm here")
          if (data.redirect) { window.location.href = data.redirect;}
          else { $('.errors').html(response) }
      }

    }).done( console.log("done"))
  })
});




