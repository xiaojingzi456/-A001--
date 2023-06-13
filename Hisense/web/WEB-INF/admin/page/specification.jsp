<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
  <title>Title</title>
  <title>后台管理</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/css/font.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/admin/css/xadmin.css">
  <script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-1.12.4.js"></script>
  <script src="<%=request.getContextPath()%>/static/admin/lib/layui/layui.js" charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/xadmin.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/expandCollapse.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/admin/js/specs.js"></script>
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
            <form class="layui-form layui-col-space5" id="addSpecsForm">
              <div class="layui-input-inline layui-show-xs-block">
                <input class="layui-input" placeholder="一级规格名" name="sname" required lay-verify="required"></div>
              <div class="layui-input-inline layui-show-xs-block">
                <button class="layui-btn" lay-submit lay-filter="addSpecs"><i class="layui-icon"></i>增加</button>
              </div>
            </form>
            <hr>
            <div class="layui-card-body layui-form-item">
              <table class="layui-table layui-form">
                <thead>
                <tr>
                  <th width="20">
                    序号
                  </th>
                  <th>ID</th>
                  <th>规格名</th>
                  <th width="270">操作</th>
                </thead>
                <tbody class="x-cate">
                <c:forEach items="${specsAll}" var="s" varStatus="vs">
                  <tr cate-id=${vs.index+1} fid='0'>
                    <td>
                        ${vs.count}
                    </td>
                    <td class="sid">${s.sid}</td>
                    <td>
                      <i class="layui-icon x-show" status='true'>&#xe623;</i>
                        ${s.sname}
                    </td>
                    <td class="td-manage">
                      <button data-method="notice" class="layui-btn layui-btn layui-btn-xs"
                              onclick="categoryEdit(this)">
                        <i
                                class="layui-icon">&#xe642;</i>编辑
                      </button>

                      <button class="layui-btn-danger layui-btn layui-btn-xs" onclick="category_del(this)"
                              href="javascript:;"><i class="layui-icon">&#xe640;</i>删除
                      </button>
                      <button class="layui-btn layui-btn-warm layui-btn-xs"
                              onclick="addSpecsTow(this)" id="caid">
                        <i class="layui-icon">&#xe642;</i>添加子栏目
                      </button>
                    </td>
                  </tr>
                  <c:forEach items="${specsTowAll}" var="sp" varStatus="cs">
                    <c:if test="${sp.stid==s.sid}">
                      <tr cate-id=${vs.index+1+cs.index+1} fid=${vs.index+1} class="categoryTow">
                        <td></td>
                        <td class="ctid">${sp.stid}</td>
                        <td>
                          &nbsp;&nbsp;&nbsp;&nbsp;
                            ${sp.stname}
                        </td>
                        <td class="td-manage">
                          <button class="layui-btn layui-btn layui-btn-xs" onclick="xadmin.open('编辑','admin-edit.jsp')">
                            <i
                                    class="layui-icon">&#xe642;</i>编辑
                          </button>
                          <button class="layui-btn-danger layui-btn layui-btn-xs" onclick="categoryTow_del(this)"
                                  href="javascript:;"><i class="layui-icon">&#xe640;</i>删除
                          </button>
                        </td>
                      </tr>
                    </c:if>
                  </c:forEach>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
