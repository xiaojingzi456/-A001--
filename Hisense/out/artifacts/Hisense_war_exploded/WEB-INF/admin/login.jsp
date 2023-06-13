<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
  <meta charset="UTF-8">
  <title>后台登录</title>
  <meta name="renderer" content="webkit|ie-comp|ie-stand">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport"
        content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
  <meta http-equiv="Cache-Control" content="no-siteapp"/>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/admin/css/font.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/admin/css/login.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/admin/css/xadmin.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/admin/lib/layui/css/layui.css">
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/lib/layui/layui.js"
          charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/myAdmin.js"
          charset="utf-8"></script>
  <script>
    $(function () {
      //防止页面后退
      history.pushState(null, null, document.URL);
      window.addEventListener('popstate', function () {
        history.pushState(null, null, document.URL);
      });
    })
  </script>
</head>
<body class="login-bg">
<div class="login layui-anim layui-anim-up">
  <div class="message">百佳惠购物商城--管理登录</div>
  <div id="darkbannerwrap"></div>
  <form class="layui-form" id="loginForm">
    <input name="aname" id="aname" placeholder="用户名" type="text" lay-verify="required" class="layui-input">
    <hr class="hr15">
    <input name="apwd" id="apwd" lay-verify="required" placeholder="密码" type="password" class="layui-input">
    <hr class="hr15">
    <div class="layui-form-item">
      <div class="layui-input-block" style="width: 340px;margin-left: 1px">
        <div id="slider"></div>
      </div>
    </div>
    <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
    <hr class="hr20">
  </form>
</div>
</body>
</html>