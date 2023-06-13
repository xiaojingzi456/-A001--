$(function () {

    //获取图片
    var result = getDetailIMG();
    //显示图片
    loadIMG(result);


    //评论条数
    var evaluate = getEvaluate();
    $(".comment-total").text("（"+ evaluate.data.length+"）");

    $("#evaluate").click(function () {
        loadValuate(evaluate)

    })

});

//获取图片介绍
function getDetailIMG(){

    var result;
    var coid = $("input[name=coid][type=hidden]").val();
    var url = "/Hisense/client/CommodityServlet";
    var args = {"method":"getDetailImg","coid":coid};
    $.ajaxSettings.async = false;//禁用异步
    $.post(url,args,function (rs) {
        result = rs;
    },"json");
    return result;
}

//渲染数据
function loadIMG(result) {

    var obj = template("detailIMGtemplate",result);
    var $detailIMG = $("#detailIMG");
    $detailIMG.html(obj);

}

//获取评论
function getEvaluate() {
    var result;
    var coid = $("input[name=coid][type=hidden]").val();
    console.log("coid="+coid)
    var url = "/Hisense/client/CommodityServlet";
    var args = {"method":"getEvaluate","coid":coid};
    $.ajaxSettings.async = false;
    $.post(url,args,function (rs) {
        result = rs;
        console.log(rs)
    },"json")
    return result;
}

function loadValuate(result) {
    var obj = template("evaluatemplate",result);
    var $valuate = $(".comments-ul");
    $valuate.html(obj);
}

