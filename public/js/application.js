$(document).ready(function() {
  setTimeout(function(){
    $('.alert-success').fadeIn('slow', function(){
      $(this).delay(2000).fadeOut('slow')
    });
  });
});
