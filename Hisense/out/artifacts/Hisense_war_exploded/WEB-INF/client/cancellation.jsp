<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/home/cancellation.css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jQuery/jquery-1.12.4.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/home/cancellation.js"></script>
	</head>
	<body>
		<div class="c-w-948">
			<h3>账户注销申请</h3>
			<div class="c-h-628">
				<h2 class="text-center">为充分保障您的合法权益，商城将对以下信息进行审核</h2>
				<ul class="c-w-736">
					<li>
						<span>1</span>
						 账号内无未完成状态订单且已完成状态订单达到90天以上
					</li>
					<li>
						<span>2</span>
						 账号一年内无异常行为
					</li>
					<li>
						<span>3</span>
						 账户无任何纠纷
					</li>
				</ul>
				<div class="c-w-900">
					<p>
						<input type="checkbox">
						申请注销即表示您自愿放弃账号内所有虚拟资产并同意
						<span>《注销须知》</span>
					</p>
					<a href="">申请注销</a>
					<p></p>
				</div>
				<div class="c-w2-736">
					<img src="<%=request.getContextPath()%>/static/image/home/info.png" alt="">
					<span>您的账户在90天内有过交易记录，为保证交易信息的安全和完整性，请交易结束（交易成功/交易关闭）90天后再申请注销，订单号 2007230008765112。</span>
					<a href="">查看详情</a>
				</div>
			</div>
		</div>
	</body>
</html>
