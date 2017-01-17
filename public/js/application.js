$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  $("div").on("submit", "ul.something", function(e){
    // Stop the default action from occurring.
    e.preventDefault();

    // Set variables to use for your ajax call
    var $form = $(this);
    var url = $(this).attr('action');
    var method = $(this).attr('method');
    var data = $(this).serialize();

    $.ajax({
      url: url, 
      type: method,
      data: data,
      // data_type??
    })
    .done(function(response){
      // Below are two good places to start with to see what's coming back from the controller.
      console.log(response)
      debugger 
      // Below are some other possible actions.
      $(something).append(response)
      $(something).html(response);
      $(something).show('form')
      $(something).hide('button')
      $(something).trigger('reset') // Reset form values to blank
    })
    .fail(function(response) {
      alert( "This is your error message." );
    })
    // Likely won't need .always
    .always(function(response){
      alert(response);
    })

  });
});