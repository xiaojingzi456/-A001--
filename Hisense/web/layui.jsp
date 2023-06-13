<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="static/admin/lib/layui/css/layui.css">
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>将一段已知数组分页展示</legend>
</fieldset>

<div class="layui-card-body layui-table-body layui-table-main">
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
      <th>状态</th>
      <th>操作</th>
    </tr>
    </thead>
    <tbody id="biuuu_city_list"></tbody>
  </table>
</div>
<div class="layui-card-body " id="demo20">
  <%--  <form><input type="hidden" name="accountState" value="1"></form>--%>

</div>

<script src="static/admin/js/jquery.min.js"></script>
<script src="static/admin/lib/layui/layui.all.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/xadmin.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/state.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
  layui.use(['laypage', 'layer'], function () {
    var laypage = layui.laypage, layer = layui.layer;
    $.ajax({
      url: "/Hisense/admin?method=adminList1",
      type: "POST",
      dataType: "json",
      async: true,
      cache: false,
      success: function (result) {
        console.log((result.data));
        //调用分页
        laypage.render({
          elem: 'demo20'
          , count: result.data.length
          , jump: function (obj) {
            //模拟渲染
            $("#biuuu_city_list").html(function () {
              var arr = []
                  , thisData = (result.data).concat().splice(obj.curr * obj.limit - obj.limit, obj.limit);
              layui.each(thisData, function (index, item) {
                arr.push('<tr><td>' + (index + 1) + '</td>');
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
                if (item.astate === 1) {
                  arr.push('<td class="td-status"><span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td>');
                  arr.push('<td class="td-manage"><a onclick="member_stop(this,\'10001\');stateForm(this,' + item.astate + ')" href="javascript:;" title="停用"></form><i class="layui-icon">&#xe601;</i></a></td></tr>')
                } else {
                  arr.push('<td class="td-status"><span class="layui-btn layui-btn-normal layui-btn-mini layui-btn-disabled">已停用</span></td>');
                  arr.push('<td class="td-manage"><a onclick="member_stop(this,\'10001\');stateForm(this,' + item.astate + ')" href="javascript:;" title="启用"></form><i class="layui-icon">&#xe62f;</i></a></td></tr>')
                }
              });
              return arr.join('');
            });
          }
        });
      },
      error: function () {
        console.log("出错了！");
      }
    });
  });

  function stateForm(obj, state) {
    console.log($(obj).parents('tr').find('.aid').text());
    var id = $(obj).parents('tr').find('.aid').text();
    $.ajax({
      url: "/Hisense/admin?method=modifyAdminState",
      type: "POST",
      data: {"accountState": state, "aid": id},
      dataType: "json",
      async: true,
      cache: false,
      success: function (result) {
        if (result.flag) {
          layer.confirm()
          layer.msg(result.errorMsg, {icon: 5, time: 1000});
        } else {
          layer.msg(result.errorMsg, {icon: 6, time: 1000});
          xadmin.father_reload();
        }
      },
      error: function () {
        console.log("出错了！");
      }
    });
  }
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/member_stop.js"></script>
</body>
</html>
