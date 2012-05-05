// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.pjax
//= require_tree .

$(window).load(function() {
  // animate logo on first page load (site uses ajax so only fires once)
  $('#butterfly_container').animate({height:'show'}, 600, 'linear');
  $('.butterfly').animate({opacity:'show'}, 2000);
  $('.logo h1').delay(300).animate({height:'show',opacity:'show'},800, 'easeOutBounce');

  // enable pjax for navigation links
  $('.nav a').pjax('[data-pjax-container]');

  // initialise the slideshow on home page
  $('.flexslider').flexslider({animation: 'slide', pauseOnHover: true});

  // hide the take away menu and setup the eat in menu
  $('.take-away').hide();
  $('.fadable').removeClass('fadable').hide();
  $('.eat-in .menu .active').show().addClass('fadable');

  // fade category away and new one in
  $('.menu-nav li a').live('click', function (){
    var category = $(this).attr('data-category');
    $('.fadable').removeClass('fadable').fadeOut(200, function() {
      $('.menu .menu-content').children('.' + category).fadeIn(200).addClass('fadable', function(){
        $('html body').animate({scrollTop: $(".which-menu").offset().top}, 500);
      });
    });
    $('.eat-in .active, .take-away .active').removeClass('active');
    $(this).parent('li').addClass('active');
  });

  // fade menu away and new on in
  $('.which-menu li').live('click', function (){
    $('.' + $(this).attr('data-menu-hide')).fadeOut(200);
    $('.' + $(this).attr('data-menu')).delay(199).fadeIn(200);
    $('.fadable').removeClass('fadable').hide();
    $('.' + $(this).attr('data-menu') + ' .menu .menu-content').children().first('div').show().addClass('fadable');
    $('.active').removeClass('active');
    $('.' + $(this).attr('data-menu') + ' .menu-nav li').first('a').addClass('active');
    $('html body').delay(200).animate({scrollTop: $(".which-menu").offset().top}, 500);
    $(this).css('background-color', 'rgba(98, 179, 104, 1)').addClass('active').siblings('li').css('background-color', 'rgba(98, 179, 104, 0.6)');
  });

  // adjust sticky footer height when changing window size
  var new_height = $('#footer-container').height();
  $('#footer-push').height(new_height+10);
  $('footer').height(new_height).css('margin-top', -new_height-10);
  $(window).resize(function(){
    var new_height = $('#footer-container').height();
    $('#footer-push').height(new_height+10);
    $('footer').height(new_height).css('margin-top', -new_height-10);
  });
});

// re-initialise slideshow and set-up menu at the end of each pjax request
$(document).on('pjax:end', function() {
  $('.flexslider').flexslider({animation: 'slide', pauseOnHover: true});
  $('.take-away').hide();
  $('.fadable').removeClass('fadable').hide();
  $('.eat-in .menu .active').show().addClass('fadable');
});

// change color of menu buttons on hover
$('.which-menu li').hover(
  function() {
    $(this).animate({opacity: 1}, 200);
  },
  function() {
    if($(this).hasClass('active')) {
      $(this).css('opacity', 1);
    }
    else {
      $(this).animate({opacity: 0.6}, 200);
    }
  }
)
