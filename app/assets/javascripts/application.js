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
  //nav_tagホバー時に発火(nav_tag_textの表示)
  $('.nav_tag_mypage').hover(
    function(){
      $('.nav_tag_text_mypage').fadeIn();
    },
    function(){
      $('.nav_tag_text_mypage').fadeOut();
    }
    );

  $('.nav_tag_find').hover(
    function(){
      $('.nav_tag_text_find').fadeIn();
    },
    function(){
      $('.nav_tag_text_find').fadeOut();
    }
    );

  $('.nav_tag_index').hover(
    function(){
      $('.nav_tag_text_index').fadeIn();
    },
    function(){
      $('.nav_tag_text_index').fadeOut();
    }
    );

  $('.nav_tag_signout').hover(
    function(){
      $('.nav_tag_text_signout').fadeIn();
    },
    function(){
      $('.nav_tag_text_signout').fadeOut();
    }
    );

  $('.nav_tag_timeline').hover(
    function(){
      $('.nav_tag_text_timeline').fadeIn();
    },
    function(){
      $('.nav_tag_text_timeline').fadeOut();
    }
    );

  $('.nav_tag_signup').hover(
    function(){
      $('.nav_tag_text_signup').fadeIn();
    },
    function(){
      $('.nav_tag_text_signup').fadeOut();
    }
    );

  $('.nav_tag_signin').hover(
    function(){
      $('.nav_tag_text_signin').fadeIn();
    },
    function(){
      $('.nav_tag_text_signin').fadeOut();
    }
    );

  $('.nav_tag_dm').hover(
    function(){
      $('.nav_tag_text_dm').fadeIn();
    },
    function(){
      $('.nav_tag_text_dm').fadeOut();
    }
    );

  $('.nav_tag_notice').hover(
    function(){
      $('.nav_tag_text_notice').fadeIn();
    },
    function(){
      $('.nav_tag_text_notice').fadeOut();
    }
    );

  //トップページFunction(機能説明)-----------------------------------
  //アイコンホバー時に発火(addClass)
  $('.information_list_recommend').hover(
    function() {
      $(this).find('.information_list_recommend_none').addClass('text-active');
    },
    function() {
         $(this).find('.information_list_recommend_none').removeClass('text-active');
    }
  );

  $('.information_list_calendar').hover(
    function() {
      $(this).find('.information_list_calendar_none').addClass('text-active');
    },
    function() {
         $(this).find('.information_list_calendar_none').removeClass('text-active');
    }
    );

  $('.information_list_dm').hover(
    function() {
      $(this).find('.information_list_dm_none').addClass('text-active');
    },
    function() {
         $(this).find('.information_list_dm_none').removeClass('text-active');
    }
    );

  //スクロールでフェイドイン--------------------------------------------
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

  //マウスパララックス----------------------------------------
  //マウスの座標を取得
  $('body').mousemove(function(e) {
      // console.log(e.clientX, e.clientY);
      var cx = $(this).width() / 2;
      var cy = $(this).height() / 2;
      var dx = e.clientX - cx;
      var dy = e.clientY - cy;
      $('#mouse_box').css('left', cx + dx * 1.0);
      $('#mouse_box').css('top', cy + dy * 1.0);
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



