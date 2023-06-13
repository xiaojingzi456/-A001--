$(function () {

    //更改订单项的选中状态
    var status = $(".status-color").text().trim();
    if (status == "已收货"){
        checkLi(1,2,3)
    }else if (status == "已付款"){
        checkLi(1)
    }else if (status == "已取消"){
        $(".progress-step").removeClass("active")
    }else if (status == "已发货"){
        checkLi(1,2,)
    }else if (status == "已评价"){
        checkLi(1,2,3,4,)
    }

})

function checkLi(num2,num3,num4,num5,num6) {

    var $progress = $(".progress-step");
    $progress.eq(num2).addClass("active");
    $progress.eq(num3).addClass("active");
    $progress.eq(num4).addClass("active");
    $progress.eq(num5).addClass("active");
}