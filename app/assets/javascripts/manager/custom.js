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
