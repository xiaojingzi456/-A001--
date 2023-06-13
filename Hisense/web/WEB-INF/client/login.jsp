<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="utf-8">
  <title></title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/home/home.css"/>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jQuery/jquery-1.12.4.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/home/home.js"></script>
</head>
<body>
<div class="l-w-1519">
  <div class="l-h-140 l-w-1188">
    <div class="l-h-80">
      <div style="padding-top: 50px">
        <span class="l-f-20"><a style="font-size: 30px;color: rgb(51, 51, 51)" href="<%=request.getContextPath()%>/controller?method=home">百佳惠购物商城</a>权威官网 汇聚精品</span>
      </div>
    </div>
  </div>
  <div class="l-h-650">
    <div class="l-img-650">
      <div class="l-w-384">
        <div class="l-w-288">
          <ul class="l-ul-18">
            <li class="l-a-a"><a>账户登录</a></li>
            <li><a>快捷登录</a></li>
          </ul>
        </div>
        <div class="l-h-40">
          <div class="l-d-i"><img src="<%=request.getContextPath()%>/static/image/home/close.png" alt=""></div>
          <div class="l-d-p"></div>
        </div>
        <div class="l-h-434">
          <div class="l-w-288b">
            <form id="loginUserForm">
              <div class="control-group">
                <span class="inner-input-left-icon">账号/邮箱/手机号</span>
                <input type="text" name="uphone" id="uphone">
                <div class="uPhoneMsg">
                  <img src="<%=request.getContextPath()%>/static/image/home/info.png" alt="" class="i-info">
                  <span class="note-icon"></span>
                </div>
              </div>
              <div class="control-group">
                <span class="inner-input-left-icon">密码</span>
                <input type="password" name="upwd" id="upwd" style="width: 270px;">
                <div class="l-o-img">
                  <img src="<%=request.getContextPath()%>/static/image/home/view%20(1).png" alt="" class="l-i-a">
                </div>
                <div class="pwdMsg">
                  <img src="<%=request.getContextPath()%>/static/image/home/info.png" alt="" class="i-info">
                  <span class="note-icon"></span>
                </div>
              </div>
              <div class="control-group">
                <span class="inner-input-left-icon">图形验证码</span>
                <input type="text" name="verify" id="verify-login" style="width: 170px;">
                <div class="l-w-110">
                  <img src="<%=request.getContextPath()%>/user?method=code" alt="" onclick="checkCode($(this))"
                       class="l-i-110">
                </div>
                <div class="verifyMsg">
                  <img src="<%=request.getContextPath()%>/static/image/home/info.png" alt="" class="i-info">
                  <span class="note-icon"></span>
                </div>
              </div>
              <div class="l-c-dr">
										<span class="free-login2">
											<input type="checkbox" class="input-checkbox1">
											30天免登录
										</span>
                <div class="l-d-r">
                  <a href="" class="l-c-b">忘记密码？</a>
                  <a href="<%=request.getContextPath()%>/controller?method=register" class="l-c-g">免费注册</a>
                </div>
              </div>
              <div id="login-submit">
                <input type="button" id="loginUser" class="login-btn" value="立即登录">
              </div>
            </form>
            <div class="l-h-93">
              <div class="l-h-16">可选择第三方登录方式</div>
              <div class="l-h-25">
                <a href=""><img src="<%=request.getContextPath()%>/static/image/home/social_wechat.png" alt=""></a>
                <a href=""><img src="<%=request.getContextPath()%>/static/image/home/alipay.png" alt=""></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="l-w-120">
    <p class="1-w-1188 l-p-c">
      湖南百佳惠购物商城营销管理有限公司版权所有
      <span>网站备案/许可证号</span>
      <span>ICP备xxxxxxxxx</span>
    </p>
  </div>
</div>
<script>
  $("#uphone").blur(function () {
    $.ajax({
      url: "/Hisense/user?method=findUserByPhone",
      type: "POST",
      data: {"uphone": $("#uphone").val()},
      dataType: "json",
      async: false,
      cache: false,
      success: function (result) {
        if (result.flag) {
          $(".uPhoneMsg").css({
            display: "block",
          });
          $(".uPhoneMsg").find(".note-icon").text(result.errorMsg);
        } else {
          $(".uPhoneMsg").css({
            display: "none",
          });
          $(".uPhoneMsg").find(".note-icon").text(result.errorMsg);
        }
      },
      error: function () {
        console.log("出错了！");
      }
    })
  });

  $("#upwd").blur(function () {
    if ($("#upwd").val().length === 0) {
      $(".pwdMsg").css({
        display: "block"
      });
      $(".pwdMsg").find(".note-icon").text("密码不可为空");
    } else {
      $(".pwdMsg").css({
        display: "none"
      });
    }
  })

  $("#verify-login").blur(function () {
    $.ajax({
      url: "/Hisense/user?method=checkCode",
      data: {"verify": $("#verify-login").val()},
      type: "POST",
      dataType: "json",
      async: false,
      cache: false,
      success: function (result) {
        if (result.flag) {
          $(".verifyMsg").css({
            display: "block"
          });
          $(".verifyMsg").find(".note-icon").text(result.errorMsg);
        } else {
          $(".verifyMsg").css({
            display: "none"
          });
          $(".verifyMsg").find(".note-icon").text(result.errorMsg);
        }
      },
      error: function () {
        console.log("出错了！");
      }
    });
  })

  $("#loginUser").click(function () {
    $.ajax({
      url: "/Hisense/user?method=loginUser",
      type: "POST",
      data: $("#loginUserForm").serialize(),
      dataType: "json",
      async: false,
      cache: false,
      success: function (result) {
        if (result.flag) {
          $(".l-h-40").css({
            display: "block",
          });
          $(".l-d-p").text(result.errorMsg);
        } else {
          location.href = "/Hisense/controller?method=home"
        }
      },
      error: function () {
        console.log("出错了！");
      }
    })
    return false;
  })
</script>
</body>
</html>
