<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="utf-8">
  <title></title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/home/home.css"/>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/home/personal.css"/>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jQuery/jquery-1.12.4.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/home/personal.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/home/home.js"></script>

  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/font_844587_t32m3dyr45.css"/>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/vendor-b0dfc7.css"/>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/eevee-layout-677c65.css"/>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/app-back-45d2ee.css"/>

</head>
<body>
<jsp:include page="headmenu.jsp"/>
<div id="p">
  <div class="p-w-1190">
    <div class="ac-s">
      <ul>
        <li><a href="<%=request.getContextPath()%>/controller?method=home" style="color: #181818">首页&nbsp;&nbsp;></a></li>
        <li><span>&nbsp;&nbsp;个人中心</span></li>
      </ul>
    </div>
  </div>
  <div class="clearfloat"></div>
  <div class="p-w-1190">
    <div class="p-l-631">
      <div class="p-l-628">
        <ul class="u-t-c" id="u-t-c">
          <li>
            <span style="font-size: 16px;font-weight: 600">我的交易</span>
            <ul>
              <li><a href="<%=request.getContextPath()%>/client/OrderServlet?method=getOrder" id="order" target="order">我的订单</a></li>
            </ul>
            <span style="font-size: 16px;font-weight: 600">我的账户</span>
            <ul>
              <li><a href="<%=request.getContextPath()%>/controller?method=account" id="acc" target="account">账户设置</a></li>
              <li><a href="<%=request.getContextPath()%>/controller?method=getAddress" id="addre" target="address">收货地址</a></li>
              <li><a href="<%=request.getContextPath()%>/controller?method=cancellation" id="cancellation" target="cancellation">账户注销</a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
    <div class="p-r-948 " id="iframe">
      <iframe id="external-frame" name="buyer" src="<%=request.getContextPath()%>/controller?method=buyer" onload="setIframeHeight(this)"
              scrolling="no" width="100%"
              frameborder="0"></iframe>
    </div>
    <div class="clearfloat"></div>
  </div>
</div>

<%--
<div class="modal address-modal hide" style="z-index: 999; top: 40px; left: 474px;">
  <div class="modal-header">
    <h2 id="address-head">新增收货地址</h2>
    <span class="close"><i class="iconfont icon-ic-close"></i></span>
  </div>
  <form class="form form-aligned address-form " id="address-form" data-id="" novalidate="true">
    <fieldset>
      <div class="address-edit-form modal-body" >
        <input type="hidden" name="type" value="1">
        <div class="control-group">
          <label class="control-label" ><span class="required">*</span>所在地区</label>
          <div class="address-select-group">
            <div class="demo" id="demo-4"></div>
          </div>
        </div>
        <div class="control-group">
          <label class="address-detail-label control-label" ><span class="required">*</span>具体地址</label>
          <textarea class="address-field" id="street-address" name="detail" type="text" placeholder="请输入具体地址" pattern="^[\s\S]{5,50}$" maxlength="50" required=""></textarea>
          <span class="note-error"><i>×</i> 请输入5-50个字符</span>
          <span class="note-error-empty"><i>×</i> 必填 不得为空</span>
        </div>
        <input type="hidden" name="isDefault" value="">
        <div class="control-group">
          <label class="control-label" ><span class="required">*</span>收件人</label>
          <input class="address-field" id="sites-id" name="receiveUserName" type="text" placeholder="请输入收件人" value="" maxlength="25" pattern="^.{2,25}$" required="">
          <span class="note-error"><i>×</i> 姓名为2-25个字符</span>
          <span class="note-error-empty"><i>×</i> 姓名为2-25个字符</span>
        </div>
        <div class="control-group">
          <label class="control-label" for="mobile-phone"><span class="required">*</span>联系电话</label>
          <input class="address-field" id="mobile-phone" name="mobile" type="text" pattern="(?:^1[3456789]|^9[289]|^6[12456789])\d{9}$" placeholder="请输入手机号" value="" required="">
          <span class="note-error"><i>×</i> 请输入正确的手机号</span>
          <span class="note-error-empty"><i>×</i> 手机号不得为空</span>
        </div>
        <div class="control-group">
          <label class="control-label" for="phone">固定电话</label>
          <input class="address-field" id="phone" name="phone" type="text" placeholder="请输入固定电话" pattern="(^\d{3,4}-\d{7,8})$|(^\(\d{3,4}\)\d{7,8})$" value="">
          <span class="note-error"><i>×</i> 请输入正确的固定电话</span>
        </div>

        <div class="control-group">
          <label class="control-label" for="post-code">邮编</label>
          <input class="address-field" id="post-code" name="postcode" type="text" placeholder="请输入邮政编码" maxlength="6" pattern="^\d{6}$" value="">
          <span class="note-error"><i>×</i> 邮编必须为6位数字</span>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-info btn-medium close">取&nbsp;&nbsp;消</button>
        <button class="btn btn-success btn-primary btn-medium" id="suborder" type="button">确&nbsp;&nbsp;定</button>
      </div>
    </fieldset>
  </form>
</div>

&lt;%&ndash; 删除提示 &ndash;%&gt;
<div class="modal modal-dialog clearfix hide" id="407753" data-id="407753" data-title="删除地址？" style="z-index: 999; top: 281px; left: 625px;">
  <div class="modal-dialog-icon ">
    <i class="icon-pokeball icon-pokeball-notify-warning warning-status"></i>
  </div>
  <div class="modal-dialog-message">
    <h3>删除地址？</h3>
    <p>删除地址</p>
    <div class="modal-controls">
      <button class="btn btn-info close">
        取消
      </button>
      &nbsp;
      <button class="btn btn-minor submit" id="delAddress">
        确定
      </button>
    </div>
  </div>
</div>
--%>

</body>
</html>
