$(document).ready(function() {
  $('.get_list').on("click", function(e){
    e.preventDefault();
    $(this).hide();
    $.ajax({
      url: $(this).attr('href'),
      method: "GET"
    })
    .done(function(response){
      $('body').append(response)
    })
  })

   $('body').on("submit",'.create_list', function(e){
    e.preventDefault();
    $(this).hide();
    $('.get_list').show();
    $.ajax({
      url: $(this).attr('action'),
      method: "POST",
      data: $(this).serialize()
    })
    .done(function(response){
      $('ul').append(response)
    })
  })

});
