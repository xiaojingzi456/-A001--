<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="utf-8">
  <title>订单详情页面</title>

  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/font_844587_t32m3dyr45.css"/>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/vendor-b0dfc7.css"/>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/eevee-layout-677c65.css"/>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/app-back-45d2ee.css"/>

  <script src="<%=request.getContextPath()%>/static/jsjar/jquery-3.1.0.js"></script>
  <script src="<%=request.getContextPath()%>/static/js/order/orderdetail.js"></script>

</head>
<body>
<div class="main-right user-center" style="margin-top:0;padding: 0;">
  <div class="order-detail js-comp eve-component" data-comp-name="买家订单详情" >

    <input type="hidden" class="order-detail-header" data-order-id="2007100000025513" data-order-type="1"
           data-status="-1"
           data-ship-type="0">
    <div class="component-body" style="width: 948px">
      <div class="order-detail-content order-detail-progress">
        <div class="order-progress-detail">
          <div class="order-status-text">
				<span>订单状态：
                  <span class="status-color red-status">
                    <c:choose>
                      <c:when test="${odList.ostate eq 1 }"><span>已收货</span></c:when>
                      <c:when test="${odList.ostate eq 2 }"><span>待支付</span></c:when>
                      <c:when test="${odList.ostate eq 3 }"><span>已取消</span></c:when>
                      <c:when test="${odList.ostate eq 4 }"><span>已付款</span></c:when>
                      <c:when test="${odList.ostate eq 5 }"><span>已发货</span></c:when>
                      <c:when test="${odList.ostate eq 6 }"><span>已评价</span></c:when>
                    </c:choose>

				  </span>
                </span>
          </div>
          <div class="cuttime-wrap hide">
            <div class="js-remain-time-container">
                <span class="span-block end-time" data-time="1597061804000">
                  还有<span class="remain-time">20时38分20秒</span>将自动关闭订单
                </span>
            </div>
          </div>
          <div class="operate-btn hide">
            <!-- 买家订单操作-->
            <a class="js-pay pay-order btn" data-href="/buyer/pre-pay?orderIds=2008090003788313&amp;ordertype=1&amp;totalPrice=17998&amp;totalPriceUnformated=1799800" data-id="2008090003788313">立即付款</a>
            <a class="delay-confirm" data-id="" data-event="confirm:order-cancel-buyer">取消订单</a>
            <a class="js-refresh-order delay-confirm" data-id="2008090003788313" data-type="1">刷新订单</a>
          </div>
        </div>
        <div class="progress order-progress ">
          <ol class="">
            <li class="progress-info ">
              <p class="progress-step-status active">1.提交订单</p>
            </li>
            <li class="progress-info ">
              <p class="progress-step-status ">2.付款成功</p>
            </li>
            <li class="progress-info ">
              <p class="progress-step-status ">3.已发货</p>
            </li>
            <li class="progress-info ">
              <p class="progress-step-status ">4.确认收货</p>
            </li>
            <li class="progress-info last">
              <p class="progress-step-status ">5.评价</p>
            </li>
          </ol>
          <ol class="red">
            <li class="progress-step step0 active">
              <i class="iconfont icon-tijiaodingdan"></i>
            </li>
            <li class="progress-step-line line1 "></li>
            <li class="progress-step step1 ">
              <i class="iconfont icon-fukuanchenggong"></i>
            </li>
            <li class="progress-step-line line2 "></li>
            <li class="progress-step step2 ">
              <i class="iconfont icon-yifahuo"></i>
            </li>
            <li class="progress-step-line line3 "></li>
            <li class="progress-step step3 ">
              <i class="iconfont icon-querenshouhuo"></i>
            </li>
            <li class="progress-step-line line4 "></li>
            <li class="progress-step step4 ">
              <i class="iconfont icon-pingjia"></i>
            </li>
          </ol>
        </div>
      </div>
      <div class="order-detail-content order-detail-others">
        <div class="order-extra-info" data-shop-id="1">
          <div class="order-item-info">
            <table class="table sku-orders left-text">
              <thead>
              <tr>
                <th class="first" width="468px">商品信息</th>
                <th class="center-text" width="128px">价格(元)</th>
                <th class="center-text" width="48px">数量</th>
                <th class="center-text" width="128px">商品优惠</th>
                <th class="center-text td-operation" width="128px">操作</th>
              </tr>
              </thead>
              <tbody class="sku-order-tbody">
            <tr class="order-info">
              <td colspan="5">订单号：${odList.oid} | ${odList.otime}</td>
            </tr>
            <c:forEach var="oitem" items="${odList.orderdetails}">
              <tr class="sku-order-tr">
                <td>
                  <div class="item-logo">
                    <a href="/items/3490" target="_blank">
                      <img src="<%=request.getContextPath()%>/static/image/details/${oitem.commodity.copicture}"
                           width="92" height="92">
                    </a>
                  </div>
                  <div class="item-description">
                    <div>
						<span>
							<a class="cutwords-two-line item-name" href="/items/3490" target="_blank"
                               title="【新品上市】">${oitem.commodity.coname}
                            </a>
						</span>
                    </div>
                    <div class="sku-attributes-div">
                      <span class="sku-attributes" data-attributes="&quot;[]&quot;"></span>
                    </div>
                    <div>
                      <span class="install-tag">普通配送</span>
                    </div>
                  </div>
                </td>
                <td class="sku-price currency center-text" data-fee="" data-gift="" data-quantity="${oitem.onumber}">${oitem.commodity.coprice}
                </td>
                <td class="center-text">${oitem.onumber}</td>
                <td class="center-text">
                  <span class="order-discount">¥0.00</span>
                </td>
                <td class="center-text operation-wrap">
                  <!-- 买家子订单操作-->
                </td>
              </tr>
            </c:forEach>
            </tbody>
            </table>
          </div>
          <div class="order-buyer-info">
            <div class="common-single-tab">
              收货信息
            </div>
            <div class="content-left">
              <div class="order-detail-group">
                <span class="first">收货地址：${odList.address.aname} ${odList.address.aphone}
                      ${odList.address.aprovince}${odList.address.acity}${odList.address.aarea}${odList.address.aspecific}
                </span>
              </div>
              <div class="order-detail-group order-detail-address-group">
                <span>固定电话：${odList.address.atelephone}</span>
              </div>
              <div class="order-detail-group">
                <span>邮政编码：${odList.address.apostcode}</span>
              </div>
              <div class="order-detail-group no-pt">
                <span class="buyer-note-label">买家留言：</span>
                <span class="buyer-note"><c:if test="${odList.remark !=nul}">
                    ${odList.remark}
                  </c:if>
                  无
                </span>
              </div>
            </div>
          </div>
          <div style="margin-bottom: 0px;" class="order-invoice-info clearfix">
            <div class="common-single-tab">
              发票信息
            </div>
            <div class="left clearfix">
              <div class="invoice-content">
                <div class="order-detail-group"><span class="first">发票状态：未开具</span></div>
                <div class="order-detail-group">
                  <span>发票类型：普通电子发票 - 个人</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <span>发票抬头：个人</span>
                  <span class="same-row-space">发票内容：商品明细</span>
                </div>
                <div class="order-detail-group hide">
                  <span>企业税号：</span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="order-payment">
          <div class="order-payment-info clearfix">
            <div class="payment-info">
            </div>
            <div class="order-amount-info">
              <div class="amount-info">
                <label>商品总额：</label>
                <span class="info-value">¥<span class="shop-order-origin-fee">${odList.otatol}</span></span>
              </div>
              <div class="amount-info">
                <label>运费金额：</label>
                <span class="info-value">¥0.00</span>
              </div>
              <div class="amount-info">
                <label>积分抵扣：</label>
                <span class="info-value">¥0.00</span>
              </div>
              <div class="amount-info">
                <label class="real-pay">实付金额：</label>
                <span class="info-value actual-amount currency real-pay-text">
					¥${odList.otatol}
				</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
