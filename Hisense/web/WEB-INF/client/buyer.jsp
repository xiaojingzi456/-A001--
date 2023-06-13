<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<%--<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/home/personal.css" />--%>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/eevee-layout-677c65.css"/>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/vendor-b0dfc7.css"/>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/app-back-45d2ee.css"/>
	</head>
	<body>
		<div class="js-comp buyer-index component-standard-container eve-component" data-comp-name="用户中心首页" data-comp-path="user/index">
			<div class="member-info clearfix js-member-info-container">

			<div class="user-info no-br">
				<div class="avatar">
					<a>
						<img src="<%=request.getContextPath()%>/static/image/details/default_avatar-54db3c.png" width="153" height="153">
					</a>
				</div>
				<div class="u-i-wrapper js-ui-wrapper">
					<div>
						<strong class="name cutwords">
							${user.uphone}
						</strong>
						<span class="level-icon"><img src="<%=request.getContextPath()%>/static/image/details/vip-1.png" width="24" height="24">

										</span>
					</div>
					<div class="score">
						<span>会员积分&nbsp;200</span><span class="center-line"></span><span>成长值&nbsp;0</span>
					</div>
					<div class="member-btns">
						<a class="btn btn-primary btn-gold">会员权益说明</a>
					</div>
				</div>
			</div>
			<div class="messages-wrap" style="display: block;">
				<div class="messages">
					<strong class="main-title">
						我的消息
					</strong>
					<a>
						<div class="message-title">订单生成</div>
						<div class="message-content txts-ellipsis">您的订单已经生成，库存紧张，尽快支付哟！祝您购物愉快！</div>
					</a>
				</div>
			</div>

			</div>
		</div>
	</body>
</html>
