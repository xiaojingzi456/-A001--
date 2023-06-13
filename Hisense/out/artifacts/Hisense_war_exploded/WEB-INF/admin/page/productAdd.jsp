<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">
<head>
  <title>Title</title>
  <title>后台管理</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/css/font.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/css/xadmin.css">
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/lib/layui/layui.js"
          charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/xadmin.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/product.js"></script>
</head>
<body>
<div class="layui-anim layui-anim-upbit">
  <div class="x-nav">
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()"
       title="刷新">
      <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
    </a>
  </div>
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-body ">
            <blockquote class="layui-elem-quote">商品上新</blockquote>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
              <legend>添加商品基本信息</legend>
            </fieldset>
            <form class="layui-form layui-form-pane">
              <div class="layui-form-item">
                <label class="layui-form-label">商品型号</label>
                <div class="layui-input-block">
                  <input type="text" name="comodel" id="comodel" lay-verify="required" autocomplete="off"
                         placeholder="请输入商品型号"
                         class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">商品名称</label>
                <div class="layui-input-block">
                  <input type="text" name="coname" id="coname" lay-verify="required" autocomplete="off"
                         placeholder="请输入商品名称"
                         class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">商品原价</label>
                <div class="layui-input-inline">
                  <input type="text" name="disprice" id="disprice" lay-verify="required|prc" placeholder="请输入商品原价"
                         autocomplete="off"
                         class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">商品现价</label>
                <div class="layui-input-inline">
                  <input type="text" name="coprice" id="coprice" lay-verify="required|prc" placeholder="请输入商品现价"
                         autocomplete="off"
                         class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">商品库存</label>
                <div class="layui-input-inline">
                  <input type="text" name="snumber" id="snumber" lay-verify="required|prc" placeholder="请输入商品库存"
                         autocomplete="off"
                         class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">商品类别</label>
                <div class="layui-input-inline">
                  <select name="category" class="category" lay-filter="category" lay-verify="required">
                    <option value="">请选择一级类别</option>
                    <c:forEach items="${category}" var="ca" varStatus="vs">
                      <option value="${ca.caid}">${ca.caname}</option>
                    </c:forEach>
                  </select>
                </div>
                <div class="layui-input-inline">
                  <select name="categoryTow" id="categoryTow" class="categoryTow" lay-verify="required"></select>
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">商品规格</label>
                <div class="layui-input-inline">
                  <select name="specs" class="specs" lay-filter="specs" lay-verify="required">
                    <option value="">请选择一级规格</option>
                    <c:forEach items="${specsAll}" var="sp" varStatus="vs">
                      <option value="${sp.sid}">${sp.sname}</option>
                    </c:forEach>
                  </select>
                </div>
                <div class="layui-input-inline">
                  <select name="specsTow" id="specsTow" class="specsTow" lay-verify="required"></select>
                </div>
              </div>
              <div class="layui-upload">
                <button type="button" class="layui-btn" id="commodity">上传图片</button>
                <div class="layui-upload-list">
                  <img class="layui-upload-img" id="copicture" style="width: 100px;height: 100px">
                  <p id="demoText"></p>
                </div>
              </div>
              <div class="layui-form-item">
                <%--                lay-submit="" lay-filter="addProduct"--%>
                <button class="layui-btn" lay-submit="" lay-filter="addProduct" id="addProducts">
                  立即提交
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
  layui.use(['form', 'layer', 'upload'],
      function () {
        var $ = layui.jquery
            , upload = layui.upload
            , form = layui.form;

        //自定义验证规则
        form.verify({
          prc: [/^[0-9]*[1-9][0-9]*$/, '价格输入有误']
        });

        //类别二级
        form.on("select(category)", function () {
          var $optionstring = "";
          var $category = $(".category").val();
          <c:forEach items="${categoryTow}" var="c">
          if ($category === "${c.caid}") {
            $optionstring += "<option name='ctid' id='ctid' value='${c.ctid}'>${c.ctname}</option>";
          }
          </c:forEach>
          $(".categoryTow").html("  <option value=''selected>请选择二级类别</option>" + $optionstring);
          form.render('select');
        });

        //规格二级
        form.on("select(specs)", function () {
          var optionstringtow = "";
          var specs = $(".specs").val();
          <c:forEach items="${specsTowAll}" var="s">
          if (specs === "${s.sid}") {
            optionstringtow += "<option name='stid' value='${s.stid}'>${s.stname}</option>";
          }
          </c:forEach>
          $(".specsTow").html("  <option value=''selected>请选择二级规格</option>" + optionstringtow);
          form.render('select');
        });

        //文件上传表单监听
        form.on('submit(addProduct)', function () {
          return false;
        });

        //文件上传
        var uploadInst = upload.render({
          elem: '#commodity'
          , url: '/Hisense/commodity?method=addCommodity'
          , field: 'copicture'
          , accept: 'images'
          , auto: false
          , bindAction: '#addProducts'
          , before: function (obj) {
            this.data = {
              'comodel': $("#comodel").val()
              , 'coname': $("#coname").val()
              , 'coprice': $("#coprice").val()
              , 'disprice': $("#disprice").val()
              , 'snumber': $("#snumber").val()
              , 'ctid': $("#categoryTow option:selected").val()
              , 'stid': $("#specsTow option:selected").val()
            }
            this.url = '/Hisense/commodity?method=addCommodity&coname=' + $("#coname").val();
          }
          , choose: function (obj) {
            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
              $('#copicture').attr('src', result); //图片链接（base64）
            });
          }
          , done: function (res) {
            if (res.flag) {
              layer.msg(res.errorMsg, {icon: 2, time: 1000, anim: 6});
            } else {
              layer.msg(res.errorMsg, {icon: 1, time: 1000}, function () {
                xadmin.father_reload();
              });
            }
          }
          , error: function () {
            //演示失败状态，并实现重传
            var demoText = $('#demoText');
            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
            demoText.find('.demo-reload').on('click', function () {
              uploadInst.upload();
            });
          }
        });
      });
</script>
</body>
</html>
