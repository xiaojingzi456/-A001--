$(function () {


    //更改select的值
    $("#form-pageSize").each(function () {
        $(this).find("option").each(function () {
            if ($(this).attr("selected")) {
                //移除selected属性
                $(this).removeAttr("selected");
            }
        });
    });
    var $option = $("#form-pageSize").find("option");
    var pagelenth = $(".prev").attr("data-pagesize");
    //$option.eq(1).attr("selected", true);
    $("#form-pageSize").each(function () {
        $(this).find("option").each(function () {
            if ($(this).val()==pagelenth) {
                $(this).attr("selected",true);
            }
        });
    });


    //页条数，下拉宽值发生改变,更新订单页面
    $("#form-pageSize").change(function () {
        var pagesize = $(this).val();
        //给表单域赋值
        $("input[name=pageSize][type=hidden]").val(pagesize)
        $("#order-search").submit()

        console.log($option.length)

    })

    //状态改变,更新页面
    $(".trade-status-select").change(function () {

        var pagesize = $(".next").attr("data-pageSize");
        $("input[name=pageSize][type=hidden]").val(pagesize)
        $("#order-search").submit()

    })
    //时间改变
    $("#date-select-dropdown").change(function () {

        var pagesize = $(".next").attr("data-pageSize");
        $("input[name=pageSize][type=hidden]").val(pagesize)
        $("#order-search").submit()

    })


    //上一页
    $(".prev").click(function () {

        var pageNo = $(this).attr("id");
        $("input[name=pageNo][type=hidden]").val(pageNo)

        // var pageSize = $("#form-pageSize").val();
        // var pageSize = $("#form-pageSize").find("option:selected").val();
        var pagesize = $(this).attr("data-pageSize");
        console.log(pagesize)
        $("input[name=pageSize][type=hidden]").val(pagesize)

        //第一页或最后一页不跳转
        var pageNum = $("#pageNo").text().trim();
        console.log(pageNum)
        if (pageNum == 1){
            return false;
        }
        $("#order-search").submit()



    })

    //下一页
    $(".next").click(function () {

        var pageNo = $(this).attr("id");
        $("input[name=pageNo][type=hidden]").val(pageNo)

        // var pageSize = $("#form-pageSize").val();
        // var pageSize = $("#form-pageSize").find("option:selected").val();
        var pagesize = $(this).attr("data-pageSize");
        console.log(pagesize)
        $("input[name=pageSize][type=hidden]").val(pagesize)
        var pageTotal = $("#go-page").attr("data-total");
        var pageNum = $("#pageNo").text().trim();
        if (pageNum >= pageTotal){
            return false
        }

        $("#order-search").submit()

    })

    $(".go-page").change(function () {

        var val = $(this).val().trim();
        var reg = /^\d+$/g;///^[0-9]*$/g;
        if (!reg.test(val)){
            $(this).val("1");//置空，为了重新输入
            //return;
        }
        var pageNo = parseInt(val);
        var pageTotal = $("#go-page").attr("data-total");
        if (pageNo < 1 || pageNo > parseInt(pageTotal)){
            $(this).val("1")
        }

    })

    //去哪页
    $("#go-page").click(function () {

        var pageNo = $(this).prev(".go-page").val();
        $("input[name=pageNo][type=hidden]").val(pageNo)

        var pagesize = $(".next").attr("data-pageSize");
        $("input[name=pageSize][type=hidden]").val(pagesize)

        $("#order-search").submit()

    })

    //条件查询
    $(".btn-custom").click(function () {

        var pagesize = $(".next").attr("data-pageSize");
        $("input[name=pageSize][type=hidden]").val(pagesize)
        $("#order-search").submit()

        return false;

    })


    //取消订单
    $(".updateOrder").click(function () {

        var oid = $(this).attr("data-id");
        $.ajax({
            async:true,
            cache:false,
            url:"/Hisense/client/OrderServlet",
            data:{method:"updateOrderByStatus",oid:oid,status:"3"},
            type:"post",
            dataType:"json",
            success:function (rs) {
                console.log(rs)
                if (rs.flag ==false){
                    alert(rs.errorMsg)
                }else {
                    location.reload(true)//刷新页面
                }
            }

        })
        return false;

    })

    //确认收货
    $(".updateOrderBystatus").click(function () {

        var oid = $(this).attr("data-id");
        $.ajax({
            async:true,
            cache:false,
            url:"/Hisense/client/OrderServlet",
            data:{method:"updateOrderByStatus",oid:oid,status:"1"},
            type:"post",
            dataType:"json",
            success:function (rs) {
                console.log(rs)
                if (rs.flag ==false){
                    alert("出现错误！！")
                }else {
                    location.reload(true)//刷新页面
                }
            }

        })
        return false;

    })

})