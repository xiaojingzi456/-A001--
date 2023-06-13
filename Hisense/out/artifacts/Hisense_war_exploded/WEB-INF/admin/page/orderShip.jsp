<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/xcity.js"></script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>订单发货信息</legend>
</fieldset>
<div class="layui-fluid">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md12">
      <div class="layui-card">
        <div class="layui-card-body ">
          <form class="layui-form layui-col-md12  layui-form-pane" id="orderShipForm">
            <div class="layui-form-item">
              <label class="layui-form-label">订单ID</label>
              <div class="layui-input-block">
                <input type="text" name="oid" readonly lay-verify="required" value="${addressAndOrder.oid}"
                       autocomplete="off"
                       class="layui-input">
              </div>
            </div>
            <div class="layui-form-item x-city" id="start">
              <label class="layui-form-label">收货地址</label>
              <div class="layui-input-inline">
                <select name="province" disabled lay-filter="province">
                  <option value="">请选择省</option>
                </select>
              </div>
              <div class="layui-input-inline">
                <select name="city" disabled lay-filter="city">
                  <option value="">请选择市</option>
                </select>
              </div>
              <div class="layui-input-inline">
                <select name="area" disabled lay-filter="area">
                  <option value="">请选择县/区</option>
                </select>
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">详细地址</label>
              <div class="layui-input-block">
                <input type="text" name="aspecific" id="aspecific" disabled lay-verify="required" autocomplete="off"
                       placeholder="请输入收货详细地址"
                       class="layui-input" value="${addressAndOrder.aspecific}">
              </div>
            </div>
            <div class="layui-form-item x-city" id="end">
              <label class="layui-form-label">发货地址</label>
              <div class="layui-input-inline">
                <select name="ldprovince" lay-filter="province">
                  <option value="">请选择省</option>
                </select>
              </div>
              <div class="layui-input-inline">
                <select name="ldcity" lay-filter="city">
                  <option value="">请选择市</option>
                </select>
              </div>
              <div class="layui-input-inline">
                <select name="ldarea" lay-filter="area">
                  <option value="">请选择县/区</option>
                </select>
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">详细地址</label>
              <div class="layui-input-block">
                <input type="text" name="ldeliver" lay-verify="required"
                       autocomplete="off"
                       placeholder="请输入发货详细地址"
                       class="layui-input">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">联系电话</label>
              <div class="layui-input-block">
                <input type="text" name="lphone" lay-verify="required"
                       autocomplete="off"
                       placeholder="请输入发货人联系电话"
                       class="layui-input">
              </div>
            </div>
            <div class="layui-form-item x-city" id="logistics">
              <label class="layui-form-label">物流公司</label>
              <div class="layui-input-inline">
                <select name="lexpress" lay-verify="required">
                  <option value="">请选择物流</option>
                  <option value="顺风">顺风</option>
                  <option value="申通">申通</option>
                  <option value="圆通">圆通</option>
                  <option value="中通">中通</option>
                  <option value="韵达">韵达</option>
                </select>
              </div>
            </div>
            <button class="layui-btn" lay-submit="" lay-filter="orderShip">
              立即提交
            </button>
          </form>
        </div>
        <hr>
      </div>
    </div>
  </div>
</div>
<script>
  layui.use(['form', 'code'], function () {
    form = layui.form;
    layui.code();
    var str = '${addressAndOrder.aprovince}';
    var province = str.substring(0, 2);
    $('#start').xcity(province, '${addressAndOrder.acity}', '${addressAndOrder.aarea}');
    $('#end').xcity('湖南', '株洲市', '荷塘区');

    //条件查询d订单
    form.on('submit(orderShip)', function () {
      $.ajax({
        url: "/Hisense/orderAdminServlet?method=updOrderById",
        type: "POST",
        data: $("#orderShipForm").serialize(),
        dataType: "json",
        async: true,
        cache: false,
        success: function (result) {
          if (result.flag) {
            layer.msg(result.errorMsg, {icon: 2, time: 1000, anim: 6})
          } else {
            layer.msg(result.errorMsg, {icon: 1, time: 1000}, function () {
              xadmin.father_reload();
            })
          }
        },
        error: function (result, errorMsg) {
          console.log(errorMsg);
        }
      })
      return false;
    });
  });
</script>
</body>
</html>
