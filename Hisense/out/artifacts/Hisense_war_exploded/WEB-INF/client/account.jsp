<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/home/personal.css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jQuery/jquery-1.12.4.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/home/account.js"></script>
	</head>
	<body>
		<div class="a-w-948">
			<div class="a-w-900">
				<h2>账号设置</h2>
			</div>
			<div class="a-w-828">
				<img src="<%=request.getContextPath()%>/static/image/personal/4a4e8dfc-6288-43ba-8539-88017c0a0ad5.jpg" alt="">
				<div class="acc-file">
					<input type="file" name="acc-file">
					<span>上传头像</span>
				</div>
			</div>
			<div class="a-w-708">
				<h3>基本信息</h3>
			</div>
			<div class="a-w2-828">
				<form action="" class="a-h-338">
					<div>
						<label class="a-m-r">
							真实姓名
						</label>
						<input type="text" id="zname" value="${user.uname}" placeholder="请输入您的真实姓名">
						<span class="f-f-12">(不能超过25个字符)</span>
					</div>
					<div>
						<label class="a-m-r">
							手机号码
						</label>
						<input type="text" id="zshouji" value="${user.uphone}" placeholder="请输入您的手机号码">
					</div>
					<div>
						<label class="a-m-r">
							性别
						</label>
						<label class="inline">
							<input class="input-radio" type="radio" required="" name="gender" value="1" checked="checked">&nbsp;男
						</label>
						<label class="inline">
							<input class="input-radio" type="radio" required="" name="gender" value="2">&nbsp;女
						</label>
					</div>
					<div>
						<label class="a-m-r">
							邮箱
						</label>
						<input type="email" id="zyoux" name="email" value="${user.uemail}">
						<span class="f-f-12">
							(例：example@hisense.com)
						</span>
					</div>
					<div class="a-btn">
						<label class="a-m-r"></label>
						<input class="btn" id="x_jb" value="保存">
					</div>
				</form>
				<div class="a-w-708 a-f-l">
					<h3>更换手机号</h3>
				</div>
				<form action="" class="a-h-338">
					<div>
						<label class="a-m-r">
							<span class="required">*</span>
							新手机号
						</label>
						<input type="text" value="" placeholder="请输入新手机号">
						<span class="f-f-12" style="">
							校验提示信息
						</span>
					</div>
					<div>
						<label class="a-m-r">
							<span class="required">*</span>
							图片验证码
						</label>
						<input type="text" value="" placeholder="请输入图片验证码">
						<img src="<%=request.getContextPath()%>/static/image/personal/captcha.jpg" class="verify-code js-verify-code" alt="看不清楚？点击重新获取验证码" title="看不清楚？点击重新获取验证码">
					</div>

					<div>
						<label class="a-m-r">
							<span class="required">*</span>
							短信验证码
						</label>
						<input type="text" name="" value="" placeholder="请输入短信验证码">
						<span class="f-f-12" style="color: #00AAA6; cursor: pointer;">
							发送验证码
						</span>
					</div>
					<div class="a-btn">
						<label class="a-m-r"></label>
						<input  class="btn" value="保存">
					</div>
				</form>
				<div class="a-w-708 a-f-l">
					<h3>密码设置</h3>
				</div>
				<form action="" class="a-h-338">
					<div>
						<label class="a-m-r">
							<span class="required">*</span>
							当前密码
						</label>
						<input type="password" value="${user.uphone}">
						<span class="f-f-12 pointer"><img src="<%=request.getContextPath()%>/static/image/home/view%20(1).png" alt=""></span>
					</div>
					<div>
						<label class="a-m-r">
							<span class="required">*</span>
							新密码
						</label>
						<input type="password" class="mmyi" value="">
						<span class="f-f-12 pointer"><img src="<%=request.getContextPath()%>/static/image/home/view%20(1).png" alt=""></span>
					</div>

					<div>
						<label class="a-m-r">
							<span class="required">*</span>
							确认密码
						</label>
						<input type="password" class="mimaer" name="" value="">
						<span class="f-f-12 pointer"><img src="<%=request.getContextPath()%>/static/image/home/view%20(1).png" alt=""></span>
					</div>
					<div class="a-btn">
						<label class="a-m-r"></label>
						<input  class="btn" id="mimaxg" value="保存">
					</div>
				</form>
			</div>
			<div class="clearfloat"></div>
		</div>
	</body>

<script type="text/javascript">

	$("#x_jb").click(function () {
		var name=$("#zname").val();
		var zshouji="${user.uphone}";
		var zyoux=$("#zyoux").val();
		$.ajax({
			type:"post",
			url:"/Hisense/user?method=xiugaiinfo",
			data:{"name":name,"zshouji":zshouji,"zyoux":zyoux},
			dataType:"text",
			success:function (v) {
				if (v="ok"){
					alert("修改成功")
				} else {
					alert("修改失败")
				}
			}
		});
	})
	$("#mimaxg").click(function () {
		var zshouji="${user.uphone}";
		var mmyi=$(".mmyi").val();
		var mimaer=$(".mimaer").val();
		if (mmyi==mimaer) {
			$.ajax({
				type:"post",
				url:"/Hisense/user?method=xiumima",
				data:{"zshouji":zshouji,"mimaer":mimaer},
				dataType:"text",
				success:function (v) {
					if (v="ok"){
						alert("修改成功")
					} else {
						alert("修改失败")
					}
				}
			});
		}
	})
</script>
</html>
