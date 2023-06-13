<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="utf-8">
  <title>订单页面</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/font_1468400228_1677577.css"/>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/font_72064_8d6mr7huygmn29.css"/>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/font_844587_t32m3dyr45.css"/>

  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/eevee-layout-677c65.css"/>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/vendor-b0dfc7.css"/>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/app-back-45d2ee.css"/>

  <script src="<%=request.getContextPath()%>/static/jsjar/jquery-3.1.0.js"></script>
  <script src="<%=request.getContextPath()%>/static/js/order/order.js"></script>
</head>
<body>
<div class="user-center" style="margin-top:0;height: auto;">
  <div class="component-standard-tab-container order-manage js-comp eve-component" data-comp-name="买家订单列表"
       data-comp-path="trade/buyer/order_manage">

    <div class="tab component-tab" data-type="switchable">
      <ul class="tab-navs clearfix">
        <li <c:if test="${coder.orderStatus eq ''}">class="active"</c:if> >
          <a href="<%=request.getContextPath()%>/client/OrderServlet?method=getOrder">我的订单</a>
        </li>
        <li <c:if test="${coder.orderStatus eq '2'}">class="active"</c:if>>
          <a href="<%=request.getContextPath()%>/client/OrderServlet?method=getOrderByStatus&orderStatus=2">
            待付款<span class="count"></span>
          </a>
        </li>
        <li <c:if test="${coder.orderStatus eq '4'}">class="active"</c:if>>
          <a href="<%=request.getContextPath()%>/client/OrderServlet?method=getOrderByStatus&orderStatus=4">
            待发货<span class="count"></span>
          </a>
        </li>
        <li <c:if test="${coder.orderStatus eq '5'}">class="active"</c:if>>
          <a href="<%=request.getContextPath()%>/client/OrderServlet?method=getOrderByStatus&orderStatus=5">
            待收货<span class="count"></span>
          </a>
        </li>
        <div class="js-old-link-container old-link-container">
          <a class="shop-old-link" href="http://shop.hisense.com/login.html" target="_blank">查看旧版商城</a>
        </div>
      </ul>
      <c:choose>
      <c:when test="${empty orderPage.list}">
        <table width="95%" align="center" cellpadding="0" cellspacing="0" class="noshop_tab">
          <tr>
            <td class="center-text" colspan="6">
              <img align="" src="<c:url value='/static/image/comimg/empty-my-cart-45ab59.png'/>" />
            </td>
              <%--<td>
                  <span class="spanEmpty" style="color: #d9161c;">您还没有购物</span>
              </td>--%>
          </tr>
          <tr>
            <td class="center-text" colspan="6">
              您还没有该类型订单订单，快去抢购吧~
            </td>
          </tr>
        </table>
      </c:when>

      <c:otherwise>
      <div class="tab-contents clearfix">
        <div data-role="content" class="tab-content">
          <div class="component-body" style="width:908px" id="order-body">
            <table class="table orders-table table-horizontal left-text js-order-table">
              <thead>
              <tr>
                <th class="item-table-th" width="468px">商品信息</th>
                <th width="128px">价格（元）</th>
                <th width="48px">数量</th>
                <th width="128px">订单总额</th>
                <th class="td-operation" width="128px">操作</th>
              </tr>
              </thead>

              <tbody class="orders-tbody js-shop-orders-tbody" >
              <c:forEach var="olist" items="${orderPage.list}">
                <tr class="order-info-tr">
                  <td class="left-text tr-info" width="400">
                                        <span class="order-id">订单编号：
                                            <a href="/buyer/order-detail?oid" target="_blank">${olist.oid}</a>
                                        </span>
                    <span class="vertical-bar">|</span>
                    <span style="margin-left: 20px">${olist.otime}</span>
                  </td>
                  <td class="order-info-status" width="500">
                    <c:if test="${olist.ostate == 1}">
                      <span>已完成</span>
                    </c:if>
                    <c:if test="${olist.ostate == 3}">
                      <span>已取消</span>
                    </c:if>
                    <c:if test="${olist.ostate == 4}">
                      <span>已付款</span>
                    </c:if>
                    <c:if test="${olist.ostate == 5}">
                      <span>已发货</span>
                    </c:if>
                    <c:if test="${olist.ostate == 6}">
                      <span>已评论</span>
                    </c:if>
                    <c:if test="${olist.ostate == 2}">
                      <span>待支付</span>
                      <!-- 买家订单操作-->
                      <a class="js-pay pay-order" href="/buyer/pre-pay?orderIds=" data-id="2008080004691313">立即付款</a>
                      <a href="<%=request.getContextPath()%>/client/OrderServlet?method=updateOrderByStatus&oid=${olist.oid}" class="" data-id="">取消订单</a>
                      <a class="js-refresh-order" data-id="2008080004691313" data-type="1">刷新订单</a>
                    </c:if>
                  </td>
                </tr>

                <tr class="order-tr" >
                  <td class="order-items" width="644">
                    <c:forEach var="orderItem" items="${olist.orderdetails}">
                      <div class="sku-order " data-id="2007100000025613">
                        <div class="sku-order-item order-item-info">
                          <div class="item-thumbnail ">
                            <a href="/items/3490" target="blank">
                              <img src="<%=request.getContextPath()%>/static/image/details/${orderItem.commodity.copicture}"
                                   width="58" height="58">
                            </a>
                          </div>
                          <div class="item-desc ">
                               <span class="item-desc-name">
                                   <a class="cutwords-two-line" href="/items/3490" target="blank">
                                       ${orderItem.commodity.coname}
                                   </a>
                               </span>
                            <span class="sku-attributes" data-attributes="&quot;[]&quot;">
                                   <a class="before-insert" href="/item/snapshot?skuOrderId=2007100000025613" target="blank">[交易快照]</a>
                            </span>
                            <span class="install-service-tag">普通配送</span>
                          </div>
                        </div>
                        <div class="currency left-text sku-order-subtotal-price order-item-info subtotal-price js-subtotal-price last"
                             data-ship="" data-fee="799900" data-quantity="${orderItem.onumber}">￥${orderItem.oactual}</div>
                        <div class="sku-order-count text-center order-item-info count last">
                            ${orderItem.onumber}
                        </div>
                      </div>
                    </c:forEach>
                  </td>

                  <td width="128">
                    <span class="currency highlight-red">￥${olist.otatol}</span>
                  </td>
                  <td class="order-status td-operation" width="128">
                    <div class="order-operation">
                      <a href="<c:url value='/client/OrderServlet?method=getOrderDetail&oid=${olist.oid }'/>" target="order">订单详情</a>
                      <div class="sku-order-operation order-item-info order-return white-space-normal last">
                        <!-- 买家子订单操作-->
                      </div>
                      <div class="sku-order-operation order-item-info order-return white-space-normal last">
                        <!-- 买家子订单操作-->
                      </div>
                    </div>
                  </td>
                </tr>

              </c:forEach>
              </tbody>

              <tfoot>
              <tr>
                <td colspan="6">
                  <div class="order-pagination pull-right" id="js-list-pagination" data-total="1">
                    <div class="pagination"><label class="total">共${orderPage.totalItemNum}项,</label><label class="size">每页显示:</label>
                      <div class="selectric-wrapper">
                        <div class="selectric-select" style="display:inline-block;">
                          <select tabindex="-1" id="form-pageSize" style="height: 30px;padding:2px 5px;font-size:15px;">
                            <option value="1" >1</option>
                            <option value="10">10</option>
                            <option value="20" >20</option>
                            <option value="30">30</option>
                            <option value="40">40</option>
                            <option value="50">50</option>
                          </select>
                        </div>
                          <%--<div class="selectric"><span class="label">20</span><b class="button">▾</b></div>
                          <div class="selectric-items" tabindex="-1">
                              <div class="selectric-scroll">
                                  <ul>
                                      <li data-index="0" class="">10</li>
                                      <li data-index="1" class="selected">20</li>
                                      <li data-index="2" class="">30</li>
                                      <li data-index="3" class="">40</li>
                                      <li data-index="4" class="last">50</li>
                                  </ul>
                              </div>
                          </div>
                              <input class="selectric-input" tabindex="0">
                          </div>--%>
                        <span class="current prev" rel="prev" id="${orderPage.prevPage}" data-pageSize="${orderPage.pageSize}">
                                                    <i class="icon-pokeball icon-pokeball-prev"></i>
                                                </span>
                        <span class="current" id="pageNo">${orderPage.pageNo}</span>
                        <span class="current next" rel="next" id="${orderPage.nextPage}" data-pageSize="${orderPage.pageSize}">
                                                    <i class="icon-pokeball icon-pokeball-next"></i>
                                                </span>
                        <div class="handler">
                          <input type="text" name="go-page" class="go-page">
                          <button class="btn" id="go-page" type="button" data-total="${orderPage.totalPageNum}">Go</button>
                        </div>

                      </div>
                    </div>
                  </div>
                </td>
              </tr>
              </tfoot>
            </table>
          </div>
          <div class="component-footer"></div>
        </div>
      </div>
    </div>
    </c:otherwise>
    </c:choose>
  </div>
</div>
</body>
</html>
