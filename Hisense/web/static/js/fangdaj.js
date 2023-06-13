
//鼠标经过预览图片函数
function preview(img){

	$("#preview img").attr("src",$(img).attr("src"));
	$("#preview img").attr("jqimg",$(img).attr("src"));
}
//图片放大镜效果
$(function(){
	$("#preview").jqueryzoom({xzoom:380,yzoom:410});
});

//图片预览小图移动效果,页面加载时触发
$(function(){
	var tempLength = 0; //临时变量,当前移动的长度
	var viewNum = 5; //设置每次显示图片的个数量
	var moveNum = 2; //每次移动的数量
	var moveTime = 300; //移动速度,毫秒
	var scrollDiv = $(".show ul"); //进行移动动画的容器
	var scrollItems = $(".show ul li"); //移动容器里的集合
	var moveLength = scrollItems.eq(0).width() * moveNum; //计算每次移动的长度
	//console.log(moveLength)
	var countLength = (scrollItems.length - viewNum) * scrollItems.eq(0).width(); //计算总长度,总个数*单个长度
	//console.log(countLength)
	
	//下一张
	$(".carousel-wrap .next").bind("click",function(){
		//console.log("==="+tempLength)
		if(tempLength < countLength){
			if((countLength - tempLength) > moveLength){
				scrollDiv.animate({left:"-=" + moveLength + "px"}, moveTime);
				tempLength += moveLength;
			}else{
				scrollDiv.animate({left:"-=" + (countLength - tempLength) + "px"}, moveTime);
				tempLength += (countLength - tempLength);
			}
		}
		// if(tempLength==384){
		// 	$(".next .icon-pokeball").css("color","red");
		// }else if(tempLength!=384){
		// 	$(".next .icon-pokeball").css("color","")
		// }
		
	});
	//上一张
	$(".carousel-wrap .prev").bind("click",function(){
		
		if(tempLength > 0){
			if(tempLength > moveLength){
				scrollDiv.animate({left: "+=" + moveLength + "px"}, moveTime);
				tempLength -= moveLength;
			}else{
				scrollDiv.animate({left: "+=" + tempLength + "px"}, moveTime);
				tempLength = 0;
			}
		}
		
	});
	$(".show ul li").removeClass("selected");
	$(".show ul li:first").addClass("selected");
	$(".show ul img").click(function(){
		$(".show ul li").removeClass("selected");
		//console.log(this)
		preview($(this));
		$(this).parent().addClass("selected");
	})
});