<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<style>
    *{margin:0;padding:0;list-style-type:none;}
    a,img{border:0;}
    body{font:12px/180% Arial, Helvetica, sans-serif;}
    /*quiz style*/
    .quiz{border:solid 1px #ccc;height:270px;width:772px; margin:0 auto;}
    .quiz h3{font-size:14px;line-height:35px;height:35px;border-bottom:solid 1px #e8e8e8;padding-left:20px;background:#f8f8f8;color:#666;position:relative;}
    .quiz_content{padding-top:10px;padding-left:20px;position:relative;height:205px;}
    .quiz_content .btm{border:none;width:100px;height:33px;/*background:url(images/btn.gif) no-repeat;*/margin:10px 0 0 64px;display:inline;cursor:pointer;}
    .quiz_content li.full-comment{position:relative;z-index:99;height:41px;}
    .quiz_content li.cate_l{height:24px;line-height:24px;padding-bottom:10px;}
    .quiz_content li.cate_l dl dt{float:left;}
    .quiz_content li.cate_l dl dd{float:left;padding-right:15px;}
    .quiz_content li.cate_l dl dd label{cursor:pointer;}
    .quiz_content .l_text{height:120px;position:relative;padding-left:18px;}
    .quiz_content .l_text .m_flo{float:left;width:47px;}
    .quiz_content .l_text .text{width:634px;height:109px;border:solid 1px #ccc;}
    .quiz_content .l_text .tr{position:absolute;bottom:-18px;right:40px;}
    /*goods-comm-stars style*/
    .goods-comm{height:41px;position:relative;z-index:7;}
    .goods-comm-stars{line-height:25px;padding-left:12px;height:41px;position:absolute;top:0px;left:0;width:400px;}
    .goods-comm-stars .star_l{float:left;display:inline-block;margin-right:5px;display:inline;}
    .goods-comm-stars .star_choose{float:left;display:inline-block;}
    /* rater star */
    .rater-star{position:relative;list-style:none;margin:0;padding:0;background-repeat:repeat-x;background-position:left top;float:left;}
    .rater-star-item, .rater-star-item-current, .rater-star-item-hover{position:absolute;top:0;left:0;background-repeat:repeat-x;}
    .rater-star-item{background-position: -100% -100%;}
    .rater-star-item-hover{background-position:0 -48px;cursor:pointer;}
    .rater-star-item-current{background-position:0 -48px;cursor:pointer;}
    .rater-star-item-current.rater-star-happy{background-position:0 -25px;}
    .rater-star-item-hover.rater-star-happy{background-position:0 -25px;}
    .rater-star-item-current.rater-star-full{background-position:0 -72px;}
    /* popinfo */
    .popinfo{display:none;position:absolute;top:30px;background:url(../../static/image/evaluate/infobox-bg.gif) no-repeat;padding-top:8px;width:192px;margin-left:-14px;}
    .popinfo .info-box{border:1px solid #f00;border-top:0;padding:0 5px;color:#F60;background:#FFF;}
    .popinfo .info-box div{color:#333;}
    .rater-click-tips{/*font:12px/25px;*/color:#333;margin-left:10px;background:url(../../static/image/evaluate/infobox-bg-l.gif) no-repeat 0 0;width:125px;height:34px;padding-left:16px;overflow:hidden;}
    .rater-click-tips span{display:block;background:#FFF9DD url(../../static/image/evaluate/infobox-bg-l-r.gif) no-repeat 100% 0;height:34px;line-height:34px;padding-right:5px;}
    .rater-star-item-tips{/*background:url(images/star-tips.gif) no-repeat 0 0;*/height:41px;overflow:hidden;}
    .cur.rater-star-item-tips{display:block;}
    .rater-star-result{color:#FF6600;font-weight:bold;padding-left:10px;float:left;}

    #evaluateFrom{
        position: relative;
    }
    .floatbar-submit {
        width: 772px;
        margin-left: 0;
    }
    .floatbar-submit {
        position: absolute;
        left: 0;
        bottom: 0;
        z-index: 10;
        width: 990px;
        background: #f5f5f5;
        margin-bottom: 0;
    }
    .f-btnbox {
        position: relative;
        width: 100%;
        height: 30px;
        padding: 0 0;
        text-align: center;
        background-color: #fff;
        margin-top: 15px;
        margin-bottom: 10px;
    }
    .btn-submit {
        display: inline-block;
        width: 220px;
        height: 40px;
        line-height: 40px;
        padding: 0;
        font-family: "Microsoft YaHei";
        color: #fff;
        font-size: 18px;
        background-color: #df3033;
    }
    .floatbar-submit a{

        text-decoration: none;
    }
</style>
<div class="quiz">
    <h3>我要评论</h3>
    <div class="quiz_content">
        <input type="hidden" name="oid" value="${oid}">
        <form action="" id="evaluateFrom" method="post">
            <div class="goods-comm">
                <div class="goods-comm-stars">
                    <span class="star_l">满意度：</span>
                    <div id="rate-comm-1" class="rate-comm"></div>
                </div>
            </div>

            <div class="l_text">
                <label class="m_flo">内  容：</label>
                <textarea name="" id="evaluatetext" class="text"></textarea>
                <span class="tr">字数限制为5-200个</span>
            </div>
            <div class="f-btnbox z-submit-fail floatbar-submit">
                <a href="javascript:;" class="btn-submit">发表</a>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/jsjar/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/evaluate/comment.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/evaluate/evaluate.js"></script>

</body>
</html>
