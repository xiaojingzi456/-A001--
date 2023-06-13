<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>提交订单</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/font_844587_t32m3dyr45.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/vendor-b0dfc7.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/eevee-layout-677c65.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/app-back-45d2ee.css"/>
    <script src="<%=request.getContextPath()%>/static/jsjar/jquery-3.1.0.js" type="text/javascript"
          charset="utf-8"></script>
    <script src="<%=request.getContextPath()%>/static/js/cart/cartsubmit.js" type="text/javascript"
          charset="utf-8"></script>
    <script src="<%=request.getContextPath()%>/static/js/cart/iPicker.min.js" type="text/javascript"
          charset="utf-8"></script>
    <script src="<%=request.getContextPath()%>/static/jsjar/template-web.js"></script>
</head>
<body>
<!-- 头部 -->
<jsp:include page="headlogin.jsp"/>

<div class="header-title-simple eve-component" data-comp-path="common/header_title_progress">
  <div>
    <p>
      订单确认
    </p>
  </div>
</div>
<div class="main-container" style="margin-bottom: 20px;">
  <div class="order-pre js-comp eve-component" data-comp-name="普通订单下单页" data-comp-path="trade/buyer/pre_order"><input
          id="js-o2o-shopid" type="hidden" name="shopId" value="">

    <div class="component-body">
      <div class="order-pre-body" data-user="10911216" data-currency="" data-name="17674606566">
        <div class="order-list-title">
          <span>选择收货地址</span>
        </div>
        <div class="address-list-new">
          <p class="address-more disappear" style="display: none;">
			<span class="pull-left">
				<a href="javascript:;" class="address-more-a js-address-more" data-replace-value="收起更多">
					展开更多
				</a>
			</span>
          </p>
          <%-- 地址模板引擎 --%>
          <script type="text/template" id="addresstemplate">
            {{if data}}
            {{each data value i}}
                <li class="trade-info-list " >
                  <div class="contacts-info">
                    <span class="contacts-name">{{value.aname}}</span>
                    <span class="contacts-mobile">{{value.aphone}}</span>
                    <span class="contacts-isdefault disappear">
                      {{if value.adefault==1}}
                        默认地址
                      {{/if}}
                      {{if value.adefault==0}}
                        <a href="javascript:void(0);" class="js-default-address" data-id="{{value.aid}}" data-toggle="confirm" data-title="设为默认？" data-event="set-default-address">设为默认地址</a>
                      {{/if}}
                    </span>
                  </div>
                  <div class="adress-info">
                    <span>{{value.aprovince}}{{value.acity}}{{value.aarea}}{{value.aspecific}}</span>
                  </div>
                  <div class="adress-operation disappear">
                    <span class="update-address"><a href="javascript:void(0);" data-id="{{value.aid}}" class="js-update-address">修改</a></span>
                    {{if value.adefault==0}}
                    <span class="delete-address operate-status">
                      <a class="js-delete-address" title="删除地址？" date-id="{{value.aid}}" data-content="删除地址" data-event="delete-address">删除</a>
                    </span>
                    {{/if}}
                  </div>
                  <div class="active-icon">
                    <i class="iconfont icon-ic-duigou"></i>
                  </div>
                </li>
                {{/each}}
                {{/if}}
            <div class="js-new-address"><i class="iconfont icon-xinjian" id="addToress" style="color:#777777;font-size:20px;margin-right:2px;"></i>新增收货地址</div>
          </script>
          <ul class="address-list-ul">

          </ul>

        </div>
        <div class="order-list-title">
          <span>商品详情</span>
        </div>
        <form id="js-cartsubmit-form" action="${pageContext.request.contextPath}/client/OrderServlet" class="" method="post">
        <div class="order-item">
          <input type="hidden" name="method" value="createOrder">
          <input type="hidden" name="aid" value="1">
          <input type="hidden" name="caids" value="${caids }"/>
          <input type="hidden" name="caids" value="${sum }"/>
          <table class="table table-horizontal center-text order-item-table" data-buyer="17674606566" data-buyer-id="10911216">
            <thead>
            <tr>
              <th class="left-text" width="660">商品信息</th>
              <th class="left-text" width="170">单价(元)</th>
              <th class="left-text" width="138">数量</th>
              <th class="left-text last-th-td" width="220">小计</th>
            </tr>
            </thead>
            <tbody>
            <tr data-shop="1" data-seller="3" class="shop-tr" >
            </tr>
            <c:forEach items="${cartList}" var="calist">
            <tr class="item-tr js-item-tr-3290 item-3283 sku-P1TE43EZTCNEB sku-3290 item-shop-1" >
              <td class="left-text item-title-re">
                <div class="line"></div>
                <div class="clearfix">
                  <div class="item-logo">
                    <a href="/items/3283">
                      <img  src="<%=request.getContextPath()%>/static/image/details/${calist.commodity.copicture}">

                    </a>
                  </div>
                  <div class="item-info-td">
                    <div class="item-description">
						<span>
						  <a href="/items/3283" class="js-item-name">${calist.commodity.comodel}${calist.commodity.coname}</a>
						</span>
                      <br>
                      <span class="sku-attributes">

                      </span>
                    </div>
                  </div>
                </div>
              </td>
              <td class="left-text">
                <span class="price" data-price="114900">￥${calist.commodity.coprice}</span>
              </td>
              <td class="left-text">
                <span class="count">x${calist.canumber}</span>
                <br>
                <span class="js-unenough-box badge hide">缺货</span>
              </td>
              <td class="last-th-td left-text">
                <span class="item-subtotal" data-price="">￥${calist.countPrice}</span>
              </td>
            </tr>
            <tr class="service-tr">
              <td colspan="4" class="install-service install-service-3283" data-item-id="3283" data-sku-id="3290"><span
                      class="service-label">
												物流配送
											</span>
                <div class="operator-div">
                  <div class="service js-select-install-service selected" data-is-install="false" data-sku-id="">
                    <div class="general-div border-div selected">
                      <div class="desc">
                        <span>普通配送</span>
                      </div>
                    </div>
                  </div>
                  <div class="service js-select-install-service" data-is-install="true" data-sku-id="">
                    <div class="install-div border-div">
                      <div class="desc">
                        <span>送装一体</span>
                      </div>
                    </div>
                  </div>
                </div>
                <i class="iconfont icon-tishi js-promotion-reminder"></i>
                <div class="install-service-reminder">
                  <span class="title">温馨提示</span>
                  <br>
                  <span class="text">· 选择“送装一体”后，商品将由您所在区域的海信服务站替您验货并签收，同时与您电话确认上门送货和安装的具体时间</span>
                  <br>
                  <span class="text">· 选择“普通配送”，商品将由物流直接配送至您家中，由您自行拨打4006-111-111预约安装。</span>
                </div>
              </td>
            </tr>
            <tr class="delay_tr delay_tr-3290 hide">
              <td colspan="4">
                <div class="js-delayservice-container delayservice-container">
                  <ul>
                    <li><span>增值保障</span></li>
                  </ul>
                </div>
              </td>
            </tr>
            </c:forEach>
            </tbody>
          </table>
        </div>
        <fieldset class="total-price-info">
          <table width="100%">
            <tbody data-shop="1" class="order-config shop-1">
            <tr class="first-tr">
              <th width="122">给商家留言</th>
              <td class="left-text" width="600">
                <div class="remark" data-shop="1">
                  <input name="remark" placeholder="留言信息，限制45字" maxlength="45">
                </div>
              </td>
              <th class="right-text" width="330"><span class="itemsCount">0</span>件商品，总金额：</th>
              <td class="right-text" width="136"><span class="should-pay-money price-small">￥${sum}
											</span></td>
            </tr>
            <tr class="second-tr" data-shop="1">
              <th class="left-text">订单优惠</th>
              <td class="left-text shopPromotionTd first-td">
                <div class="discountBox shopDiscount disabled">
					<span class="selectedDiscount">
						无优惠
						<i class="iconfont icon-ic-drop"></i>
					</span>
                  <ul class="discountList shop-pro-list" style="display: none;">
                    <li data-info="unuse">
						<span class="first-child">
                          <input type="radio" name="skuProRadio" class="input-radio js-select-info" checked="">
						</span>
                        <span class="last-child">
						  不使用
						</span>
                      <div class="grid-line"></div>
                    </li>
                  </ul>
                </div>

                <span class="mfq hide order-inline">*满返优惠券会在订单支付成功后打入账户中</span>
                <span class="mfxj hide order-inline">*返现金额会在确认收货后以退款形式返还</span>
              </td>
              <th class="right-text">订单优惠：</th>
              <td class="right-text">
                <span class="price price-small shopPromotionPrice" data-price="0">-￥0</span>
              </td>
            </tr>
            <tr class="third-tr">
              <th class="left-text">平台优惠</th>
              <td class="left-text globalPromotionTd first-td">
                <div class="discountBox globalDiscount disabled">
					<span class="selectedDiscount">无优惠
						<i class="iconfont icon-ic-drop"></i>
					</span>
                  <ul class="discountList shop-pro-list" style="display: none;">
                    <li data-info="unuse">
						<span class="first-child">
							<input type="radio" name="globalProRadio" class="input-radio js-select-info" checked="">
						</span>
                      <span class="last-child">不使用</span>
                      <div class="grid-line"></div>
                    </li>
                  </ul>
                </div>
              </td>
              <th class="right-text">平台优惠：</th>
              <td class="right-text">
                <span class="price price-small globalPromotionPrice" data-price="0">-￥0</span>
              </td>
            </tr>
            <tr class="fourth-tr">
              <th class="left-text">发票信息</th>
              <td class="left-text first-td">
                <div class="invoice-line">
                  <div class="invoice js-shop-invoice">
						<span class="invoiceInfo">
							<span class="js-invoice-info">
								<span class="invoice-type" >电子发票</span>
                            </span>
                            <a href="javascript:;" class="changeInvoice ">&nbsp;&nbsp;&nbsp;选择</a>
							<a href="javascript:;" class="js-comp js-add-invoice" data-comp-path="trade/common/pre_order_invoice">&nbsp;&nbsp;&nbsp;新增</a>
						</span>
                  </div>
                </div>
              </td>
              <th class="right-text"><i class="iconfont icon-zhuyi1 expressprice-icon"></i>运费：</th>
              <td class="right-text">
                <span class="price expressPrice" data-price="0">￥0</span>
              </td>
            </tr>
            <tr class="fifth-tr">
              <th class="left-text">收货地址</th>
              <td class="left-text address-info-td">
                <span class="receiver-address">
					<div class="tmp-address-detail">
						北京北京市东城区XXXXXXXXX
					</div>
					<div class="tmp-address-user">
						XXXXXXXXX(收)
						175****4562
					</div>
                </span>
              </td>
              <td class="right-text point-container disappear" colspan="2" style="display: table-cell;" maxscore="0"
                  reducefee="0.00">
                <label>
                  <input class="toggle-point input-checkbox js-toggle-point" type="checkbox" autocomplete="off" disabled="disabled">
                </label>
                <span class="left-text js-point-max-fee"> 可使用0积分抵扣0.00元
					<div class="js-point-unvalid-text disappear unvalid"></div>
                </span>
              </td>
            </tr>
            <tr class="sixth-tr">
              <td class="right-text" colspan="4">
                应付总额：
                <span class="pay-money">￥${sum}</span>
              </td>
            </tr>
            </tbody>
          </table>
        </fieldset>
        </form>
        <fieldset class="order-control">
          <button class="btn btn-primary side-button js-submit-order" type="button">提交订单</button>
        </fieldset>
      </div>
    </div>
  </div>

</div>
<div style="clear:both;"></div>

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
          <label class="address-detail-label control-label" style="" ><span class="required">*</span>具体地址</label>
          <textarea class="address-field itxt" id="streetaddress" name="detail" type="text" placeholder="请输入具体地址" pattern="^[\s\S]{5,50}$" maxlength="50" required=""></textarea>
          <span class="note-error"><i>×</i> 请输入5-50个字符</span>
          <span class="note-error-empty"><i>×</i> 必填 不得为空</span>
        </div>
        <input type="hidden" name="isDefault" value="">
        <div class="control-group">
          <label class="control-label" ><span class="required">*</span>收件人</label>
          <input class="address-field itxt" id="sitesid" name="receiveUserName" type="text" placeholder="请输入收件人" value="" required="">
          <span class="note-error"><i>×</i> 姓名为2-25个字符</span>
          <span class="note-error-empty"><i>×</i> 姓名为2-25个字符</span>
        </div>
        <div class="control-group">
          <label class="control-label"><span class="required">*</span>联系电话</label>
          <input class="address-field itxt" id="mobilephone" name="mobile" type="text" pattern="(?:^1[3456789]|^9[289]|^6[12456789])\d{9}$" placeholder="请输入手机号" value="" required="">
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
        <button class="btn btn-success btn-primary btn-medium" id="subaddress" type="button">确&nbsp;&nbsp;定</button>
      </div>
    </fieldset>
  </form>
</div>

<%-- 删除提示 --%>
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
</body>
</html>
