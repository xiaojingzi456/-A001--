<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
  <meta charset="UTF-8">
  <title>后台管理</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/css/font.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/css/xadmin.css">
  <script src="<%=request.getContextPath()%>/static/admin/lib/layui/layui.js" charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/static/admin/lib/layui/layui.js" charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/xadmin.js"></script>
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
          <form class="layui-form layui-col-space5" id="findLogisticsAllForm">
            <div class="layui-inline layui-show-xs-block">
              <input type="text" name="lid" placeholder="请输入物流订单" value="${condition.lid[0]}" autocomplete="off"
                     class="layui-input">
            </div>
            <div class="layui-inline layui-show-xs-block">
              <button class="layui-btn" lay-submit lay-filter="findLogisticsAll"><i class="layui-icon">&#xe615;</i>
              </button>
            </div>
          </form>
        </div>
        <div class="layui-card-body ">
          <table class="layui-table layui-form">
            <thead>
            <tr>
              <th>物流编号</th>
              <th>订单编号</th>
              <th>快递公司</th>
              <th>发货人电话</th>
              <th>发货时间</th>
              <th>发货地址</th>
              <th>收货地址</th>
            </tr>
            </thead>
            <tbody id="logisticsList"></tbody>
          </table>
        </div>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;"></fieldset>
        <div id="logisticsPage"></div>
      </div>
    </div>
  </div>
</div>
<script>
  function findLogisticsList(laypage) {
    $.ajax({
      url: "/Hisense/orderAdminServlet?method=findLogistics",
      type: "POST",
      data:$("#findLogisticsAllForm").serialize(),
      dataType: "json",
      async: true,
      cache: false,
      success: function (result) {
        logisticsPageData(laypage, result);
      },
      error:function (result,errorMsg) {
        console.log(errorMsg);
      }
    });
  }

  function logisticsPageData(laypage, result) {
    laypage.render({
      elem: 'logisticsPage'
      , count: result.data.length
      , layout: ['prev', 'page', 'next', 'skip', 'refresh', 'limit', 'count']
      , jump: function (obj) {
        $("#logisticsList").html(function () {
          var arr = []
          thisData = result.data.concat().splice(obj.curr * obj.limit - obj.limit, obj.limit);
          layui.each(thisData, function (index, item) {
            arr.push('<tr>');
            arr.push('<td>' + item.lid + '</td>');
            arr.push('<td class="oid">' + item.oid + '</td>');
            arr.push('<td>' + item.lexpress + '</td>');
            arr.push('<td>' + item.lphone + '</td>');
            arr.push('<td>' + item.ltime + '</td>');
            arr.push('<td>' + (item.ldprovince) + (item.ldcity) + (item.ldarea)+(item.ldeliver) + '</td>');
            arr.push('<td>' + (item.aprovince) + (item.acity) + (item.aarea) + (item.aspecific) + '</td>');
            arr.push('</tr>');
          });
          return arr.join('');
        });
      }
    });
  }


  layui.use(['form', 'jquery', 'laypage'], function () {
    var $ = layui.jquery,
        form = layui.form,
        laypage = layui.laypage;
    form.on('submit(findLogisticsAll)', function () {
      findLogisticsList(laypage)
      return false;
    });
    findLogisticsList(laypage);
  });

</script>
</body>
</html>