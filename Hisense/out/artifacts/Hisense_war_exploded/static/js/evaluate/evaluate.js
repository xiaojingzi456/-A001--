$(function () {


    //添加评论
    $(".btn-submit").click(function () {

        var oid = $("input[name=oid][type=hidden]").val();
        var len = $(".rater-star-item-current").width();
        console.log(len)
        var num = len/24;
        console.log(num)
        var etext = $("#evaluatetext").val();
        console.log(etext)
        $.ajax({
            async:true,
            cache:false,
            url:"/Hisense/client/EvaluateServlet",
            data:{"method":"addEvaluate","oid":oid,"num":num,"econtent":etext},
            type:"post",
            dataType:"json",
            success:function (rs) {
                if (rs.flag == true){
                    location.href="/Hisense/controller?method=personal"
                }
            },
            error:function () {
            }
        })
        return false;

    })

})