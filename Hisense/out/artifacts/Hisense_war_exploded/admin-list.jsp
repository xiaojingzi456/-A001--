<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="utf-8">
  <title>Layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/lib/layui/css/layui.css">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<div class="demoTable">
  搜索ID：
  <div class="layui-inline">
    <input class="layui-input" name="id" id="demoReload" autocomplete="off">
  </div>
  <button class="layui-btn" data-type="reload">搜索</button>
</div>

<table class="layui-hide" id="LAY_table_user" lay-filter="user"></table>


<script src="<%=request.getContextPath()%>/static/admin/lib/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
  layui.use('table', function(){
    var table = layui.table;

    //方法级渲染
    table.render({
      elem: '#LAY_table_user'
      ,url: '/Hisense/admin?method=adminList1'
      ,limit:1
      ,limits:[1,2,4,8]
      , cols: [[//列表数据
        //unresize:是否禁用拖拽框列，sort:是否允许排序，edit：编辑单元格
        {type: 'checkbox', fixed: 'left'}
        , {field: 'aid', title: 'ID', sort: true, align: 'center'}
        , {field: 'aname', title: '用户名', align: 'center'}
        , {field: 'atelephone', title: '手机号码', align: 'center'}
        , {field: 'asex', title: '性别', sort: true, align: 'center'}
        , {field: 'aintroduce', title: '简介', align: 'center'}
        , {
          field: 'arole', title: '角色', sort: true, templet: function (r) {
            return r.arole === 1 ? '超级管理员' : '管理员';
          }, align: 'center'
        }
        , {
          field: 'astate', title: '状态', templet: function (r) {
            return r.astate === 1 ? '已启用' : '已冻结';
          }, align: 'center'
        }
        , {field: 'lock', title: '是否锁定', templet: '#checkboxTpl', align: 'center', unresize: true}
      ]]
      ,id: 'testReload'
      ,page: true
      ,height: 310
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

    var $ = layui.$, active = {
      reload: function(){
        var demoReload = $('#demoReload');

        //执行重载
        table.reload('testReload', {
          page: {
            curr: 1 //重新从第 1 页开始
          }
          ,where: {
              aid: demoReload.val()
          }
        }, 'data');
      }
    };

    $('.demoTable .layui-btn').on('click', function(){
      var type = $(this).data('type');
      active[type] ? active[type].call(this) : '';
    });
  });
</script>

</body>
</html>