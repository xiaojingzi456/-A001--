function setIframeHeight(iframe) {
  if (iframe) {
    var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
    if (iframeWin.document.body) {
      iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
    }
  }
};

window.onload = function () {
  setIframeHeight(document.getElementById('external-frame'));
};

// iframe模板刷新后页面跳转问题解决--start
// function loadIframe(url) {
//   //获取url链接
//   var u = window.location.href;
//   //因为每次获取的链接中都有之前的旧锚点，
//   //所以需要把#之后的旧锚点去掉再来加新的锚点（即传入的url参数）
//   var end = u.indexOf("#");
//   var rurl = u.substring(0, end);
//   if (rurl === '') {
//     rurl = "/Hisense/controller?method=personal"
//   }
//   //设置新的锚点
//   window.location.href = rurl + "#" + url;
// }
//
// window.onhashchange = function () {
//   //location.hash取到的是url链接中#(包括自己)后面的内容
//   var hash = location.hash;
//   //去掉#号，得到的就是我们要设置到iframe中src上的地址
//   var url = hash.substring(1, hash.length);
//   $("#external-frame").attr("src", url);
// }

document.addEventListener('DOMContentLoaded', function () {
  var hash = location.hash;
  var url = hash.substring(1, hash.length);
  var $external = $("#external-frame");
  if (url === "") {
    $external.attr("src", $external.attr("src"));
  } else {
    $external.attr("src", url);
  }
}, false)
// iframe模板刷新后页面跳转问题解决--end


$(function () {
  var $frame = $("#external-frame");
  var $iframe = $("#iframe");
  var $acc = $("#acc");
  var $order = $("#order");
  var $addre = $("#addre");
  var $can = $("#cancellation");
  var $utc = $("#u-t-c li ul li a");
  var $a = $(".ac-s li a");
  var $s = $(".ac-s li span");
  $utc.click(function () {
    $utc.removeClass("u-t-c2");
    $(this).addClass("u-t-c2");
    var $this_a = $(this).parent().parent().prev();
    $a.removeAttr("href");
    $a.html($this_a.html() + "&nbsp;&nbsp;>");
    $s.html("&nbsp;&nbsp;" + $(this).html())
  });
  $acc.click(function () {
    // loadIframe($acc.attr("href"));
    $iframe.empty();
    var $frame = $(
        '<iframe id="external-frame" name="account" src="/Hisense/controller?method=account" onload="setIframeHeight(this)" scrolling="no" width="100%" frameborder="0"></iframe>'
    );
    $frame.appendTo($iframe);
  });
  $order.click(function () {
    // loadIframe($order.attr("href"));
    $iframe.empty();
    var $frame = $(
        '<iframe id="external-frame" name="order" src="/Hisense/controller?method=order" onload="setIframeHeight(this)" scrolling="no" width="100%" frameborder="0"></iframe>'
    );
    $frame.appendTo($iframe);
  });
  $can.click(function () {
    // loadIframe($can.attr("href"));
    $iframe.empty();
    var $frame = $(
        '<iframe id="external-frame" name="cancellation" src="/Hisense/controller?method=cancellation" onload="setIframeHeight(this)" scrolling="no" width="100%" frameborder="0"></iframe>'
    );
    $frame.appendTo($iframe);
  });
  $addre.click(function () {
    // loadIframe($can.attr("href"));
    $iframe.empty();
    var $frame = $(
        '<iframe id="external-frame" name="address" src="/Hisense/controller?method=getAddress" onload="setIframeHeight(this)" scrolling="no" width="100%" frameborder="0"></iframe>'
    );
    $frame.appendTo($iframe);
  });
});
