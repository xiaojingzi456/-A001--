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
  <script src="<%=request.getContextPath()%>/static/admin/lib/layui/layui.js" charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/static/admin/lib/layui/layui.js" charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/xadmin.js"></script>
  <script src="<%=request.getContextPath()%>/static/admin/js/myAdmin.js" charset="utf-8"></script>
</head>
<body>
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
          <form class="layui-form layui-col-space5" id="adminFindAllForm"
                action="<%=request.getContextPath()%>/controllerAdmin" method="get">
            <input type="hidden" name="method" value="adminList">
            <div class="layui-inline layui-show-xs-block">
              <input type="text" name="aname" placeholder="请输入用户名" value="${condition.aname[0]}" autocomplete="off"
                     class="layui-input">
            </div>
            <div class="layui-inline layui-show-xs-block">
              <input type="text" name="atelephone" placeholder="请输入手机号" value="${condition.atelephone[0]}"
                     autocomplete="off" class="layui-input">
            </div>
            <div class="layui-inline layui-show-xs-block">
              <button class="layui-btn" lay-submit lay-filter="adminFindAll"><i class="layui-icon">&#xe615;</i>
              </button>
            </div>
          </form>
        </div>
        <c:if test="${admin.arole==1}">
          <div class="layui-card-header">
            <button class="layui-btn"
                    onclick="xadmin.open('添加管理员','<%=request.getContextPath()%>/controllerAdmin?method=adminAdd')"><i
                    class="layui-icon"></i>添加
            </button>
          </div>
        </c:if>

        <div class="layui-card-body ">
          <table class="layui-table layui-form">
            <thead>
            <tr>
              <th>序号</th>
              <th>ID</th>
              <th>名称</th>
              <th>号码</th>
              <th>性别</th>
              <th>简介</th>
              <th>角色</th>
              <c:if test="${admin.arole==1}">
                <th>操作</th>
              </c:if>
            </tr>
            </thead>
            <tbody id="adminList"></tbody>
          </table>
        </div>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;"></fieldset>
        <div id="adminPage"></div>
      </div>
    </div>
  </div>
</div>
<script>
  //将管理员信息分页展示
  function findAdminAll(laypage) {
    $.ajax({
      url: "/Hisense/admin?method=findAdminByNameAndPhone",
      type: "POST",
      data: $("#adminFindAllForm").serialize(),
      dataType: "json",
      async: true,
      cache: false,
      success: function (result) {
        adminPageData(laypage, result);
      }
    });
  }

  //管理员分页数据渲染
  function adminPageData(laypage, result) {
    laypage.render({
      elem: 'adminPage'
      , count: result.data.length
      , layout: ['prev', 'page', 'next', 'skip', 'refresh', 'limit', 'count']
      , jump: function (obj) {
        $("#adminList").html(function () {
          var arr = []
          thisData = result.data.concat().splice(obj.curr * obj.limit - obj.limit, obj.limit);
          layui.each(thisData, function (index, item) {
            if (item.arole === 1) {
              arr.push('<tr class="layui-bg-green">');
            } else {
              arr.push('<tr>');
            }
            arr.push('<td>' + (index + 1) + '</td>');
            arr.push('<td class="aid">' + item.aid + '</td>');
            arr.push('<td>' + item.aname + '</td>');
            arr.push('<td>' + item.atelephone + '</td>');
            arr.push('<td>' + item.asex + '</td>');
            arr.push('<td>' + item.aintroduce + '</td>');
            if (item.arole === 1) {
              arr.push('<td>超级管理员</td>');
            } else {
              arr.push('<td>管理员</td>');
            }
            if (${admin.arole==1}) {
              arr.push('<td class="td-status">');
              if (item.astate === 1 && item.arole === 0) {
                arr.push('<span class="layui-btn layui-btn-normal layui-btn-mini" onclick="closeAdmin(this)" title="停用">已启用</span>');
              } else if (item.astate === 0) {
                arr.push('<span class="layui-btn layui-btn-normal layui-btn-mini layui-bg-gray" onclick="openAdmin(this)" title="启用">已停用</span>');
              }
              arr.push('</td>');
            }
            arr.push('</tr>');
          });
          return arr.join('');
        });
      }
    })
    ;
  }


  layui.use(['form', 'jquery', 'laypage'], function () {
    var $ = layui.jquery,
        form = layui.form,
        laypage = layui.laypage;
    //条件查询管理员
    form.on('submit(adminFindAll)', function () {
      //条件查询后调用分页请求
      findAdminAll(laypage)
      return false;
    });

    //首次进入管理员信息界面调用管理员信息分页
    findAdminAll(laypage);
  });

</script>
</body>
</html>