<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
  <meta charset="UTF-8">
  <title>后台管理</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/css/font.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/css/xadmin.css">
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/lib/layui/layui.js"
          charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/xadmin.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/myAdmin.js"></script>
</head>
<body>
<div class="layui-fluid">
  <div class="layui-row">
    <form class="layui-form layui-form-pane" id="addForm">
      <div class="layui-form-item">
        <label for="username" class="layui-form-label x-red">
          名称
        </label>
        <div class="layui-input-block">
          <input type="text" id="username" name="aname" required lay-verify="required|username"
                 autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label x-red">
          密码
        </label>
        <div class="layui-input-block">
          <input type="password" name="apwd" required lay-verify="required|password"
                 autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label x-red">
          性别</label>
        <div class="layui-input-block">
          <input type="radio" name="asex" value="男" title="男" checked>
          <input type="radio" name="asex" value="女" title="女">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label x-red">
          电话
        </label>
        <div class="layui-input-block">
          <input type="text" name="atelephone" required lay-verify="required|phone"
                 autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
          <textarea name="aintroduce" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
      </div>
      <div class="layui-form-item">
        <div class="layui-input-block">
          <button class="layui-btn" lay-submit lay-filter="addAdmin">立即提交</button>
          <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>
