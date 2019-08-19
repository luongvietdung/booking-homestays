$(document).ready(function(){
  $('#room_table').DataTable({
    scrollY: 500,
    "pageLength": 25,
  });
});


$(document).ready(function() {
    $(".dropdown-btn").click( function(e) {
      $(this).toggleClass('active');
      var dropdownContent = $(this).next();
      if (dropdownContent.css('display') === 'block') {
        dropdownContent.css('display', 'none');
      } else {
        dropdownContent.css('display', 'block');
      }
    });
});
