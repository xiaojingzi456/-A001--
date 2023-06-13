<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
  <meta charset="UTF-8">
  <title>后台管理</title>
  <meta name="renderer" content="webkit|ie-comp|ie-stand">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="Cache-Control" content="no-siteapp"/>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/css/font.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/css/xadmin.css">
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/static/admin/lib/layui/layui.js" charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/xadmin.js"></script>
</head>
<body class="index">
<!-- 顶部开始 -->
<div class="container">
  <div class="logo">
    <a href="">百佳惠购物商城</a></div>
  <div class="left_open">
    <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
  </div>
  <ul class="layui-nav right" lay-filter="">
    <li class="layui-nav-item">
      <a href="javascript:;">${admin.aname}</a>
      <dl class="layui-nav-child">
        <!-- 二级菜单 -->
        <dd>
          <a onclick="xadmin.open('个人信息','<%=request.getContextPath()%>/controllerAdmin?method=personal')">个人信息</a>
        </dd>
        <dd>
          <a href="<%=request.getContextPath()%>/controllerAdmin?method=login">退出</a>
        </dd>
      </dl>
    </li>
    <li class="layui-nav-item to-index">
      <a href="<%=request.getContextPath()%>/controller?method=home">前台首页</a></li>
  </ul>
</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
  <div id="side-nav">
    <ul id="nav">
      <li>
        <a href="javascript:;">
          <i class="iconfont left-nav-li" lay-tips="会员管理">&#xe6b8;</i>
          <cite>会员管理</cite>
          <i class="iconfont nav_right">&#xe697;</i></a>
        <ul class="sub-menu">
          <li>
            <a onclick="xadmin.add_tab('会员列表','<%=request.getContextPath()%>/controllerAdmin?method=memberList')">
              <i class="iconfont">&#xe6a7;</i>
              <cite>会员列表</cite></a>
          </li>
        </ul>
      </li>
      <li>
        <a href="javascript:;">
          <i class="iconfont left-nav-li" lay-tips="订单管理">&#xe723;</i>
          <cite>订单管理</cite>
          <i class="iconfont nav_right">&#xe697;</i></a>
        <ul class="sub-menu">
          <li>
            <a onclick="xadmin.add_tab('订单列表','<%=request.getContextPath()%>/controllerAdmin?method=orderList')">
              <i class="iconfont">&#xe6a7;</i>
              <cite>订单列表</cite></a>
          </li>
        </ul>
        <ul class="sub-menu">
          <li>
            <a onclick="xadmin.add_tab('物流列表','<%=request.getContextPath()%>/controllerAdmin?method=logisticsList')">
              <i class="iconfont">&#xe6a7;</i>
              <cite>物流列表</cite></a>
          </li>
        </ul>
      </li>
      <li>
        <a href="javascript:;">
          <i class="iconfont left-nav-li" lay-tips="分类管理">&#xe723;</i>
          <cite>商品管理</cite>
          <i class="iconfont nav_right">&#xe697;</i></a>
        <ul class="sub-menu">
          <li>
            <a onclick="xadmin.add_tab('商品类别','<%=request.getContextPath()%>/category?method=cate')">
              <i class="iconfont">&#xe6a7;</i>
              <cite>商品类别</cite></a>
          </li>
        </ul>
        <ul class="sub-menu">
          <li>
            <a onclick="xadmin.add_tab('商品规格','<%=request.getContextPath()%>/specsServlet?method=findSpecsAndSpecsTowAndCommodity')">
              <i class="iconfont">&#xe6a7;</i>
              <cite>商品规格</cite></a>
          </li>
        </ul>
        <ul class="sub-menu">
          <li>
            <a onclick="xadmin.add_tab('商品上新','<%=request.getContextPath()%>/commodity?method=productAdd')">
              <i class="iconfont">&#xe6a7;</i>
              <cite>商品上新</cite></a>
          </li>
        </ul>
        <ul class="sub-menu">
          <li>
            <a onclick="xadmin.add_tab('商品列表','<%=request.getContextPath()%>/controllerAdmin?method=productList')">
              <i class="iconfont">&#xe6a7;</i>
              <cite>商品列表</cite></a>
          </li>
        </ul>
      </li>
      <li>
        <a href="javascript:;">
          <i class="iconfont left-nav-li" lay-tips="管理员管理">&#xe726;</i>
          <cite>管理员管理</cite>
          <i class="iconfont nav_right">&#xe697;</i></a>
        <ul class="sub-menu">
          <li>
            <a onclick="xadmin.add_tab('管理员列表','<%=request.getContextPath()%>/controllerAdmin?method=adminList')">
              <i class="iconfont">&#xe6a7;</i>
              <cite>管理员列表</cite></a>
          </li>
        </ul>
      </li>
      <li>
        <a href="javascript:;">
          <i class="iconfont left-nav-li" lay-tips="系统统计">&#xe6ce;</i>
          <cite>系统统计</cite>
          <i class="iconfont nav_right">&#xe697;</i></a>
        <ul class="sub-menu">
          <li>
            <a onclick="xadmin.add_tab('拆线图','<%=request.getContextPath()%>/controllerAdmin?method=echarts')">
              <i class="iconfont">&#xe6a7;</i>
              <cite>拆线图</cite>
            </a>
          </li>
        </ul>
      </li>
    </ul>
  </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
  <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
    <ul class="layui-tab-title">
      <li class="home">
        <i class="layui-icon">&#xe68e;</i>百佳惠购物商城-后台首页
      </li>
    </ul>
    <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
      <dl>
        <dd data-type="this">关闭当前</dd>
        <dd data-type="other">关闭其它</dd>
        <dd data-type="all">关闭全部</dd>
      </dl>
    </div>
    <div class="layui-tab-content">
      <div class="layui-tab-item layui-show">
        <iframe src='<%=request.getContextPath()%>/controllerAdmin?method=welcome' frameborder="0" scrolling="yes"
                class="x-iframe"></iframe>
      </div>
    </div>
    <div id="tab_show"></div>
  </div>
</div>
<div class="page-content-bg"></div>
<style id="theme_style"></style>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
</body>
</html>