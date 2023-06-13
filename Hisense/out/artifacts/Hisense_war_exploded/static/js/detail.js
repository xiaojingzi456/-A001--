$(function() {


	//滚动条
	if ($(this).scrollTop() == 0) {
		$(".return-top").hide();
	}
	$(window).scroll(function(event) {
		if ($(this).scrollTop() == 0) {
			$(".return-top").hide();
		}
		if ($(this).scrollTop() > 600) {
			$(".return-top").show();
		}
	});
	//返回顶部
	$('.return-top').click(function() {
		// 瞬间滚到顶部
		//$('html,body').scrollTop(0)

		// 平滑滚到顶部
		// 总距离
		var $page = $('html,body');
		//var distance = $page.scrollTop();不兼容IE
		var distance = $('html').scrollTop() + $('body').scrollTop(); //解决兼容问题
		// 总时间
		var time = 100;
		// 间隔时间
		var intervalTime = 10;
		//每次执行函数滚动条移动的距离
		var itemDistance = distance / (time / intervalTime);
		// 使用循环定时器不断滚动
		var timer = setInterval(function() {

			//每次滚动后的距页面的总距离离
			distance -= itemDistance;
			// 到达顶部, 停止定时器
			if (distance <= 0) {
				distance = 0; //不能整减，修正
				clearInterval(timer);
			}
			$page.scrollTop(distance);
		}, intervalTime);

	})

	//方式二：动画回顶部
	$("选择器").click(function(event) {
		$("html,body").animate({
				scrollTop: "0px"
			},
			666
		)
	});

	//详情信息
	$(".tab ul li").find("a").css("text-decoration", "none")
	$(".tab ul li").click(function() {

		var index = $(this).index();
		$(".tab ul li").find("a").css("color", "#aaa")

		var $tabDiv = $(this).parent().parent().find(".tab-contents .tab-content");
		$tabDiv.css("display", "none");
		$(this).find("a").css("color", "black")
		$tabDiv.eq(index).css("display", "block")
	});



	var $promotionBox = $(".promotionBox");
	//承诺
	$(".commitment").click(function(e) {
		$promotionBox.slideToggle(200)
		
		$(document).bind("click", function(e) {
			var $target = $(e.target);
			if ($target.closest(".promotionBox").length == 0) {
				$(".promotionBox").slideUp(200)
			}
		})
		 e.stopPropagation();
		
	})
	// var fnum =$("#item-quantity").val();;
	var fnum =0;
	//添加
	$(".plus").click(function(){
		var n=$(this).prev().val();
		//console.log("..."+n)
		var num=parseInt(n)+1;
		checkquantity(num)
		if(num>=200){
			return;
		}
		$(this).prev().val(num);
		fnum = num
		console.log($("#item-quantity").val())

	});
	checkquantity(fnum)
	//减的效果
	$(".minus").click(function(){
		var n=$(this).next().val();
		var num=parseInt(n)-1;
		checkquantity(n)
		if(num==0){
			return
		}
		$(this).next().val(num);
		fnum = num
	});
	$("#item-quantity").change(function () {
		var quantityVal = $.trim(this.value);
		var reg = /^\d+$/g;//开始或结束有一个或多个数字
		var flag = false;
		if (reg.test(quantityVal)){
			if (quantityVal>=0&&quantityVal<=200){
				flag =true;
				fnum = quantityVal
			}
		}
		if (!flag){
			$(this).val(fnum)//回显
			return
		}
	})

	//添加购物车成功模态框
	$(".js-add-cart").click(function(){

		$(".modal-shopping-cart").fadeIn(200)
		var url = "/Hisense/client/CartServlet";
		var canumber = $("input[name=canumber]").val();
		var coid = $("input[name=coid]").val();
		//console.log("购物车"+coid)
		//console.log("数量"+canumber)
		var args = {"method":"addToCart","canumber":canumber,"coid":coid,"time":new Date()};
		$.post(url,args,function (result) {
			console.log(result.flag)
			if (result.flag==true){
				$(".modal-shopping-cart").fadeIn(200)
			}
		},"JSON")

		return false;

	})

	$(".close-btn,.close").bind("click",function(){

		$(".modal-shopping-cart").fadeOut(200)

	})
	

})

function checkquantity(fnum) {
	if (fnum<=1){
		console.log(fnum)
		$(".minus").addClass("disabled");
	}else if (fnum>=200){
		$(".plus").addClass("disabled")
	}else {
		//console.log("+++"+fnum)
		$(".minus").removeClass("disabled")
		$(".plus").removeClass("disabled")
	}

}