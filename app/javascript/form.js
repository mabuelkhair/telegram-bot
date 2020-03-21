$(function() {
  $('#message_form').on('ajax:success', function(a, b,c ) {
    var content = $(this).find('#message').val();
    $(this).find('#message').val('');
  });
});
