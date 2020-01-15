// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require activestorage
//= require popper
//= require bootstrap-sprockets
//= require moment
//= require fullcalendar
//= require fullcalendar/lang/ja
//= require turbolinks
//= require data-confirm-modal

$(document).on("turbolinks:load", function() {
	//ヘッダーナブバー右
  $('.nav_tag1').hover(
    function(){
      $('.nav_tag_text1').fadeIn();
    },
    function(){
      $('.nav_tag_text1').fadeOut();
    }
    );

  $('.nav_tag2').hover(
    function(){
      $('.nav_tag_text2').fadeIn();
    },
    function(){
      $('.nav_tag_text2').fadeOut();
    }
    );

  $('.nav_tag3').hover(
    function(){
      $('.nav_tag_text3').fadeIn();
    },
    function(){
      $('.nav_tag_text3').fadeOut();
    }
    );

  $('.nav_tag4').hover(
    function(){
      $('.nav_tag_text4').fadeIn();
    },
    function(){
      $('.nav_tag_text4').fadeOut();
    }
    );

  $('.nav_tag5').hover(
    function(){
      $('.nav_tag_text5').fadeIn();
    },
    function(){
      $('.nav_tag_text5').fadeOut();
    }
    );

  $('.nav_tag6').hover(
    function(){
      $('.nav_tag_text6').fadeIn();
    },
    function(){
      $('.nav_tag_text6').fadeOut();
    }
    );

  $('.nav_tag7').hover(
    function(){
      $('.nav_tag_text7').fadeIn();
    },
    function(){
      $('.nav_tag_text7').fadeOut();
    }
    );

  $('.nav_tag8').hover(
    function(){
      $('.nav_tag_text8').fadeIn();
    },
    function(){
      $('.nav_tag_text8').fadeOut();
    }
    );

  //検索フォーム
    var show = document.getElementById('show');
    var hide = document.getElementById('hide');

    show.addEventListener('click', function() {
      // alert('1 is clicked');
      $('.search-form').addClass('search-form-open');
    });

    hide.addEventListener('click', function() {
      $('.search-form').removeClass('search-form-open');
    });


});



