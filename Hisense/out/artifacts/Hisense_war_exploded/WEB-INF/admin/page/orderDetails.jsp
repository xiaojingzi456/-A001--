<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>后台管理</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/css/font.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/css/xadmin.css">
  <script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-1.12.4.js" charset="utf-8"></script>
  <script src="<%=request.getContextPath()%>/static/admin/lib/layui/layui.js" charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/xadmin.js"></script>
</head>
<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>订单详情信息</legend>
</fieldset>

<table class="layui-table" lay-even="" lay-skin="row">
  <colgroup>
    <col width="150">
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>
  <tr>
    <th>订单详情编号</th>
    <th>商品编号</th>
    <th>商品名称</th>
    <th>商品图片</th>
    <th>商品数量</th>
    <th>商品单价</th>
    <th>商品总价</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${orderDetails}" var="od" varStatus="vs">
    <tr>
      <td>${od.otid}</td>
      <td>${od.coid}</td>
      <td>${od.coname}</td>
      <td><img src="<%=request.getContextPath()%>/static/image/picture/${od.copicture}" alt="商品图片"></td>
      <td>${od.onumber}</td>
      <td>${od.coprice}</td>
      <td>${od.coprice*od.onumber}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>
