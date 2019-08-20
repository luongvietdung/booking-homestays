$(document).ready(function(){
  $('#admin_table').DataTable({
    scrollY: 500,
    "order": [[ 0, 'DESC' ]],
    "pageLength": 25,
    "columnDefs": [
      { "orderable": false, "targets": [5] },
    ]
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
