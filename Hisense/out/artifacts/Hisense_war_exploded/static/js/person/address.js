$(function () {

    //获取地址
    var result = getAddress();
    //显示地址
    render(result);


    //var $modal = $(".address-modal");

    //新增地址
    $(".js-add-address").click(function(){

        //parent.document.body.append($modal),脱离iframe
        addAddress()
        addfuns("addAddress")
        showAddress()
    })

    //修改地址
    $(".js-update-address").click(function (e) {

        var aid = $(this).attr("data-id");
        console.log(aid)
        $.ajax({
            async: false,
            cache: false,
            url:"/Hisense/client/AddressServlet",
            data:{method:"getAddressByaid","aid":aid},
            type:"post",
            success:function (rs) {
                rs = JSON.parse(rs);
                //console.log(rs.data.aprovince)
                updateAddress(rs);
                //修改操作
                addfuns("updateAddressByuid",aid);

            }
        })
        showAddress()
        e.stopPropagation()

    })

    //删除地址
    $(".js-delete-address").click(function (e) {

        showAlert()
        var aid = $(this).attr("data-id");
        $("#delAddress").click(function () {
            var url = "/Hisense/client/AddressServlet";
            var args = {"method":"delAddress","aid":aid};
            $.post(url,args,function (rs) {
                rs = JSON.parse(rs);
                if (rs.flag){
                    hideAlert();
                    location.reload(true)
                }
            })
        })
        e.stopPropagation()//阻止事件行为，并阻止冒泡

    })

    //显示、隐藏
    $(".close").click(function () {
        hideAlert()
    })

    $(".close").click(function(){
        hideAddress()
        return false;
    })

    /* 地址切换 */
    var $pre = $("pre");
    var $picker = $( ".picker" );
    $.getJSON( "/Hisense/static/js/cart/json/area.json" ).done(function ( res ) {
        $( "#demo-4" ).iPicker({
            data: res,
            defaultValue: [ "110000","110100","110101" ],
            onSelect: function ( v, t, set ) {
                var text = "[ " + t + " ]";
                var value = "[ " + v + " ]";
                $pre.eq( 5 ).html( text + "<br><br>" + value );
            }
        });
    })

})

// 表单提交时校验
function checksubAddress(){
    var flag = true;//表示校验通过
    //如果有一个校验失败返回false
    if(!checkstreetaddress()){
        flag = false;
    }
    if(!checksitesid()){
        flag = false;
    }
    if(!checkmobilephone()){
        flag = false;
    }
    return flag;
};
//检查详细地址
function checkstreetaddress(){
    var value = $("#streetaddress").val().trim();
    console.log(value.length)
    //
    if (value=="" || value==null){
        //$("#streetaddress").nextAll(".note-error-empty").css({"font-size":"5px","display":"block","text-align":"center"});
        $("#streetaddress").css({"border-color":"red"})
        return false;
    }else if (value.length <5 || value.length >50){
        //$("#streetaddress").nextAll(".note-error").css({"font-size":"5px","display":"block","text-align":"center"});
        $("#streetaddress").css({"border-color":"red"})
        return false;
    }
    return true
}
function checksitesid() {
    var value = $("#sitesid").val();

    if (value=="" || value==null){
        $("#sitesid").css({"border-color":"red"})
        return false;
    }else if (value.length <2 || value.length >25){
        $("#sitesid").css({"border-color":"red"})
        return false;
    }
    return true
}
function checkmobilephone() {
    var value = $("#mobilephone").val();
    if (value.length !=11){
        $("#mobilephone").css({"border-color":"red"})
        return false;
    }
    return true

}

function showAddress() {
    $(".address-modal").slideDown(300)
}
function hideAddress() {
    $(".address-modal").slideUp(300)
}
function showAlert(){
    $(".modal-dialog").fadeIn(300)
}
function hideAlert(){
    $(".modal-dialog").fadeOut(300)
}

function updateAddress(rs) {

    // $ahead.text("修改收货地址")
    // $province.eq(0).text(rs.data.aprovince)

    $("#address-head").text("修改收货地址")
    $(".iPicker-result span").eq(0).text(rs.data.aprovince)
    $(".iPicker-result span").eq(1).text(rs.data.acity)
    $(".iPicker-result span").eq(2).text(rs.data.aarea)
    $("#streetaddress").text(rs.data.aspecific)
    $("#sitesid").val(rs.data.aname)
    $("#mobilephone").val(rs.data.aphone)
    $("#phone").val(rs.data.atelephone)
    $("#post-code").val(rs.data.apostcode)

}
function addAddress() {

    $("#address-head").text("新增收货地址")
    $(".iPicker-result span").eq(0).text("北京市")
    $(".iPicker-result span").eq(1).text("市辖区")
    $(".iPicker-result span").eq(2).text("东城区")
    $("#streetaddress").text("")
    $("#sitesid").val("")
    $("#mobilephone").val("")
    $("#phone").val("")
    $("#post-code").val("")

}

function addfuns(me,aid) {
    $("#suborder").click(function () {
        var b = checksubAddress();
        if (!b){
            return false;//不通过校验返回
        }
        var $dis = $(this).parent().parent();
        var province = $dis.find(".iPicker-result span").eq(0).text()
        var city = $dis.find(".iPicker-result span").eq(1).text()
        var area = $dis.find(".iPicker-result span").eq(2).text()
        var speci = $dis.find("#streetaddress").val()
        var aname = $dis.find("#sitesid").val()
        var aphone = $dis.find("#mobilephone").val()
        var telephone = $dis.find("#phone").val()
        var post = $dis.find("#post-code").val()

        var url="/Hisense/client/AddressServlet";
        if (me=="addAddress"){
            var args={"method":me,"aprovince":province,
                "acity":city,"aarea":area,"aspecific":speci,"aname":aname,"aphone":aphone,
                "atelephone":telephone,"apostcode":post};
        }else {//修改操作
            var args={"method":me,"aid":aid,"aprovince":province,
                "acity":city,"aarea":area,"aspecific":speci,"aname":aname,"aphone":aphone,
                "atelephone":telephone,"apostcode":post};
        }
        $.post(url,args,function (msg) {
            if (msg.flag){
                hideAddress()
                //重新渲染
                //var rs = getAddress()
                //render(rs)
                location.reload(true)

            }
        },"json")

    })

}

function getAddress() {
    var result;
    $.ajax({
        async:false,
        cache:false,
        url:"/Hisense/client/AddressServlet?method=getAddress",
        date:{"tem":new Date()},
        type:"post",
        dateType:"json",
        success:function (rs) {
            result = JSON.parse(rs);
            console.log(result.data);
            //设置提交的地址id
        }
    });
    return result;
}

//渲染模板
function render(result) {

    //模板引擎，渲染地址数据
    var obj = template("userAddress",result);
    var $addressli = $("#addressTamp");
    $addressli.html(obj);

}