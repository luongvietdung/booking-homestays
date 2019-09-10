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

$(document).ready(function() {

  var $headline = $('.headline'),
  $inner = $('.inner'),
  $nav = $('nav'),
  navHeight = 75;

  $(window).scroll(function() {
    var scrollTop = $(this).scrollTop(),
    headlineHeight = $headline.outerHeight() - navHeight,
    navOffset = $nav.offset().top;

    $headline.css({
      'opacity': (1 - scrollTop / headlineHeight)
    });
    $inner.children().css({
      'transform': 'translateY('+ scrollTop * 0.4 +'px)'
    });
    if (navOffset > headlineHeight) {
      $nav.addClass('scrolled');
    } else {
      $nav.removeClass('scrolled');
    }
  });

  $(".preview-signup").change(function() {
    readURL(this, '#img-prev-signup');
  });

  $(".preview-edit-profile").change(function() {
    readURL(this, '.img-circle');
  });

  $(".hide-form-password").css('display', 'none');
  $(".show-form").on('click', function(){
    $(".hide-form-password").toggle();
    $(this).text( $(this).text() == 'More' ? "Hide" : "More");
  });

  $('#search-rooms').autocomplete({
    source:  "/autocomplete.json",
    select: function(){
      $(this).closest('form').trigger('submit');
    }
  });

  if ($('#exampleSlider').length == 1) {
    $(this).multislider({
      interval: 5000,
      slideAll: false
    });
  }

  var clickEvent = false;
  $('#myCarousel').on('click', '.nav a', function() {
    clickEvent = true;
    $('.nav li').removeClass('active');
    $(this).parent().addClass('active');
  }).on('slid.bs.carousel', function(e) {
    if(!clickEvent) {
      var count = $('.nav').children().length -1;
      var current = $('.nav li.active');
      current.removeClass('active').next().addClass('active');
      var id = parseInt(current.data('slide-to'));
      if(count == id) {
        $('.nav li').first().addClass('active');
      }
    }
    clickEvent = false;
  });

  var dateToday = new Date();
   $('.datepicker').datepicker({
      format: "dd/mm/yyyy",
      startDate: dateToday
    }).on('changeDate', function(){
      var id = $(this).attr('id');
      if (id == 'datepicker-1') {
        var checkin_date = $('#booking_checkin').val();
        $('#datepicker-2').datepicker('setStartDate', new Date(checkin_date.replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$2/$1/$3")));
      }
  });

  $('#booking_checkin').change(function(){
    calculate_price();
  });

  $('#booking_checkout').change(function(){
    calculate_price();
  });

  $('#guest_number').click(function(){
    calculate_price();
  });

  function calculate_price() {
    var checkin = $('#booking_checkin').val();
    var checkout = $('#booking_checkout').val();
    // check null
    if (checkin == '' && checkout == '') {
      $('.error_message').html('');
    } else if (checkin == '') {
      $('.error_message').html('<span style="color: red;">Vui lòng nhập ngày đến!</span>');
    } else if (checkout == '') {
      $('.error_message').html('<span style="color: red;">Vui lòng nhập ngày đi!</span>');
    } else {
      var checkin_date = new Date(checkin.replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$2/$1/$3"));
      var checkout_date = new Date(checkout.replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$2/$1/$3"));

      // check date invalid
      if (checkin_date >= checkout_date) {
        $('.error_message').html('<span style="color: red;">Định dạng ngày phải hợp lệ!</span>');
        $('.checkup__price').hide('');
      } else {
        var num_date = (checkout_date - checkin_date)/1000/60/60/24;
        var price = $('.price_cost').val();
        $('.sum_date').text("Giá thuê " + num_date + " đêm");
        $('.price_cost').text(price * num_date);
        $('.sum_price').text(price * num_date + parseFloat($('.cleaning').val()));
        $('.error_message').html('');
        $('.checkup__price').show('');
        // enable click book btn
        $('#addtocart-btn').removeClass('disable_class');
        var guest_number = $('#guest_number').val();
        var room_id = $('#booking_room_id').val();
        $('#addtocart-btn').attr('href','/bookings/new?room_id='+room_id+'&checkin='+checkin+'&checkout='+checkout+'&guest='+guest_number);
      }
    }
    $('.info-booking').show('');
  }

  $('.event_check').click(function(){
    $('.event-click').toggle('');
  });

  $('#new_booking').validate({
    rules: {
      "booking[name_booking]":{
        required: true,
        maxlength: 20,
        minlength: 6
      },
      "booking[phone_booking]":{
        required: true,
        number: true,
        maxlength: 11,
        minlength: 10
      },
      "booking[email_booking]":{
        required: true
      },
      "booking[country]":{
        required: true
      },
      "booking[trip_purpose]":{
        required: true
      },
      "booking[intend_time]":{
        required: true
      }
    }
  });

  $('#phone_email').click(function() {
    var vnf_regex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
    var mobile = $('#phoneNumber').val();
    if (vnf_regex.test(mobile) == false)
    {
      $('.error').text('Your phone number is not in the right format.');
    }else{
      $('.error').text('');
    }
  });

  $('#code_promotion').keyup(function(){
    if ($('#code_promotion').val() != '') {
      $('#event_disable').removeClass('event_disable');
    } else {
      $('#event_disable').addClass('event_disable');
    }
  });

  $('.btn-code').click(function() {
    var code = $('#code').val().split(' ');
    var code_promotion = $('#code_promotion').val();
    if (code_promotion == '') {
      return false;
    } else {
      if (jQuery.inArray(code_promotion, code) == '-1') {
        $('.error_code').html('<span style="color: red">Invalid code!</span>');
        $('#code_promotion').val('');
      } else {
        $('.error_code').html('<span style="color: green">valid code!</span>');
        return true;
      }
    }
  });

});
