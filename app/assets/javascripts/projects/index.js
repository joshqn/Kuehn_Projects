$(document).ready(function() {

  // Used to fade in imgs on the first load
  $(".image-container").each(function() {

    var image = $(this).find("img");
    var fadeInObject = ($(this).find(".hovereffect").length == 1) ? $(this).find(".hovereffect") : image;
    if(!image.prop('complete')) {
      $(fadeInObject).css('display','none');
      $(image).on('load', function() {
        $(fadeInObject).fadeIn('slow');
      });
    } else {
      // Handle case where img is already loaded
    }

  });

});
