$(document).ready(function() {
  $('.carousel').carousel({
    interval: 2000
  })

  setTimeout(function(){
    $('#flash-notice').slideUp(500);
  }, 1000);

});
