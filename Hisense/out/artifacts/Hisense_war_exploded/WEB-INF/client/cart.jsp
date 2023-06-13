<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>我的购物车</title>
  <meta name="keywords" content="">
  <meta name="description" content="">

  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/home/home.css"/>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/home/personal.css"/>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jQuery/jquery-1.12.4.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/home/personal.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/home/home.js"></script>

  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/font_1468400228_1677577.css"/>
  <!-- feebas 前台的iconfont -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/font_72064_8d6mr7huygmn29.css"/>
  <!-- pc 前台的iconfont -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/font_844587_t32m3dyr45.css"/>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/eevee-layout-677c65.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/vendor-b0dfc7.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/app-back-45d2ee.css">
  <script src="<%=request.getContextPath()%>/static/jsjar/jquery-3.1.0.js"></script>
  <script src="<%=request.getContextPath()%>/static/js/cart/cart.js"></script>
</head>
<body style="position: relative">

<!-- 头部 -->
<jsp:include page="headlogin.jsp"/>

<%-- 购物车核心 --%>
<div class="main-container" style="margin-bottom: 20px;">
  <div class='shopping-cart js-comp clearfix eve-component' >
    <div class="float-hidden" hidden="true"></div>
    <div class="cart-top-header">
      <div class="cart-top-header-center">
        <div>
          <a href="<%=request.getContextPath()%>/controller?method=home" target="_blank" style="font-size: 25px;color: #0C0C0C">
            百佳惠购物商城首页
          </a>
        </div>
        <h3 style="margin: 9px 0 0;">我的购物车</h3>
      </div>
    </div>

    <div class="fall-item-num">
      <div class="fall-item-text">
        <i class="iconfont icon-tishi"></i>有<span class="js-fall-num">0</span>件商品降价了！快去看看
      </div>
      <div class="fall-item-close"><i class="iconfont icon-ic-close"></i></div>
    </div>

    <div class="shopping-cart-body" data-address="370202">

      <c:choose>
        <c:when test="${empty cartList}">

          <!-- 未添加商品 -->
          <div class="empty-standard-container">
            <div class="show-img">
              <div class="empty-tip">暂无添加的商品</div>
            </div>
          </div>
          <!-- 去购物 -->
          <div class="text-center btn-wrapper">
            <a href="<%=request.getContextPath()%>/controller?method=home" class="btn-red-lg">马上去购物</a>
          </div>
        </c:when>
        <c:otherwise>
          <%-- 有商品 --%>
        <form action="#" method="post" class="" id="cart-form">
        <table class="table table-horizontal center-tex shopping-cart-table">
            <thead>
            <tr class="table-tr-title">
              <th width="56">
                <input type="checkbox" id="checkAll" class="checkAll" autocomplete="off">
              </th>
              <th width="640">
                <span class="js-batch-select item-logo-th-span">全选</span>
                <span class="cart-title">商品信息</span>
              </th>
              <th width="150">价格(元)</th>
              <th width="175">数量</th>
              <th width="130">小计(元)</th>
              <th width="53">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="calist" items="${cartList}">


            <tr class="item-tr shop-discount" data-site="1" data-id="3497" data-itemid="3490" data-index="0"
                data-gift-promotion="">
              <td></td>
              <td>
                <div class="item-shop-discount-container">
                  <div class="item-shop-discount-title js-discount-title">
                  </div>
                  <ul class="js-ticket-list ticket-list" style="display: none;">
                  </ul>
                  <ul class="js-gift-list gift-list" style="display: none;">

                  </ul>
                </div>
              </td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
            <tr class="item-tr " data-site="1" data-id="3497" data-itemid="3490" data-index="0" data-gift-promotion="">
              <td class="check-td v-middle">
                <input type="checkbox" name="checkbtn" class="td_checkshop" value="${calist.caid}" checked="checked">
              </td>
              <td class="left-text" data-value="null" data-gift="null">

                <div class="clearfix">
                  <div class="item-logo">
                    <a href="/items/3490">
                      <img width="78" height="78" src="<%=request.getContextPath()%>/static/image/details/${calist.commodity.copicture}">
                    </a>
                  </div>
                  <div class="shop-cart-name" data="">
                    <div class="item-description cutwords">
                      <span><a href="/items/3490" style="font-size: 15px">${calist.commodity.coname}</a></span>
                      <br>
                      <span class="sku-attrs"></span>
                    </div>
                  </div>
                </div>
              </td>
              <td>
                <div class="flex-container">
                  <div>
                    <div class="css-price">
                      <span class="">￥</span><span class="price ">${calist.commodity.coprice}</span>
                    </div>
                    <div class="equalsPrice">
                    </div>
                  </div>
                </div>
              </td>
              <td>
                <div class="flex-container">
                  <div>
                    <div class="input-amount group-small">
                      <a href="javascript:void(0);" id="${calist.caid}less" class="minus less">-</a>
                      <input type="text" id="${calist.caid }quantity" class="count-number" name="${calist.caid}" value="${calist.canumber}">
                      <a href="javascript:void(0);" id="${calist.caid}add" class="plus add">+</a>
                    </div>
                  </div>
                </div>
              </td>
              <td>
                <div class="flex-container">
                  <div class="css-price"><span class="corange">￥</span><span class="item-subtotal currency" id="${calist.caid }countPrice">${calist.countPrice}</span>
                    <div></div>
                  </div>
                </div>
              </td>
              <td class="td-last">
                <div class="flex-container">
                  <a name="del_btn" class="js-delete-item-new delcartItem" data-id="3497">
                    删除
                  </a>
                </div>
              </td>
            </tr>
            </c:forEach>

            </tbody>


          </table>
        </form>
          <!-- 失效商品 -->
          <table class="table hide table-horizontal center-tex shopping-cart-table off-shelf">
            <thead>
            <tr class="table-tr-title">
              <th width="53"> </th>
              <th width="788">
                失效商品
              </th>
              <th width="120">状态</th>
              <th width="190">
                <div class="js-delete-all-unavailable">删除所有失效商品</div>
              </th>
            </tr>
            </thead>
            <tbody>
            </tbody>
          </table>
          <!-- 有商品 -->
          <div class="shopping-cart-foot block" style="left: 0px; top: 0px; z-index: 100;">
            <div class="foot-item-container"><span class="btn-left disabled">
                                    <i class="icon-feebas icon-feebas-prev"></i>
                                </span>
              <div class="items-container">
                <ul>
                </ul>
              </div>
              <span class="btn-right disabled">
                                    <i class="icon-feebas icon-feebas-next"></i>
                                </span>
            </div>
            <div class="foot-container">
              <fieldset>
                <div class="cart-operate">
                  <label><input type="checkbox" state-all="checked" id="select-batch"
                                autocomplete="off">&nbsp;&nbsp;&nbsp;全选</label>
                  &nbsp;&nbsp;&nbsp;
                  <a href="javascript:void(0);" class="js-delete-batch-new">
                    删除选中商品
                  </a>
                </div>
                <div class="cart-result">
                  <span class="total-item">已选<span class="total-count">0</span>种商品</span>
                  <span class="total-price">
                                            合计(不含运费)：&nbsp;&nbsp;&nbsp;<span class="css-price"><span>￥</span><span class="currency css-price" id="sum">0</span></span>
                                        </span>
                </div>
                <div class="shopping-cart-foot-operate" data-userid="" data-orgid="">
                  <button class="btn btn-primary js-cart-submit" id="jiesuan">去结算</button>
                  <form id="submitCart" action="${pageContext.request.contextPath}/client/CartServlet?method=submitCart" method="post" >
                      <input type="hidden" name="method" value="submitCart" >
                      <input type="hidden" name="caids" id="caids">
                      <input type="hidden" name="sum" id="accountsum">
                  </form>
                </div>
              </fieldset>
            </div>
          </div>
        </c:otherwise>
      </c:choose>
    </div>

  </div>
</div>

</div>
<div style="clear:both;"></div>

<div class='js-comp component-right-bottom-nav eve-component' data-comp-path='common/right_bottom_nav'>
  <ul class="crbm-ul" data-user="null" class="">
    <li title="购物车">
      <a href="/buyer/cart" onclick="">
        <i class="iconfont icon-ic-cart"></i>
        <div class="bottom-tip">购物车</div>
        <div class="cart-num single js-bottom-cart-num hide">0</div>
      </a>
    </li>
    <li class="js-open-kefu" title="客服">
      <a href="javascript:;" onclick="">
        <i class="iconfont icon-GroupCopyx-"></i>
        <div class="bottom-tip">在线客服</div>
      </a>
    </li>
    <li class="new-user-gift js-new-user-gift" title="新人礼">
    </li>
    <li class="js-qrcode-li qrcode-li" title="二维码">
      <a href="javascript:;">
        <i class="iconfont icon-ic-logo-mobile"></i>
        <div class="bottom-tip">移动商城</div>
      </a>
      <div class="item-qrcode-container">
        <div class="item-qrcode-title">
          <div>扫一扫</div>
          <div>使用手机购买</div>
        </div>
        <div class="item-qrcode-wrapper">
          <div class="js-qrcode-content">
          </div>
        </div>
      </div>
    </li>
    <li class="js-jump-footprint" title="足迹">
      <a href="javascript:;" onclick="">
        <i class="iconfont icon-ic-footprint"></i>
        <div class="bottom-tip">足迹</div>
      </a>
    </li>
    <li class="js-return-top return-top" title="返回顶部">
      <a href="javascript:;">
        <i class="iconfont icon-huidaodingbujiantou"></i>
        <div class="bottom-tip">返回顶部</div>
      </a>
    </li>
  </ul>
</div>
<div id="delMSG" class="modal delete-modal" style="z-index:999;display: none">
    <div class="modal-body">
        删除商品
    </div>
    <div class="modal-sub-title">
        <i class="iconfont icon-ic-remind"></i>
      <span>确认要删除该商品吗？</span>
    </div>
    <div class="modal-footer">
        <div class="submit-new js-modal-submit-new">确定</div>
        <div class="cancel-new js-modal-cancel-new">取消</div>
    </div>
    <div class="js-close-btn close-btn">×</div>
</div>


</body>
</html>
