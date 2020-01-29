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
//= require data-confirm-modal
//= require channels/room.coffee
//= require turbolinks
//= require_tree .

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

  $('.nav_tag9').hover(
    function(){
      $('.nav_tag_text9').fadeIn();
    },
    function(){
      $('.nav_tag_text9').fadeOut();
    }
    );

  $('.nav_tag10').hover(
    function(){
      $('.nav_tag_text10').fadeIn();
    },
    function(){
      $('.nav_tag_text10').fadeOut();
    }
    );

  //トップページ機能説明-----------------------------------
  $('.information_list1').hover(
    function() {
      $(this).find('.information_none1').addClass('text-active');
    },
    function() {
         $(this).find('.information_none1').removeClass('text-active');
    }
  );

  $('.information_list2').hover(
    function() {
      $(this).find('.information_none2').addClass('text-active');
    },
    function() {
         $(this).find('.information_none2').removeClass('text-active');
    }
    );

  $('.information_list3').hover(
    function() {
      $(this).find('.information_none3').addClass('text-active');
    },
    function() {
         $(this).find('.information_none3').removeClass('text-active');
    }
    );

  //スクロールでフェードイン------------------------------
  function animation(){
    $('.fadeIn').each(function(){
      //ターゲットの位置を取得
      var target = $(this).offset().top;
      //スクロール量を取得
      var scroll = $(window).scrollTop();
      //ウィンドウの高さを取得
      var windowHeight = $(window).height();
      //ターゲットまでスクロールするとフェードインする
      if (scroll > target - windowHeight){
        $(this).css('opacity','1');
        $(this).css('transform','translateY(0)');
      }
    });
  }
  animation();
  $(window).scroll(function (){
    animation();
  });

  //マウスホバー----------------------------------------
  $('body').mousemove(function(e) {
      // console.log(e.clientX, e.clientY);
      var cx = $(this).width() / 2;
      var cy = $(this).height() / 2;
      var dx = e.clientX - cx;
      var dy = e.clientY - cy;
      $('#mouse_box1').css('left', cx + dx * 1.0);
      // $('#mouse_box2').css('left', cx + dx * 1.3);
      // $('#mouse_box3').css('left', cx + dx * 1.5);
      $('#mouse_box1').css('top', cy + dy * 1.0);
      // $('#mouse_box2').css('top', cy + dy * 1.1);
      // $('#mouse_box3').css('top', cy + dy * 1.3);
    });

  //検索フォーム-----------------------------------------
  var show = document.getElementById('show');
  var hide = document.getElementById('hide');

  show.addEventListener('click', function() {
    // alert('1 is clicked');
    $('.search-form').addClass('search-form-open');
  });

  hide.addEventListener('click', function() {
    $('.search-form').removeClass('search-form-open');
  });

  //ハンバーガーメニュー-----------------------------------
  $(function() {
    $('.menu-trigger').on('click', function() {
      $(this).toggleClass('active');
      $('#sp-menu').fadeToggle();
      return false;
    });
  });

});



