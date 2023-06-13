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
  <script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-1.12.4.js" charset="utf-8"></script>
  <script src="<%=request.getContextPath()%>/static/admin/lib/layui/layui.js" charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/xadmin.js"></script>
</head>
<body>
<div class="x-nav">
  <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()"
     title="刷新">
    <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
  </a>
</div>
<div class="layui-fluid">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md12">
      <div class="layui-card">
        <div class="layui-card-body ">
          <form class="layui-form layui-col-space5" id="orderFindAllForm">
            <div class="layui-input-inline layui-show-xs-block">
              <select name="ostate">
                <option value="">订单状态</option>
                <option value="7">未发货</option>
                <option value="6">已评价</option>
                <option value="5">已发货</option>
                <option value="4">已付款</option>
                <option value="3">已取消</option>
                <option value="2">待付款</option>
                <option value="1">已完成</option>
                <option value="0">已删除</option>
              </select>
            </div>
            <div class="layui-input-inline layui-show-xs-block">
              <input type="text" name="oid" placeholder="请输入订单号" autocomplete="off" class="layui-input"></div>
            <div class="layui-input-inline layui-show-xs-block">
              <button class="layui-btn" lay-submit="" lay-filter="orderFindAll">
                <i class="layui-icon">&#xe615;</i></button>
            </div>
          </form>
        </div>
        <div class="layui-card-body ">
          <table class="layui-table layui-form">
            <thead>
            <tr>
              <th>订单编号</th>
              <th>下单时间</th>
              <th>订单总额</th>
              <th>订单状态</th>
              <th>收货地址</th>
              <th>收件人</th>
              <th>联系电话</th>
<%--              <th>买家留言</th>--%>
              <th>操作</th>
            </tr>
            </thead>
            <tbody id="orderList"></tbody>
          </table>
        </div>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;"></fieldset>
        <div id="orderPage"></div>
      </div>
    </div>
  </div>
</div>
</body>
<script>
  layui.use(['form', 'jquery', 'laypage'], function () {
    var $ = layui.jquery,
        form = layui.form,
        laypage = layui.laypage;

    //条件查询d订单
    form.on('submit(orderFindAll)', function () {
      //条件查询后调用分页请求
      findOrderAll(laypage)
      return false;
    });

    //首次进入订单信息界面调用订单信息分页
    findOrderAll(laypage);
  });

  //将商品信息分页显示
  function findOrderAll(laypage) {
    $.ajax({
      url: "<%=request.getContextPath()%>/orderAdminServlet?method=findOrderAll",
      type: "POST",
      data: $("#orderFindAllForm").serialize(),
      dataType: "json",
      async: true,
      cache: false,
      success: function (result) {
        orderPageData(laypage, result);
      },
      error: function () {
        console.log("出错了");
      }
    });
  }

  //商品信息分页数据渲染
  function orderPageData(laypage, result) {
    laypage.render({
      elem: 'orderPage'
      , count: result.data.length
      , layout: ['prev', 'page', 'next', 'skip', 'refresh', 'limit', 'count']
      , jump: function (obj) {
        $("#orderList").html(function () {
          var arr = []
              , thisData = result.data.concat().splice(obj.curr * obj.limit - obj.limit, obj.limit);
          layui.each(thisData, function (index, item) {
                if (item.ostate === 7|| item.ostate === 4) {
                  arr.push('<tr class="layui-bg-green">');
                } else {
                  arr.push('<tr>');
                }
                arr.push('<td class="oid">' + item.oid + '</td>');
                arr.push('<td>' + item.otime + '</td>');
                arr.push('<td>' + item.otatol + '</td>');
                if (item.ostate === 1) {
                  arr.push('<td>已收货</td>');
                } else if (item.ostate === 2) {
                  arr.push('<td>待付款</td>');
                } else if (item.ostate === 3) {
                  arr.push('<td>已取消</td>');
                } else if (item.ostate === 4) {
                  arr.push('<td>已付款</td>');
                } else if (item.ostate === 5) {
                  arr.push('<td>已发货</td>');
                } else if (item.ostate === 6) {
                  arr.push('<td>已评价</td>');
                } else if (item.ostate === 7) {
                  arr.push('<td>未发货</td>');
                }
                arr.push('<td>' + (item.aprovince) + (item.acity) + (item.aarea) + (item.aspecific) + '</td>');
                arr.push('<td>' + item.aname + '</td>');
                arr.push('<td>' + item.aphone + '</td>');
                // arr.push('<td>' + item.remark + '</td>');
                arr.push('<td class="td-status">');
                if (item.ostate === 7 || item.ostate === 4) {
                  arr.push('<span class="layui-btn layui-btn-normal layui-btn-mini layui-bg-red" onclick="ship(this)" title="发货">发货</span>');
                }
                arr.push('<span class="layui-btn layui-btn-normal layui-btn-mini layui-bg-orange" onclick="detail(this)" title="详情">详情</span>');
                arr.push('</td>');
                arr.push('</tr>');
              }
          );
          return arr.join('');
        });
      }
    });
  }

  //处理订单发货
  function ship(obj) {
    var $oid = $(obj).parents("tr").find(".oid").text();
    $.ajax({
      url: "/Hisense/orderAdminServlet?method=findAddressAndOrderById",
      type: "POST",
      data: {"oid": $oid},
      dataType: "text",
      async: false,
      cache: false,
      success: function (result) {
        // if (result.flag) {
        //   layer.msg(result.errorMsg, {icon: 2, time: 1000, anim: 6})
        // } else {
        //   layer.msg(result.errorMsg, {icon: 1, time: 1000}, function () {
        //     xadmin.father_reload();
        //   })
        // }
        xadmin.open("订单发货", "/Hisense/controllerAdmin?method=orderShip")
      },
      error: function () {
        console.log("出错了");
      }
    })
  }

  //处理订单查看详情
  function detail(obj) {
    var $oid = $(obj).parents("tr").find(".oid").text();
    $.ajax({
      url: "/Hisense/orderAdminServlet?method=findOrderAndOrderDetailsAndCommodity",
      type: "POST",
      data: {"oid": $oid},
      dataType: "text",
      async: false,
      cache: false,
      success: function (result) {
        xadmin.open("订单详情", "/Hisense/controllerAdmin?method=orderDetails")
      },
      error: function (XMLHttpRequest, textStatus, errorThrown) {
        console.log(XMLHttpRequest);
        console.log(textStatus);
        console.log(errorThrown);
        console.log("出错了");
      }
    })
  }
</script>
</html>