function readURL(f, previewId) {
  if (f.files && f.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $(previewId)
        .attr('src', e.target.result);
    };
    reader.readAsDataURL(f.files[0]);
  }
}

$(document).ready(function(){
  $('#admin_table').DataTable({
    scrollY: 500,
    "pageLength": 25,
    "columnDefs": [
      { "orderable": false, "targets": [5] },
    ]
  });

  $('#member_table').DataTable({
    scrollY: 500,
    "pageLength": 25,
    "columnDefs": [
      { "orderable": false, "targets": [5] },
    ]
  });

  $(".preview_member").change(function() {
    readURL(this, '#img_member_prev');
  });

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

$(document).ready(function() {
  $(".account").click(function() {
    var getID=$(this).attr('id');
    if(getID==1) {
      $(".custom-submenu").hide();
      $(this).attr('id', '0');
    }
    else {
      $(".custom-submenu").show();
      $(this).attr('id', '1');
    }
  });
  $(".custom-submenu").mouseup(function() {
    return false
  });
  $(".account").mouseup(function() {
    return false
  });
  $(document).mouseup(function() {
    $(".custom-submenu").hide();
    $(".account").attr('id', '');
  });

  $('[data-toggle="tooltip"]').tooltip();
});
