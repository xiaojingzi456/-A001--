<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
<form class="layui-form layui-form-pane" action="" id="modifyForm">
  <div class="layui-form-item">
    <label class="layui-form-label">管理员ID</label>
    <div class="layui-input-block">
      <input type="text" name="aid" required lay-verify="required"
             value=${admin.aid} autocomplete="off" class="layui-input" readonly>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">姓名</label>
    <div class="layui-input-block">
      <input type="text" name="aname" required lay-verify="required|username" placeholder="请输入姓名"
             value=${admin.aname} autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-block">
      <input type="password" name="apwd" required lay-verify="required|password" placeholder="请输入密码"
             value=${admin.apwd} autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">账号状态</label>
    <div class="layui-input-block">
      <c:if test="${admin.astate==1}">
        <input type="text" name="astate" required lay-verify="required" value="有效" autocomplete="off"
               class="layui-input" disabled>
      </c:if>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">性别</label>
    <div class="layui-input-block">
      <c:if test="${admin.asex=='男'}">
        <input type="radio" name="asex" value="男" title="男" checked>
        <input type="radio" name="asex" value="女" title="女">
      </c:if>
      <c:if test="${admin.asex=='女'}">
        <input type="radio" name="asex" value="男" title="男">
        <input type="radio" name="asex" value="女" title="女" checked>
      </c:if>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">角色</label>
    <div class="layui-input-block">
      <c:if test="${admin.arole==1}">
        <input type="text" name="arole" required lay-verify="required" value="超级管理员" autocomplete="off"
               class="layui-input" disabled>
      </c:if>
      <c:if test="${admin.arole==0}">
        <input type="text" name="arole" required lay-verify="required" value="管理员" autocomplete="off"
               class="layui-input" disabled>
      </c:if>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">联系电话</label>
    <div class="layui-input-block">
      <input type="text" name="atelephone" required lay-verify="required|phone"
             value=${admin.atelephone} autocomplete="off"
             class="layui-input">
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">自我介绍</label>
    <div class="layui-input-block">
      <textarea name="aintroduce" placeholder="请输入内容" class="layui-textarea">${admin.aintroduce}</textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="modify">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
</body>
</html>
