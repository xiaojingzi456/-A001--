<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="static/admin/lib/layui/css/layui.css">

</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>显示完整功能</legend>
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
      <th>邮箱</th>
      <th>状态</th>
      <th>操作</th>
    </tr>
    </thead>
    <tbody id="userAll"></tbody>
  </table>
</div>
<div id="demo7"></div>
<script src="static/admin/js/jquery.min.js"></script>
<script src="static/admin/lib/layui/layui.all.js" charset="utf-8"></script>
<script>
  layui.use(['laypage', 'layer'], function () {
    var laypage = layui.laypage
        , layer = layui.layer;
    $.ajax({
      url: "/Hisense/admin?method=memberList",
      type: "POST",
      dataType: "json",
      async: true,
      cache: false,
      success: function (result) {
        console.log(result.data);
        laypage.render({
          elem: 'demo7'
          , count: result.data.length
          ,limit:3
          ,limits:[3,6,9]
          , layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
          , jump: function (obj) {
            $("#userAll").html(function () {
              var arr = []
                  , thisData = (result.data).concat().splice(obj.curr * obj.limit - obj.limit, obj.limit);
              layui.each(thisData, function (index, item) {
                arr.push('<tr><td>' + (index + 1) + '</td>');
                arr.push('<td>' + item.uid + '</td>');
                arr.push('<td>' + item.uname + '</td>');
                arr.push('<td>' + item.uphone + '</td>');
                arr.push('<td>' + item.usex + '</td>');
                arr.push('<td>' + item.uemail + '</td>');
                if (item.ustate === 1) {
                  arr.push('<td class="td-status"><span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td>')
                  arr.push('<td class="td-manage"><a onclick="member_stop(this)" href="javascript:;" title="停用"><i class="layui-icon">&#xe601;</i></a></td></tr>')
                } else {
                  arr.push('<td class="td-status"><span class="layui-btn layui-btn-normal layui-btn-mini layui-btn-disabled">已停用</span></td>')
                  arr.push('<td class="td-manage"><a onclick="member_stop(this)" href="javascript:;" title="启用"><i class="layui-icon">&#xe62f;</i></a></td></tr>')
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
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/member_stop.js"></script>
</body>
</html>
