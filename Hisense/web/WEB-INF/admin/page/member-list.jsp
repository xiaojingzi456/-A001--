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
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/static/admin/lib/layui/layui.js" charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/xadmin.js"></script>
  <script src="<%=request.getContextPath()%>/static/admin/js/myAdmin.js" charset="utf-8"></script>
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
            <%--用户数据信息渲染--%>
            <table class="layui-hide" id="user" lay-filter="user"></table>
            <%--批量冻结或启用账号--%>
            <script type="text/html" id="toolbarDemo">
              <div class="layui-btn-container">
                <button class="layui-btn layui-btn-sm layui-bg-red" lay-event="freezeBatch">
                  <i class="layui-icon">&#xe640;</i>
                  批量冻结
                </button>
                <button class="layui-btn layui-btn-sm" lay-event="batchEnable">
                  <i class="layui-icon">&#xe609;</i>
                  批量启用
                </button>
              </div>
            </script>
            <%--冻结用户账号--%>
            <script type="text/html" id="checkboxTpl">
              <input type="checkbox" lay-event="ckState" name="lock" value="{{d.uid}}" title="锁定" lay-filter="lockDemo"
                     {{
                     d.ustate== 0
                     ? 'checked' : '' }}>
            </script>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
  layui.use(['layer', 'jquery', 'form', 'table'], function () {
    var table = layui.table
        , form = layui.form
        , $ = layui.jquery
        , layer = layui.layer;
    var tableIns = table.render({
      elem: '#user'//渲染目标对象
      , id: 'userInfo'
      , url: '/Hisense/admin?method=memberList'//数据接口
      , method: 'POST'//数据提交方式
      , toolbar: '#toolbarDemo'
      , title: '管理员数据表格'//数据导出额标题
      , cellMinWidth: 130
      , page: true//是否启用分页
      , cols: [[{type: 'checkbox', fixed: 'left'}
        , {field: 'uid', title: 'ID', sort: true, align: 'center'}
        , {field: 'uname', title: '用户名', align: 'center'}
        , {field: 'uphone', title: '手机号码', align: 'center'}
        , {field: 'usex', title: '性别', sort: true, align: 'center'}
        , {field: 'uemail', title: '邮箱', align: 'center'}
        , {
          field: 'ustate', title: '状态', templet: function (r) {
            return r.ustate === 1 ? '已启用' : '已冻结';
          }, align: 'center'
        }
        , {field: 'lock', title: '是否锁定', templet: '#checkboxTpl', align: 'center', unresize: true}]]
      , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
        var result;
        if (this.page.curr) {
          result = res.data.slice(this.limit * (this.page.curr - 1), this.limit * this.page.curr);
        } else {
          result = res.data.slice(0, this.limit);
        }
        return {
          "code": 0, //解析接口状态
          "msg": res.errorMsg, //解析提示文本
          "count": res.data.length, //解析数据长度
          "data": result//解析数据列表
        };
      }
    });

    //监听锁定操作
    form.on('checkbox(lockDemo)', function (obj) {
      layer.tips(this.name + '：' + obj.elem.checked, obj.othis);
      console.log(obj.elem.checked);
      var $ustate = obj.elem.checked ? "0" : "1";
      console.log($ustate);
      $.ajax({
        url: "/Hisense/admin?method=modifyUserState",
        type: "POST",
        data: {"ustate": $ustate, "uid": obj.value},
        dataType: "json",
        success: function (result) {
          if (result.flag) {
            layer.msg(result.errorMsg, {icon: 2, time: 1000, anim: 6})
          } else {
            layer.msg(result.errorMsg, {icon: 1, time: 1000}, function () {
              tableIns.reload();
            })
          }
        }
      })
    });

    //监听复选框
    table.on('checkbox(user)', function (obj) {
      console.log(obj.checked); //当前是否选中状态
      console.log(obj.data); //选中行的相关数据
      console.log(obj.data.uid);
      console.log(obj.type); //如果触发的是全选，则为：all，如果触发的是单选，则为：one
      //发送ajax请求
    });

    //头工具栏事件
    table.on('toolbar(user)', function (obj) {
      var checkStatus = table.checkStatus(obj.config.id);
      console.log(checkStatus);
      var data = checkStatus.data;
      var $uid = [];
      $.each(data, function (index, item) {
        $uid.push(item.uid);
      });
      switch (obj.event) {
        case 'freezeBatch':
          updUserState(0, $uid, tableIns)
          break;
        case 'batchEnable':
          updUserState(1, $uid, tableIns)
          break;
      }
    });
  });

  // 批量修改用户在状态
  function updUserState(state, uid, tableIns) {
    $.ajax({
      url: "/Hisense/admin?method=updUserState",
      type: "POST",
      data: {"ustate": state, "uid": uid},
      dataType: "json",
      async: true,
      cache: false,
      success: function (result) {
        if (result.flag) {
          layer.msg(result.errorMsg, {icon: 2, time: 1000, anim: 6})
        } else {
          layer.msg(result.errorMsg, {icon: 1, time: 1000}, function () {
            tableIns.reload();
          });
        }
      }
    });
  }
</script>
</body>
</html>