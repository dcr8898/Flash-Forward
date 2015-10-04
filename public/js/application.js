$(document).ready(function() {
  setTimeout(function(){
    $('.flash').fadeIn('slow', function(){
      $(this).delay(2000).fadeOut('slow')
    });
  });
});
