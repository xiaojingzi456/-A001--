<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <meta name="renderer" content="webkit|ie-comp|ie-stand">
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/css/font.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/css/xadmin.css">
  <script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-1.12.4.js"></script>
  <script src="<%=request.getContextPath()%>/static/admin/lib/layui/layui.js" charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/xadmin.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/specs.js"></script>
</head>
<body>
<div class="layui-fluid">
  <div class="layui-row">
    <form class="layui-form layui-form-pane">
      <div class="layui-form-item">
        <label class="layui-form-label">
          一级ID
        </label>
        <div class="layui-input-block">
          <input type="text" name="caid" id="caid" value=${categoryById.caid}  readonly autocomplete="off"
                 class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">
          一级名称
        </label>
        <div class="layui-input-block">
          <input type="text" name="caname" id="caname" value=${categoryById.caname}  autocomplete="off" disabled
                 class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label x-red">
          二级规格
        </label>
        <div class="layui-input-block">
          <input type="text" name="ctname" id="ctname" placeholder="请输入二级规格名称" autocomplete="off"
                 class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <div class="layui-input-block">
          <button class="layui-btn" lay-submit lay-filter="addSpecsTow">立即提交</button>
          <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>
