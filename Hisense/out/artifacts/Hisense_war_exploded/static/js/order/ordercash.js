$(function () {

    $("#cardpay").click(function () {
        var oid = $("input[name=oid][type=hidden]").val();
        $.ajax({
            async:true,
            cache:false,
            url:"/Hisense/client/OrderServlet",
            data:{method:"cashOrder",oid:oid},
            type:"post",
            dataType:"json",
            success:function (rs) {
                console.log(rs)
                if (rs.flag ==false){
                    alert(rs.errorMsg)
                }else {
                    alert("支付成功")
                    location.href="/Hisense/controller?method=personal"//刷新页面
                }
            }

        })

    })


})