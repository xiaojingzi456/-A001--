$(function() {


    setCheckBox(false);//默认全部不勾选
    var bool = $("#checkAll").prop("checked");
    /*
      给全选按钮添加click事件
    */
    showTotal();//计算总计

    $("#checkAll,#select-batch").on("click",function() {

        //获取全选的状态
        var bool = $("#checkAll").prop("checked");
        //alert($(this).attr("state-all"))
        if($(this).attr("id")=="select-batch"){
            bool = $("#select-batch").prop("checked");
        }
        var all = 0;
        if (bool==true){
            all = $(":checkbox[name=checkbtn]").length;
        }
        $("#checkAll").prop("checked",bool);
        $("#select-batch").prop("checked",bool);
        //让所有条目的复选框与全选的状态同步
        //如果全选为false条目全不选，为true条目全选
        setCheckBox(bool);

        //让结算按钮与全选同步
        setJieSuan(bool);

        selectNum(all)
        //重新计算总计
        showTotal();
    });


    //给所有条目的复选框添加click事件

    $(":checkbox[name=checkbtn]").click(function() {
        var all = $(":checkbox[name=checkbtn]").length;//所有选择条目的个数
        var select = $("input[name=checkbtn]:checked").length;//获取所有选择了条目的个数

        if(all == select) {//全都选中了
            $("#checkAll").prop("checked", true);//勾选全选复选框
            $("#select-batch").prop("checked", true);
            setJieSuan(true);//让结算按钮有效
        } else if(select == 0) {//谁都没有选中
            $("#checkAll").prop("checked", false);//取消全选
            $("#select-batch").prop("checked", false);
            setJieSuan(false);//让结算按钮失效
        } else {
            console.log("选择了")
            $("#checkAll").prop("checked", false);//单个选择
            $("#select-batch").prop("checked", false);
            setJieSuan(true);//让结算按钮有效
        }

        //设置选中数量
        selectNum(select);
        
        showTotal();//重新计算总计
    });

    //选中数量
    function selectNum(num) {
        $(".total-count").text(num);
    }
    
    /*
        给减号添加click事件
    */
    $(".less").click(function() {
        //获取cartId
        var str = this.getAttribute("id");
        var id =str.substring(0,str.indexOf("less"))
        //var id = $(this).attr("id").substring(0, 32);//前缀就是id的前32为
        console.log(id)
        //获取输入框中的数量
        var quantity = $("#" + id + "quantity").val();
        //判断当前数量是否为1，如果为1就不减少，而是要删除了。
        if(quantity == 1){
            return false;
        }else{
            sendUpdateNum(id, Number(quantity)-1);
        }
    });

    // 给加号添加click事件
    $(".add").click(function() {
        //获取cartId
        var str = this.getAttribute("id");
        var id =str.substring(0,str.indexOf("add"))
        //var id = $(this).attr("id").substring(0, 32);
        //获取输入框中的数量
        var quantity = $("#" + id + "quantity").val();//若获取的是字符串，使用Number转换成数值
        if(quantity >= 200){
            return false;
        }else{
            sendUpdateNum(id, Number(quantity)+1);
        }

    });

    var quan = $(".count-number").val();
    $(".count-number").change(function () {
        var quantityVal = $.trim(this.value);
        var reg = /^\d+$/g;//开始或结束有一个或多个数字
        var flag = false;
        if (reg.test(quantityVal)){
            if (quantityVal>=0){
                flag =true;
            }
        }
        if (!flag){
            $(this).val(quan)//回显
            return
        }
        //获取当前id
        var idVal = $.trim(this.name);
        // console.log(Number(idVal))
        if(quantityVal >= 200){
            $(this).val(quan)//回显
            return false;
        }else{
            sendUpdateNum(idVal, Number(quantityVal));
        }

    })


    //批量删除与删除
    $(".delcartItem,.js-delete-batch-new").click(function () {

        var cartIdArray = new Array();
        if ($(this).attr("name")=="del_btn"){//点击单个删除按钮
            $(".delete-modal .modal-sub-title span").text("确认要删除该商品吗？")
            $(".delete-modal .js-modal-submit-new").show()
            $(".delete-modal").fadeIn(500)
            unScroll()
            var caid = $(this).parent().parent().parent().find(".td_checkshop").val();
            cartIdArray.push(caid)
            //console.log(caid)
            $(".js-modal-submit-new").click(function () {
                batchDel(cartIdArray)
            })
        }else {//点击删除选中商品按钮

            if($("input[name=checkbtn]:checked").length > 0) { //有选中
                $(".delete-modal .modal-sub-title span").text("确认要删除选中商品吗？")
                $(".delete-modal .js-modal-submit-new").show()
                $(".delete-modal").fadeIn(500)
                unScroll()
                $(".js-modal-submit-new").click(function () {
                    //获取所有被选中条目的复选框
                    //创建一数组，把所有被选中的复选框的值添加到数组中
                    $(":checked[name=checkbtn]:checked").each(function() {
                        cartIdArray.push($(this).val());//把复选框的值添加到数组中
                        console.log(cartIdArray)
                    });
                    batchDel(cartIdArray)
                })
            }else {
                $(".delete-modal .modal-sub-title span").text("请选择要删除商品")
                $(".delete-modal").fadeIn(500)
                $(".delete-modal .js-modal-submit-new").hide()
                unScroll()
            }
        }
    })
    //关闭删除提示
    $(".close-btn,.js-modal-cancel-new").click(function () {
        closeDel()
    })


    //结算
    $("#jiesuan").click(function () {
        submitCart()
    })
    //是否能结算
    setJieSuan(bool);

});
//禁止滚动条滚动
function unScroll() {
    $('html,body').css({'overflow': 'hidden'});

}
//移除禁止滚动条滚动
function removeUnScroll() {
    $('html,body').css({'overflow': 'auto'});
}
//关闭弹窗
function closeDel() {
    $(".delete-modal").fadeOut(200)
    removeUnScroll()
}

/*
 * 	计算总计
 */
function showTotal() {
    var total = 0;
    /*
    1. 获取所有的被勾选的条目复选框！循环遍历
    */
    $(":checked[name=checkbtn][checked=checked]").each(function() {
        //2. 获取复选框的值，就是所有元素名称的前缀cartId
        var id = $(this).val();
        //3. 再通过前缀+后缀找到小计元素，获取其文本
        var text = $("#" + id + "countPrice").text();
        //4. 累加计算，text为字符串，转换成数
        total += Number(text);
    });
    // 5. 把总计显示在总计元素上
    $("#sum").text(total);//round()函数把total保留2位
}

/*
 * 	统一设置所有条目的复选按钮
 */
function setCheckBox(bool) {
    $(":checkbox[name=checkbtn]").prop("checked", bool);
}

/*
 * 	设置结算按钮样式
 */
function setJieSuan(bool) {
    if(bool) {//不选中为false
        $("#jiesuan").css("background","#d9161c")
        $("#jiesuan").bind("click",function () {//重新绑定事件
            submitCart()
        })
        //$("#jiesuan").click(function() {return false;});
    } else {
        $("#jiesuan").css("background","#9b9393");//添加jiesuan新样式
        $("#jiesuan").unbind("click");//撤消当前元素止所有click事件
    }
    return bool
}


/*
 * 	批量删除
 */
function batchDel(cartIdArray) {

    var  url = "/Hisense/client/CartServlet";
    var caids = cartIdArray.join(",");
    //cartIdArray.toString();
    var args = {"method":"delbarthCart","caids":caids,"time":new Date()};
    console.log(cartIdArray)
    $.post(url,args,function (result) {
        console.log(result.flag)
        if (result.flag==true){
            closeDel()
            location = "/Hisense/client/CartServlet?method=getCart";
        }
    },"JSON")
}

/*
 * 	请求服务器，修改数量。
 */
function sendUpdateNum(caid, quantity) {
    $.ajax({
        async:false,
        cache:false,
        url:"/Hisense/client/CartServlet",
        data:{method:"updateCartQuantity",caid:caid,quantity:quantity},
        type:"post",
        dataType:"json",//用json解析成对象
        success:function(result) {
            if (result.flag ==true){
                console.log(result)
                //修改数量,从新修改它的值
                $("#" + caid + "quantity").val(result.data.canumber);
                //修改小计
                $("#" + caid + "countPrice").text(result.data.countPrice);
                //重新计算总计
                showTotal();
            }

        }
    });
}

/*
 *	 结算监听事件，获取选中的商品
 */
function submitCart() {
    //获取所有被选择的条目的id，放到数组中
    var cartIdArray = new Array();
    $(":checkbox[name=checkbtn]:checked").each(function() {
        cartIdArray.push($(this).val());//把勾选了的值添加到数组中
    });
    //把数组的值toString()，然后赋给表单的cartIds这个hidden,从而保存到表单中
    $("#caids").val(cartIdArray.toString());
    // 把总计的值，保存到表单中
    $("#accountsum").val($("#sum").text());
    // 3. 提交这个表单
    $("#submitCart").submit();
}