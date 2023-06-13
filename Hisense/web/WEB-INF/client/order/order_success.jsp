<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>收银台</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/eevee-layout-677c65.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/vendor-b0dfc7.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/app-back-45d2ee.css"/>

    <script src="<%=request.getContextPath()%>/static/jsjar/jquery-3.1.0.js"></script>
    <script src="<%=request.getContextPath()%>/static/js/order/ordercash.js"></script>
</head>
<body>

    <div class="header-title-simple eve-component" data-comp-path="common/header_title_progress">
        <div>
            <p>
            支付订单
            </p>
        </div>
    </div>

    <div class="main-container" style="margin-bottom: 20px;">
        <div class="js-comp pre-pay eve-component" data-comp-name="订单支付详情页" data-comp-path="pay/pre_pay">  <div class="pre-pay">
            <div class="order-info">
                <div class="order-timeout">
                    <div>
                        <p>
                            <i class="order-icon iconfont icon-ic-checkout"></i>
                            <span>订单提交成功，现在只差最后一步啦！</span>
                        </p>
                        <span class="info-tip">请在<span class="info-tip-second" data-time="86399">23小时59分钟59秒内</span>完成支付，逾期订单会自动取消！</span>
                    </div>
                </div>
                <div class="order-total">
                    <div class="total-price">
                        <span>应付金额：</span>
                        <span class="price">￥${order.otatol}</span>
                        <input type="hidden" name="oid" value="${order.oid}">
                    </div>
                    <div class="address-box"><span>收货信息：</span>
                        <span>${order.address.aname}</span>&nbsp;&nbsp;
                        <span>${order.address.aphone}</span>&nbsp;&nbsp;
                        <span>${order.address.aprovince}</span>&nbsp;&nbsp;
                        <span>${order.address.acity}</span>&nbsp;&nbsp;
                        <span>${order.address.aarea}</span>&nbsp;&nbsp;

                        <span>${order.address.aspecific}</span>&nbsp;&nbsp;</div>
                    <div class="orders-box">  <div class="order-num">
                        <span>订单号：</span>
                        <span>${order.oid}</span>
                    </div>
                    </div>
                </div>
            </div>
            <div class="pay-method">
                <h2>选择支付方式</h2>
                <div>
                    <ul>
                        <li class="pay-channel" data-shopid="1" data-channel="alipay-pc" data-desc="支付宝">
                            <img class="alipay-pc" src="<%=request.getContextPath()%>/static/image/comimg/alipay_logo-f93212.png">
                            <span>支付宝</span>
                        </li>
                        <li class="pay-channel" data-channel="wechatpay-qr">
                            <img class="weixin-pc" src="<%=request.getContextPath()%>/static/image/comimg/wechat_logo-7c55e1.png">
                            <span>微信</span>
                        </li>
                        <li class="pay-channel" data-channel="unionpay-pc" id="cardpay" data-desc="银联" style="cursor:pointer">
                            <img class="unionpay-pc" src="<%=request.getContextPath()%>/static/image/comimg/unionpay_logo-1e5f8b.png">
                            <span>银联支付</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        </div>

    </div>
    <div style="clear:both;"></div>
</body>
</html>
