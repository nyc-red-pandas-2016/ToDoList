$(function() {
    var $newBtn = $("#lists-new,#lists-edit");
    var $modal = $(".modal");
    var $modalClose = $modal.find("span");
    var $modalInner = $(".modal-inner");

    function animateInnerModal(){
      $modalInner.animate({
        opacity:1,
        top:0
      },500);
      // end of animateInnerModal
    }
    function modalReset(){
      $modalClose.on("click",function(){
        $modal.removeAttr("style");
        $modalInner.removeAttr("style");
        $modalInner.find("form").remove();
      });
      // end of modal reset
    }


    $newBtn.on("click",function(e){
      e.preventDefault();
      var url = $(this).attr('href');

      $.ajax({
          method:"get",
          url:url
        // end of ajax
      }).done(function(response){
          $modalInner.append(response)
          $modal.show();
          animateInnerModal();
          modalReset();
        // end of response
      });
      // end of click
    });





    // end of ready
});
