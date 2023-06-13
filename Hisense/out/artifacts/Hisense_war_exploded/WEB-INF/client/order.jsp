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
<div class="user-center" style="margin-top:0;">
    <div class="component-standard-tab-container order-manage js-comp eve-component" data-comp-name="买家订单列表"
         data-comp-path="trade/buyer/order_manage">
        <c:choose>
            <c:when test="${empty orderList}">
                <table width="95%" align="center" cellpadding="0" cellspacing="0" class="noshop_tab">
                    <tr>
                        <td align="right">
                            <img align="top" src="<c:url value='/static/image/comimg/empty-my-cart-45ab59.png'/>" />
                        </td>
                        <td>
                            <span class="spanEmpty" style="color: #d9161c;">您还没有购物</span>
                        </td>
                    </tr>
                </table>
            </c:when>

        <c:otherwise>
        <div class="tab component-tab" data-type="switchable">
            <ul class="tab-navs clearfix">
                <li class="active">
                    <a href="/buyer/order">我的订单</a>
                </li>
                <li class="">
                    <a href="/buyer/order?statusStr=0">
                        待付款<span class="count"></span>
                    </a>
                </li>
                <li class="">
                    <a href="/buyer/order?statusStr=1">
                        待发货<span class="count"></span>
                    </a>
                </li>
                <li class="">
                    <a href="/buyer/order?statusStr=2">
                        待收货<span class="count"></span>
                    </a>
                </li>
                <div class="js-old-link-container old-link-container">
                    <a class="shop-old-link" href="http://shop.hisense.com/login.html" target="_blank">查看旧版商城</a>
                </div>
            </ul>
            <div class="tab-contents clearfix">
                <div data-role="content" class="tab-content">
                    <div class="component-body" style="width:908px" id="order-body">
                        <div id="component-filter" class="filter-wrap" style="margin-top: 20px">
                            <form id="order-search" action="<%=request.getContextPath()%>/client/OrderServlet" class="form js-standard-filter-form" novalidate="true">
                                <fieldset class="clearfix">
									<span class="span-ib fl">
										<label>订单号:</label>
										<input class="order-input" type="text" name="oid" value="" placeholder="请输入订单号查询" pattern="^[1-9]\d{0,15}$"
                                             maxlength="16" aria-label="请输入订单号查询">
                                        <button type="submit" class="btn btn-secondary btn-custom">查询</button>
                                    </span>
                                    <span class="span-ib fr">
                                        <label>订单日期:</label>
                                        <div class="selectric-wrapper">
                                            <div class="selectric-select">
                                            <select name="orderTime" id="date-select-dropdown" tabindex="-1" style="height: 30px;padding:2px 5px;font-size:15px;">
                                                <option value="">请选择</option>
                                                <option value="1">最近三个月</option>
                                                <option value="2">最近六个月</option>
                                                <option value="3">2022</option>
                                                <option value="4">2019</option>
                                                <option value="5">2018</option>
                                            </select></div>
                                            <%--<div class="selectric"><span class="label">请选择</span><b class="button">▾</b></div>
                                            <div class="selectric-items" tabindex="-1">
                                                <div class="selectric-scroll">
                                                    <ul>
                                                        <li data-index="0" class="selected">请选择</li>
														<li data-index="1" class="">最近三个月</li>
                                                        <li data-index="2" class="">最近六个月</li>
                                                        <li data-index="3" class="">2022</li>
                                                        <li data-index="4" class="">2019</li>
                                                        <li data-index="5" class="last">2018</li>
                                                    </ul>
                                                </div>
                                            </div>--%>
                                            <input class="selectric-input" tabindex="0">
                                        </div>
                                        <input name="method" type="hidden" value="getOrder">
                                        <input name="pageSize" type="hidden" value="10">

                                        <input name="startAt" type="hidden">
                                        <input name="endAt" type="hidden">
                                        <input name="dateId" type="hidden">
                                    </span>
                                    <input type="hidden" name="statusStr" value="">
                                    <span class="span-ib fr">
                                        <label>订单状态</label>
                                        <div class="selectric-wrapper selectric-select selectric-trade-status-select">
                                            <div class="selectric-select">
                                                <select class="select trade-status-select" name="orderStatus" tabindex="-1" style="height: 30px;padding:2px 5px;font-size:15px;">
                                                    <option value="" selected="">全部</option>
                                                    <option value="1">已收货</option>
                                                    <option value="2">申请售后</option>
                                                    <option value="3">已退款</option>
                                                    <option value="4">已取消</option>
                                                    <option value="5">超时关闭</option>
                                                </select>
                                            </div>
                                            <input class="selectric-input" tabindex="0">
                                        </div>
                                    </span>
                                </fieldset>
                            </form>
                        </div>
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
                            <c:forEach var="olist" items="${orderList}">
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
                                        <div class="pagination"><label class="total">共1项,</label><label class="size">每页显示:</label>
                                            <div class="selectric-wrapper">
                                                <div class="selectric-select" style="display:inline-block;">
                                                    <select tabindex="-1" id="form-pageSize" style="height: 30px;padding:2px 5px;font-size:15px;">
                                                        <option value="10">10</option>
                                                        <option value="20" selected="">20</option>
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
                                                <span class="current prev" rel="prev">
                                                    <i class="icon-pokeball icon-pokeball-prev"></i>
                                                </span>
                                                <span class="current">1</span>
                                                <span class="current next" rel="next">
                                                    <i class="icon-pokeball icon-pokeball-next"></i>
                                                </span>
                                            <div class="handler">
                                                <input type="text" name="go-page"><button class="btn" type="button">Go</button>
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
