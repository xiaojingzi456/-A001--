<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="utf-8">
  <title>主页</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/home/home.css"/>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jQuery/jquery-1.12.4.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jQuery/template-web.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/home/home.js"></script>
</head>
<body>
<div class="f">
  <jsp:include page="head.jsp"/>
  <div class="t-h-500">
    <a href=""><img src="<%=request.getContextPath()%>/static/image/home/aaaa.png"
                    alt="" class="active"></a>
    <a href=""><img src="<%=request.getContextPath()%>/static/image/home/zhuyi.png"
                    alt=""></a>
    <a href=""><img src="<%=request.getContextPath()%>/static/image/home/zhuer.png"
                    alt=""></a>
    <a href=""><img src="<%=request.getContextPath()%>/static/image/home/zhuyi3.png"
                    alt=""></a>
    <a href=""><img src="<%=request.getContextPath()%>/static/image/home/zhuyi4.png"
                    alt=""></a>
    <div class="jt-r"><span class="j-s"> &gt; </span></div>
    <div class="jt-l"><span class="j-s"> &lt; </span></div>
    <div class="yd">
      <span class="yd-b"></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
    </div>
  </div>
  <div id="z">
    <div class="z-w-1188 z-h-600">
      <div class="z-h-36">
        <span class="s-28">电视专区</span>
        <div class="z-i-94d">
          <img src="<%=request.getContextPath()%>/static/image/home/8910f2a7-8d7b-4757-a4b2-e0db48714285.png" alt=""
               class="z-i-94 z-i-sh">
          <img src="<%=request.getContextPath()%>/static/image/home/738ea3ee-6602-4688-873c-0e8df2fcb2f0.png" alt=""
               class="z-i-94 hover-img">
        </div>
      </div>
      <div class="z-d-i">
        <div class="z-w-549">
          <a href="<%=request.getContextPath()%>/client/CommodityServlet?method=getCommodityDetail&coid=5">
            <img src="<%=request.getContextPath()%>/static/image/home/88f997c0-bb9c-4a93-baa2-c17668fdb628.jpg" alt="">
          </a>
        </div>
        <div class="z-w-601 ">
          <a href="<%=request.getContextPath()%>/client/CommodityServlet?method=getCommodityDetail&coid=5">
          <img src="<%=request.getContextPath()%>/static/image/home/d924faee-4c92-4396-806e-68fb56830fff.jpg" alt="">
          </a>
        </div>
        <div class="z-w-601 z-m-t">
          <a href="<%=request.getContextPath()%>/client/CommodityServlet?method=getCommodityDetail&coid=5">
          <img src="<%=request.getContextPath()%>/static/image/home/7d62c5f3-e17e-4189-b37b-03cb0e6aa8ad.jpg" alt="">
          </a>
        </div>
      </div>
      <div class=" z-h-404">
        <div>
          <a href="<%=request.getContextPath()%>/client/CommodityServlet?method=getCommodityDetail&coid=1">
            <img src="<%=request.getContextPath()%>/static/image/details/tv-b1.png" alt="">
            <p>【75E3D】75英寸/大屏影院/MEMC防抖/智慧语音/4K HDR电视</p></a>
          <p class="item-desc">爆款热销中！</p><span>9999.0</span>
        </div>
        <div>
          <a href="<%=request.getContextPath()%>/client/CommodityServlet?method=getCommodityDetail&coid=2">
          <img src="<%=request.getContextPath()%>/static/image/details/tv2-b1.png" alt="">
          <p>【43E2F】43英寸/悬浮全面屏/Unibody设计/8GB大存储/VIDAA AI智能系统电视</p>
        </a>
          <p class="item-desc">巅峰之声，玩转全场</p><span>28770.00</span>
        </div>
        <div>
          <a href="<%=request.getContextPath()%>/client/CommodityServlet?method=getCommodityDetail&coid=3">
          <img src="<%=request.getContextPath()%>/static/image/home/b5643a9a-a794-4fde-94e6-52a8412a18e3.png" alt="">
            <p>【H65E3A】65英寸4K/纤薄外观/人工智能/8GB内存/海量资源电视</p></a>
          <p class="item-desc">只见美景，不留残影！</p><span>5000.00</span>
        </div>
        <div>
          <a href="<%=request.getContextPath()%>/client/CommodityServlet?method=getCommodityDetail&coid=4">
          <img src="<%=request.getContextPath()%>/static/image/home/4fc7c53d-4989-4575-aae6-04321386ae7b.png" alt="">
            <p>【H65E3A-Y】65英寸/智慧语音/16GB大存储/4K HDR/纤薄机身电视</p></a>
          <p class="item-desc">画质之上，再造巅峰！</p><span>8888.00</span>
        </div>
      </div>
    </div>
    <div class="z-w-1188 z-h-600">
      <div class="z-h-36">
        <span class="s-28">空调专区</span>
        <div class="z-i-94d">
          <img src="<%=request.getContextPath()%>/static/image/home/8910f2a7-8d7b-4757-a4b2-e0db48714285.png" alt=""
               class="z-i-94 z-i-sh">
          <img src="<%=request.getContextPath()%>/static/image/home/738ea3ee-6602-4688-873c-0e8df2fcb2f0.png" alt=""
               class="z-i-94 hover-img">
        </div>
      </div>
      <div class="z-d-i">
        <div class="z-w-549"><img
                src="<%=request.getContextPath()%>/static/image/home/9c8b61ed-b9c5-454f-825a-118ed1102d7e.jpg" alt="">
        </div>
        <div class="z-w-601 "><img
                src="<%=request.getContextPath()%>/static/image/home/dcb3a070-caa3-431d-a0a7-3db5ab026ad7.jpg" alt="">
        </div>
        <div class="z-w-601 z-m-t"><img
                src="<%=request.getContextPath()%>/static/image/home/ad0404a4-6b6e-43d6-91f9-449d47e16f8b.jpg" alt="">
        </div>
      </div>
    </div>
    <div class="z-w-1188 z-h-600">
      <div class="z-h-36">
        <span class="s-28">容声专区</span>
        <div class="z-i-94d">
          <img src="<%=request.getContextPath()%>/static/image/home/8910f2a7-8d7b-4757-a4b2-e0db48714285.png" alt=""
               class="z-i-94 z-i-sh">
          <img src="<%=request.getContextPath()%>/static/image/home/738ea3ee-6602-4688-873c-0e8df2fcb2f0.png" alt=""
               class="z-i-94 hover-img">
        </div>
      </div>
      <div class="z-d-i">
        <div class="z-w-549"><img
                src="<%=request.getContextPath()%>/static/image/home/3d3ada75-876c-42ca-8af9-611c4fc1121b.jpg" alt="">
        </div>
        <div class="z-w-601 "><img
                src="<%=request.getContextPath()%>/static/image/home/eb77b184-c6d7-41a2-a4e8-474762152f85.jpg" alt="">
        </div>
        <div class="z-w-601 z-m-t"><img
                src="<%=request.getContextPath()%>/static/image/home/e93fb2b6-3bcd-44bc-b872-4fd27403cee9.jpg" alt="">
        </div>
      </div>
    </div>
    <div class="z-w-1188 z-h-600">
      <div class="z-h-36">
        <span class="s-28">选购攻略</span>
        <div class="z-i-94d">
          <img src="<%=request.getContextPath()%>/static/image/home/8910f2a7-8d7b-4757-a4b2-e0db48714285.png" alt=""
               class="z-i-94 z-i-sh">
          <img src="<%=request.getContextPath()%>/static/image/home/738ea3ee-6602-4688-873c-0e8df2fcb2f0.png" alt=""
               class="z-i-94 hover-img">
        </div>
      </div>
      <div class="z-d-i z-h-336">
        <div class="nnl-336">
          <img src="<%=request.getContextPath()%>/static/image/home/bc9389b2-e00a-49a0-a72a-a975809e9851.jpg" alt="">
          <div class="nnl">
            <p class="nnl-item-name" title="百佳惠购物商城牵头制定中国洗衣机行业首个蒸烫洗标准">
              百佳惠购物商城牵头制定中国洗衣机行业首个蒸烫洗标准
            </p>
            <p class="nnl-item-desc "
               title="百佳惠购物商城作为中国洗衣机行业首个蒸烫洗团体标准的牵头制定者和标准起草组组长单位，与中国家用电器研究院联合，对行业的蒸烫洗技术的定义、技术要求、适用范围等做出明确的规范和说明。">
              百佳惠购物商城作为中国洗衣机行业首个蒸烫洗团体标准的牵头制定者和标准起草组组长单位，与中国家用电器研究院联合，对行业的蒸烫洗技术的定义、技术要求、适用范围等做出明确的规范和说明。
            </p>
          </div>
        </div>
        <div class="nnl-336">
          <img src="<%=request.getContextPath()%>/static/image/home/5a3877f4-6a24-411b-b183-5f02c99707c2.jpg" alt="">
          <div class="nnl">
            <p class="nnl-item-name" title="百佳惠购物商城牵头制定中国洗衣机行业首个蒸烫洗标准">
              百佳惠购物商城牵头制定中国洗衣机行业首个蒸烫洗标准
            </p>
            <p class="nnl-item-desc "
               title="百佳惠购物商城作为中国洗衣机行业首个蒸烫洗团体标准的牵头制定者和标准起草组组长单位，与中国家用电器研究院联合，对行业的蒸烫洗技术的定义、技术要求、适用范围等做出明确的规范和说明。">
              百佳惠购物商城作为中国洗衣机行业首个蒸烫洗团体标准的牵头制定者和标准起草组组长单位，与中国家用电器研究院联合，对行业的蒸烫洗技术的定义、技术要求、适用范围等做出明确的规范和说明。
            </p>
          </div>
        </div>
        <div class="nnl-336">
          <img src="<%=request.getContextPath()%>/static/image/home/fccfb64d-c1b5-40f4-a8d4-95156629c7b2.jpg" alt="">
          <div class="nnl">
            <p class="nnl-item-name" title="百佳惠购物商城牵头制定中国洗衣机行业首个蒸烫洗标准">
                百佳惠购物商城牵头制定中国洗衣机行业首个蒸烫洗标准
            </p>
            <p class="nnl-item-desc "
               title="百佳惠购物商城作为中国洗衣机行业首个蒸烫洗团体标准的牵头制定者和标准起草组组长单位，与中国家用电器研究院联合，对行业的蒸烫洗技术的定义、技术要求、适用范围等做出明确的规范和说明。">
                百佳惠购物商城作为中国洗衣机行业首个蒸烫洗团体标准的牵头制定者和标准起草组组长单位，与中国家用电器研究院联合，对行业的蒸烫洗技术的定义、技术要求、适用范围等做出明确的规范和说明。
            </p>
          </div>
        </div>
      </div>
    </div>
    <div class="z-w-1188 z-h-600 z-h-240">
      <div class="z-h-36">
        <span class="s-28">服务</span>
      </div>
      <div class="z-d-i z-h-336">
        <ul class="z-ul">
          <li class="li-p-r z-i-94d">
            <a href="" class="a-r-a">
              <img src="<%=request.getContextPath()%>/static/image/home/2e9bf767-2c6c-44ac-bec2-5eff4bdbef7e.png" alt=""
                   class="z-i-94 z-i-sh">
              <img src="<%=request.getContextPath()%>/static/image/home/4926f48b-7441-4486-9efa-c37efe051dac.png" alt=""
                   class="z-i-94 hover-img">
            </a>
          </li>
          <li class="li-p-r z-i-94d">
            <a href="" class="a-r-a">
              <img src="<%=request.getContextPath()%>/static/image/home/57e147bd-b3a1-4418-a02f-03f13b0b4774.png" alt=""
                   class="z-i-94 z-i-sh">
              <img src="<%=request.getContextPath()%>/static/image/home/717179f3-c75d-41c1-a125-6e605fcd228e.png" alt=""
                   class="z-i-94 hover-img">
            </a>
          </li>
          <li class="li-p-r z-i-94d">
            <a href="" class="a-r-a">
              <img src="<%=request.getContextPath()%>/static/image/home/3809f58b-c6ba-4697-8880-ba2a2ae660d9.png" alt=""
                   class="z-i-94 z-i-sh">
              <img src="<%=request.getContextPath()%>/static/image/home/e6d11548-5a81-4799-b60b-9fad44843df1.png" alt=""
                   class="z-i-94 hover-img">
            </a>
          </li>
          <li class="li-p-r z-i-94d">
            <a href="" class="a-r-a">
              <img src="<%=request.getContextPath()%>/static/image/home/ae703862-5193-405e-a0f1-98febc8ee416.png" alt=""
                   class="z-i-94 z-i-sh">
              <img src="<%=request.getContextPath()%>/static/image/home/26a22da8-f9c3-4f0c-b7d1-4573abe468fd.png" alt=""
                   class="z-i-94 hover-img">
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <jsp:include page="tail.jsp"/>
</div>

</body>
</html>
