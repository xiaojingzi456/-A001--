$(function () {
  var $login_inp = $(".control-group input");
  var $phone = $("#uphone");
  var $pwd = $("#upwd");
  var $inner = $(".inner-input-left-icon");
  var $codelogin = $("#verify-login");
  $phone.focus(function () {
    $inner.eq(0).css({
      top: "-28px",
      opacity: ".8",
      fontSize: "14px"
    });
  }).blur(function () {
    if ($login_inp.eq(0).val() === "") {
      $inner.eq(0).css({
        top: "0",
        opacity: ".5",
        fontSize: "16px",
      });
    }
  });
  $pwd.focus(function () {
    $inner.eq(1).css({
      top: "-28px",
      opacity: ".8",
      fontSize: "14px"
    });
  }).blur(function () {
    if ($login_inp.eq(1).val() === "") {
      $inner.eq(1).css({
        top: "0",
        opacity: ".5",
        fontSize: "16px",
      });
    }
  });
  $codelogin.focus(function () {
    $inner.eq(2).css({
      top: "-28px",
      opacity: ".8",
      fontSize: "14px"
    });
  }).blur(function () {
    if ($login_inp.eq(2).val() === "") {
      $inner.eq(2).css({
        top: "0",
        opacity: ".5",
        fontSize: "16px",
      });
    }
  });
  var $lia = $(".l-i-a");
  var flag = 0;
  $lia.eq(0).click(function () {
    if (flag === 0) {
      $(this).attr("src", "/Hisense/static/image/home/view%20(2).png");
      $pwd.attr("type", "text");
      flag = 1;
    } else {
      $(this).attr("src", "/Hisense/static/image/home/view%20(1).png");
      $pwd.attr({
        type: "password",
      });
      flag = 0;
    }
  });
  var $laa = $(".l-ul-18 li");
  $laa.click(function () {
    $laa.removeAttr("class");
    $(this).addClass("l-a-a");
  });

  var $verifyCode = $("#verifyCode");
  var $rphone = $("#phone");
  var $errorCode = $("#errorCode span");

  $verifyCode.focus(function () {
    $inner.eq(1).css({
      top: "-28px",
      opacity: ".8",
      fontSize: "14px"
    });
  }).blur(function () {
    if ($login_inp.eq(1).val() === "") {
      $inner.eq(1).css({
        top: "0",
        opacity: ".5",
        fontSize: "16px",
      });
    }
  });
  $rphone.focus(function () {
    $inner.eq(2).css({
      top: "-28px",
      opacity: ".8",
      fontSize: "14px"
    });
  }).blur(function () {
    if ($login_inp.eq(2).val() === "") {
      $inner.eq(2).css({
        top: "0",
        opacity: ".5",
        fontSize: "16px",
      });
    }
  });
  var $th500 = $(".t-h-500");
  var $img_lun = $(".t-h-500 a img");
  var $jtr = $(".jt-r");
  var $jtl = $(".jt-l");
  var $yd = $(".yd span");
  var currentIndex = 0;
  var timer = null;

  function starScroll() {
    timer = setInterval(function () {
      currentIndex++;
      if (currentIndex >= $img_lun.length) {
        currentIndex = 0;
      }
      $yd.removeClass("yd-b");
      $img_lun.removeClass("active");
      $img_lun.eq(currentIndex).addClass('active');
      $yd.eq(currentIndex).addClass("yd-b");
    }, 2000);
  }

  starScroll();
  $th500.mouseover(function () {
    clearInterval(timer)
  });
  $th500.mouseout(function () {
    starScroll();
  });
  var $currentIndex = 0;
  $jtr.click(function () {
    $yd.removeClass("yd-b");
    $img_lun.removeClass("active");
    $currentIndex = (currentIndex += 1)
    if ($currentIndex >= $img_lun.length) {
      currentIndex = 0;
    }
    $yd.eq(currentIndex).addClass("yd-b");
    $img_lun.eq(currentIndex).addClass('active');
  });
  $jtl.click(function () {
    $yd.removeClass("yd-b");
    $img_lun.removeClass("active")
    $currentIndex = (currentIndex -= 1);
    if ($currentIndex < 0) {
      currentIndex = $img_lun.length - 1;
    }
    $yd.eq($currentIndex).addClass("yd-b");
    $img_lun.eq($currentIndex).addClass('active');
  });
  $yd.click(function () {
    $yd.removeClass("yd-b");
    $img_lun.removeClass("active")
    var $index = $(this).index();
    currentIndex = $index;
    $yd.eq($index).addClass("yd-b");
    $img_lun.eq($index).addClass('active');
    console.log($index)
  });

  var $isearch = $(".i-search");
  var $formse = $("#form-se");
  var $tw1026 = $(".t-w-1026 ul");
  var $formse2 = $(".form-search2 img");
  $isearch.click(function () {
    $tw1026.css("display", "none");
    $formse.css("display", "block");
    $isearch.css({
      float: "left",
      marginLeft: "40px"
    })
  });
  $formse2.click(function () {
    $tw1026.css("display", "block");
    $formse.css("display", "none");
    $isearch.css({
      float: "right"
    })
  });
  $("#put").keyup(function (event) {
    if (event.keyCode === 13) {
      $("#searForm").submit();
      alert("提交成功！");
    }
  });
});

function checkCode(src) {
  src.attr("src", "/Hisense/user?method=code&" + new Date().getTime());
}
