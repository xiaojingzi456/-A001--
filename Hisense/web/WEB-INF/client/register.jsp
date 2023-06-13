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
<div class="r">
  <div class="r-w-1519">
    <div class="r-h-29">
      <a href="<%=request.getContextPath()%>/controller?method=home" style="font-size: 35px;color: #0C0C0C">百佳惠购物商城</a>
      <a href="<%=request.getContextPath()%>/controller?method=login">
        <p>已有账号？直接登录</p>
      </a>
    </div>
    <div class="r-w-788">
      <div class="r-h-558">
        <div class="r-w-320">
          <div class="r-w-20">注册百佳惠购物商城账号</div>
          <form id="registerForm">
            <div class="control-group">
              <span class="inner-input-left-icon">手机号码</span>
              <input type="text" name="uphone" id="uphone">
              <div class="uPhoneMsg">
                <img src="<%=request.getContextPath()%>/static/image/home/info.png" alt="" class="i-info">
                <span class="note-icon"></span>
              </div>
            </div>
            <div class="control-group">
              <span class="inner-input-left-icon">密码</span>
              <input type="password" name="upwd" id="upwd" style="width: 302px;">
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
              <input type="text" name="verify" id="verify-login" style="width: 200px;">
              <div class="l-w-110">
                <img src="<%=request.getContextPath()%>/user?method=code" onclick="checkCode($(this))" alt=""
                     class="l-i-110">
              </div>
              <div class="verifyMsg" id="errorCode">
                <img src="<%=request.getContextPath()%>/static/image/home/info.png" alt="" class="i-info">
                <span class="note-icon"></span>
              </div>
            </div>
            <div class="control-group">
              <%--              <span class="inner-input-left-icon">短信验证码</span>--%>
              <input type="text" name="phoneCod" id="phoneCod" style="width: 200px;">
              <div class="l-w-110">
                <div class="l-i-110 r-ya" id="getVerificationCode">获取验证码</div>
              </div>
              <div class="uPhoneCodMsg">
                <img src="<%=request.getContextPath()%>/static/image/home/info.png" alt="" class="i-info">
                <span class="note-icon"></span>
              </div>
            </div>
            <div id="r-submit">
              <input type="button" id="register" class="login-btn" value="立即注册">
            </div>
          </form>
        </div>
      </div>
    </div>
    <div class="r-h-54">
      <div class="r-w-886">
        <p>青岛海信营销管理有限公司版权所有 鲁ICP备05027830 </p>
      </div>
    </div>
  </div>
  <div id="r-t-1519">
    <div class="r-t-500"></div>
  </div>
</div>
<script>
  function checkPhone() {
    var bool = false;
    $.ajax({
      url: "/Hisense/user?method=findUserByPhone2",
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
          bool = true;
        }
      },
      error: function () {
        console.log("出错了！");
      }
    });
    return bool;
  }

  function checkPwd() {
    var bool = false;
    if ($("#upwd").val().length === 0) {
      $(".pwdMsg").css({
        display: "block"
      });
      $(".pwdMsg").find(".note-icon").text("密码不可为空");
    } else {
      if ($("#upwd").val().length >= 6) {
        $(".pwdMsg").css({
          display: "none"
        });
        bool = true;
      } else {
        $(".pwdMsg").css({
          display: "block"
        });
        $(".pwdMsg").find(".note-icon").text("密码必须不少于6位");
      }
    }
    return bool;
  }

  function checkVerify() {
    var bool = false;
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
          bool = true;
        }
      },
      error: function () {
        console.log("出错了！");
      }
    });
    return bool;
  }

  function checkVerificationCode() {
    var bool = false;
    $.ajax({
      url: "/Hisense/user?method=verificationCode",
      data: {"phoneCod": $("#phoneCod").val()},
      type: "POST",
      dataType: "json",
      async: false,
      cache: false,
      success: function (result) {
        if (result.flag) {
          $(".uPhoneCodMsg").css({
            display: "block"
          });
          $(".uPhoneCodMsg").find(".note-icon").text(result.errorMsg);
        } else {
          $(".uPhoneCodMsg").css({
            display: "none"
          });
          $(".uPhoneCodMsg").find(".note-icon").text(result.errorMsg);
          bool = true;
        }
      },
      error: function () {
        console.log("出错了！");
      }
    });
    return bool;
  }

  $("#uphone").blur(function () {
    checkPhone();
  });

  $("#upwd").blur(function () {
    checkPwd();
  });

  $("#verify-login").blur(function () {
    checkVerify();
  });

  $("#phoneCod").blur(function () {
    checkVerificationCode();
  })

  $("#getVerificationCode").click(function () {
    if (checkPhone() && checkPwd() && checkVerify()) {
      $.ajax({
        url: "/Hisense/verification",
        type: "POST",
        data: {"uphone": $("#uphone").val()},
        dataType: "json",
        async: true,
        cache: false,
        success: function (result) {
        },
        error: function () {
          console.log("出错了");
        }
      })
    }
  })

  $("#register").click(function () {
    if (checkPhone() && checkPwd() && checkVerify() && checkVerificationCode()) {
      $.ajax({
        url: "/Hisense/user?method=insertUser",
        type: "POST",
        data: $("#registerForm").serialize(),
        dataType: "json",
        async: true,
        cache: false,
        success: function (result) {
          if (result.flag) {
            alert(result.errorMsg);
          } else {
            location.href = "/Hisense/controller?method=login"
          }
        },
        error:function () {
          console.log("出错了");
        }
      })
    }
    return false;
  })
</script>
</body>
</html>
