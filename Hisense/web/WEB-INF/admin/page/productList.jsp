<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
  <meta charset="UTF-8">
  <title>后台管理</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/css/font.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/css/xadmin.css">
  <script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-1.12.4.js"></script>
  <script src="<%=request.getContextPath()%>/static/admin/lib/layui/layui.js" charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/xadmin.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/myAdmin.js"></script>
</head>
<body>
<div class="layui-anim layui-anim-upbit">
  <div class="x-nav">
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()"
       title="刷新">
      <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
  </div>
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-body ">
            <form class="layui-form layui-col-space5" id="CommodityFindAllForm">
              <input type="hidden" name="method" value="adminList">
              <div class="layui-inline layui-show-xs-block">
                <input type="text" name="coname" placeholder="请输入商品名" value="${condition.coname[0]}" autocomplete="off"
                       class="layui-input">
              </div>
              <div class="layui-inline layui-show-xs-block">
                <input type="text" name="coid" placeholder="请输入商品ID" value="${condition.coid[0]}"
                       autocomplete="off" class="layui-input">
              </div>
              <div class="layui-inline layui-show-xs-block">
                <button class="layui-btn" lay-submit lay-filter="CommodityFindAll"><i class="layui-icon">&#xe615;</i>
                </button>
              </div>
            </form>
          </div>
          <div class="layui-card-body ">
            <table class="layui-table layui-form">
              <thead>
              <tr>
                <th>序号</th>
                <th>型号</th>
                <th>名称</th>
                <th>图片</th>
                <th>现价</th>
                <th>原价</th>
                <th>已售</th>
                <th>操作</th>
              </tr>
              </thead>
              <tbody id="commodityList"></tbody>
            </table>
          </div>
          <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;"></fieldset>
          <div id="commodityPage"></div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
