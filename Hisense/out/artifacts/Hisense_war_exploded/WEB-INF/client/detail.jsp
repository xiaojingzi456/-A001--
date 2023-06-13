<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
  <meta http-equiv="content-type" content="text/html; charset=utf-8">
  <title>商品详情页面</title>
  <meta name="description" content="商城为您提供海信75寸电视、电视 商城、激光电视等相关信息。">
  <meta name="keywords" content="激光电视,75寸电视,75寸电视尺寸 品牌,网上电器商城"/>
  <%--<link rel="stylesheet" href="<%=request.getContextPath()%>/static/js/detail/css/bootstrap.css"/>--%>

    <%--<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap.css">--%>
    <%--<link rel="stylesheet" href="<%=request.getContextPath()%>/static/js/cart/component.css">--%>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/vendor-b0dfc7.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/eevee-layout-677c65.css">
  <!-- pokeball iconfont -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/font_1466485617_047616.css"/>

  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/font_72064_8d6mr7huygmn29.css"/>

  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/font_844587_t32m3dyr45.css"/>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/share.min-945ba4.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/app-front-di.css"/>

  <script src="<%=request.getContextPath()%>/static/jsjar/jquery-1.12.3.js" type="text/javascript"
          charset="utf-8"></script>
  <script src="<%=request.getContextPath()%>/static/js/detail.js" type="text/javascript" charset="utf-8"></script>
  <script src="<%=request.getContextPath()%>/static/js/jquery.jqzoom1.js" type="text/javascript"
          charset="utf-8"></script>
  <script src="<%=request.getContextPath()%>/static/js/fangdaj.js" type="text/javascript" charset="utf-8"></script>
  <script src="<%=request.getContextPath()%>/static/js/detail/detaildynamic.js"></script>
  <script src="<%=request.getContextPath()%>/static/jsjar/template-web.js"></script>

  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/inport.css"/>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/app-front-dy.css">
</head>
<body style="background-color: #ffffff;">
<!-- 右边小功能按钮 -->
<div class='component-right-bottom-nav eve-component' data-comp-path='common/right_bottom_nav'>
  <ul class="crbm-ul">
    <li title="购物车">
      <a onclick="_smq.push(['custom', '全站', '右侧悬浮栏', '购物车']);">
        <i class="iconfont icon-ic-cart"></i>
        <div class="bottom-tip">购物车</div>
        <div class="cart-num single js-bottom-cart-num hide">0</div>
      </a>
    </li>
    <li class="js-open-kefu" title="客服">
      <a href="javascript:;" onclick="_smq.push(['custom', '全站', '右侧悬浮栏', '在线客服']);">
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
      <a href="javascript:void(0);">
        <i class="iconfont icon-huidaodingbujiantou"></i>
        <div class="bottom-tip">返回顶部</div>
      </a>
    </li>
  </ul>
</div>


<!-- 详情页 -->
<div class="eve-page-part">
  <!-- 详情页最外层 -->
  <div class="eve-grid-auto eve-col-align-center" style="background-color:#f7f7f7;">
    <!-- top -->
    <div class="eve-row">
      <div class="eve-col-cu eve-col-align-center" style="width:100%;background-color:#fff;">
        <div class="eve-row">
          <div class="eve-col-cu eve-col-align-center" style="width:1188px;">
            <div class="eve-component">
              <div class='item-detail js-comp clearfix eve-component' data-comp-name='商品详情主信息'
                   data-comp-path='shop_design/item_detail'>

                <div style="display:none;" class="promotion-order-success-message js-promotion-order-success-message">
                  <div class="posm-content">
                    <i class="iconfont icon-xuanze-yixuan"></i>
                    <span>预约送券活动领取成功!</span>
                    <a href="/user/coupons?usedState=1">查看优惠券</a>
                  </div>
                  <div class="posm-close js-posm-close"><i class="iconfont icon-ic-close"></i></div>
                </div>
                <div class="item-detail-left" id="js-item-detail-left" data-video-id="186">
                  <div class="image-manage" data-item-detail="" data-user="null">
                    <div class="main-image-wrapper">
                      <!-- 大图区域 -->
                      <a id="preview" class="main-image js-main-image-container zoom" href="">

                        <img alt="" jqimg="<%=request.getContextPath()%>/static/image/details/tv-b1.png"
                             src="<%=request.getContextPath()%>/static/image/details/${commodity.copicture}" class="js-main-image"
                             width="550"
                             height="550"/>
                      </a>
                      <a class="display-icon-wrapper js-toggle-video">
                        <img class="play-pc-btn" src="<%=request.getContextPath()%>/static/image/details/play-pc.png"
                             title="播放">
                      </a>
                    </div>

                    <div class="carousel-wrap item-carousel-wrap">
                      <div class="carousel show">
                        <ul class="images carousel-container clearfix" style="width: 864px;">
                          <c:forEach var="coPictrue" items="${commodity.commoditypictures}">
                          <li style="width: 96px;" class="selected">
                            <img class="thumbnail"
                                 src="<%=request.getContextPath()%>/static/image/details/${coPictrue.cpictures}" alt="" data-src=""/>
                          </li>
                          </c:forEach>

                        </ul>
                      </div>
                      <a style="display:block;" class="prev outside disabled" href="javascript:void(0);"><i
                              class="icon-pokeball icon-pokeball-left"></i></a>
                      <a style="display:block;" class="next outside disabled" href="javascript:void(0);"><i
                              class="icon-pokeball icon-pokeball-right"></i></a>
                    </div>

                  </div>
                </div>

                <div class="item-detail-right" id="js-item-detail-right">
                  <div class="item-title" data-id="3490" data-status="1">
                    <div class="share-container">
                      <div></div>
                      <div class="share-and-favourite">
                        <a href="javascript:;" class="js-show-share">
                          <i class="iconfont icon-ic-share"></i>
                        </a>
                        <div id="item-main-share" style="display: none;" class="share-pop">
                        </div>
                      </div>
                    </div>
                    <h1 title="【新品上市】" id="js-item-name" class="has-advertise">
                      ${commodity.comodel}${commodity.coname}</h1>
                    <!-- 详情字体 -->
                    <h3>
                      <div>
                        活动价7999元!爆款热销中!购机前10名赠送1285元礼包（麦克风+视频年卡+教育年卡）/本机参加以下活动，购机前请详细阅读
                        <a href="">活动规则</a>
                        <br>
                        <div>
                          <div>
                            ①参加7-9日10点指定型号购机全场前15单返300元；参加6-9日21:00-21:30指定型号购机各瓜分5000元；
                            <br>②
                            <a href="">点此</a>抢拼券礼包，
                            跨品类套购返100/200/300/500元现金补贴、赚积分兑好礼；
                          </div>
                        </div>
                      </div>
                      <div>
                        <div>
                          <div>
                            <div>
                              ③晒图评价咨询客服有惊喜~
                              <a href="">更多电视精品&gt;&gt;</a>
                              <br>
                              <a href="">查看85英寸同款【85E7F】</a>
                              <br>
                            </div>
                            <div>
                              30天保价+送货入户保障+官方正品
                            </div>
                          </div>
                        </div>
                      </div>
                    </h3>
                    <br/>

                  </div>
                  <div data-warmupSkuPromotion="null"></div>
                  <input type="hidden" name="warmupPromotionId" value="">

                  <input type="hidden" name="hasFreeMix" data-hasfreemix="false">
                  <div class="item-info">
                    <ul class="item-info-list ">
                      <li class="price-li ui2-price">
							<span class="item-price">
								<span id="js-item-price" class="price" data-range="7999">
									${commodity.coprice}
								</span>
								<span class="ui2-price-extra">
								  <span class="ui2-price-high">${commodity.disprice}</span>
                                  <span>已售${commodity.csold}台</span>
								</span>
							</span>

                        <div class="reminder-wrapper">
                          <a class="reduce-notice js-reduce-notice reminder-btn ui2-reminder" data-promotions="[]"><i
                                  class="iconfont icon-ic-reduced"></i>
                            降价提醒</a>
                        </div>
                      </li>
                      <div class="promotion-stage-wrapper js-promotion-stage-wrapper hide"></div>

                      <li style="border-bottom-color: #eee" class="promotion-li no-pd hide" data-info="[]">
                        <div class="promotion-wrapper">
                          <label class="first-line vl-t">促销</label>
                          <div class="promotion-container">

                          </div>
                        </div>
                      </li>


                    </ul>
                  </div>

                  <li id="delay-service-li">
                  </li>

                  <div id="service-list" class="right-li">
                    <div class="r-li-title commitment">承诺</div>
                    <div class="r-li-content commitment">
                      <div class="commitment-iw">
                        <div class="commitment-i">
                          <img src="<%=request.getContextPath()%>/static/image/picture/02b77296-fd17-4d60-8c17-7322a854a26a.png"
                               alt="">
                          <span>30天保价</span>
                        </div>
                        <div class="commitment-i">
                          <img src="<%=request.getContextPath()%>/static/image/picture/08fc8a88-d2f1-48bd-b69f-db29de5db8bd.png"
                               alt="">
                          <span>七天无理由</span>
                        </div>
                        <div class="commitment-i">
                          <img src="<%=request.getContextPath()%>/static/image/picture/0a7b8637-d85d-459a-a860-5e16161fb9af.png"
                               alt="">
                          <span>全场包邮</span>
                        </div>
                        <div class="commitment-i">
                          <img src="<%=request.getContextPath()%>/static/image/picture/27459f6f-5129-4ff3-9082-7365c067bde8.png"
                               alt="">
                          <span>全国联保</span>
                        </div>
                        <div class="commitment-i">
                          <img src="<%=request.getContextPath()%>/static/image/picture/0d1860a9-33ee-44e3-9f14-3de665220f9c.png"
                               alt="">
                          <span>电子发票</span>
                        </div>
                      </div>
                      <div class="rlc-r">
                        <i class="iconfont icon-ic-drop ui2icon-arrow-more"></i>
                      </div>
                    </div>
                    <div class="promotionBox service-box js-service-box" style="display:none;">
                      <div class="service-item-title">30天保价</div>
                      <div class="service-item-content">
                        由于网络购物的商品价格会随市场价格的波动而波动，每天都会有涨价、降价和促销优惠等变化。鉴于以上特点，商城向买家提供价格保护政策，即：买家成功提交订单后30日内（提交订单当天为第一天），如订单内商品降价，买家可通过商城在线客服申请价格保护。具体规则详见帮助中心“价格保护30天”。
                      </div>
                      <div class="service-item-title">七天无理由退货</div>
                      <div class="service-item-content">
                        为保障您的消费权益，海信商城将严格按国家工商行政管理总局颁布的《网络购买商品七日无理由退货暂行办法》依法履行七日无理由退货义务。具体规则详见帮助中心“7天无理由退货保障”。
                      </div>
                      <div class="service-item-title">全场包邮</div>
                      <div class="service-item-content">
                        海信商城所售商品全国免费包邮。部分偏远地区除外，如新疆、西藏等偏远、物流不发达地区除外。详情可在帮助中心“物流配送”中查询。
                      </div>
                      <div class="service-item-title">全国联保</div>
                      <div class="service-item-content">
                        海信商城的所有商品都支持全国联保服务。如您想查询海信的售后网点、产品三包政策与相关收费标准，可通过“海信在线”微信公众号进行查询或拨打海信售后热线4006-111-111进行咨询。
                      </div>
                      <div class="service-item-title">电子发票</div>
                      <div class="service-item-content">
                        电子发票是由电子发票服务平台生成的数字证明信息，是经过税务系统认证的，与传统纸质发票具有同等法律效应，可做为用户报销，维权，保修的有效凭证；同时还具有易保存、易查找的优点。电子发票相关说明详见帮助中心“支付/发票”中查询。
                      </div>


                    </div>
                  </div>

                  <div class="ui2-address-box" data-item="3490" data-levels="4">
                    <div class="a-left"><i class="iconfont icon-xiangqing-dizhi"></i></div>
                    <div class="address-select-label">
                      <div class="address-select-wrap">
                        <div class='js-comp common-address-select-group-container eve-component'
                             data-comp-path='common/hisense_address_group'>
                          <div class="common-address-group-text js-text" data-init="">
                            <a class="content cutwords" style="height: 25px;">
                              <!-- <span>山东</span><span>青岛市</span><span>市南区</span><span></span> -->
                              <div class="addressDiv">
                                <input class="input" name="" id="city" type="text" placeholder="请选择地址" value="北京市/朝阳区" autocomplete="off" readonly="true">
                                <s></s>
                              </div>
                            </a>

                            <!-- 地址js -->
                            <script type="text/javascript">
                              $("#city").click(function (e) {
                                SelCity(this,e);
                              });
                              $("s").click(function (e) {
                                SelCity(document.getElementById("city"),e);
                              });
                            </script>
                            <script src="${pageContext.request.contextPath}/static/js/adress/city.json.js" type="text/javascript" charset="utf-8"></script>
                            <script src="${pageContext.request.contextPath}/static/js/adress/citySet.js" type="text/javascript" charset="utf-8"></script>
                            <script src="${pageContext.request.contextPath}/static/js/adress/Popt.js" type="text/javascript" charset="utf-8"></script>

                            <i class="iconfont icon-ic-drop"></i>
                            <div class="attach hide js-attach"></div>
                          </div>
                        </div>
                      </div>
                      <div id="addressState" class="ui2-stock-warn js-ui2-stock-warn instock">现货</div>
                    </div>
                  </div>

                  <div class="item-skus">
                    <a href="javascript:void(0);" class="close-warning" style="display:none;"><span
                            class="close-warning-text">请勾选您要选择的商品信息</span><span
                            class="close-warning-icon">×</span></a>
                    <ul id="choose">
                      <li id="choose-amount">
                        <div class="control-group">
                          <div class="ui2-ca-title" for="input-name">选择数量</div>
                          <div class="controls">
                            <div class="input-amount js-item-stock-quantity group-small" data-max="1037">
                              <input type="hidden" name="coid" value="${commodity.coid }">
                              <a href="javascript:void(0);" class="minus">-</a>
                              <input type="number" name="canumber" class="count-number" id="item-quantity" data-old="1"
                                     data-max-stock="" value="1">
                              <a href="javascript:void(0);" class="plus">+</a>
                            </div>&nbsp;&nbsp;&nbsp;
                                <span class="total-stock js-total-stock">
								  <span class="item-quantity " id="js-item-stock" data-stock="1037">

								  </span>
								</span>
                          </div>
                        </div>
                      </li>

                      <li id="sale-count" style="display:none;">
                        <div class="control-group">
                          <label class="dt sku-items-label">累积销量</label>
                          <div class="controls">
                            46
                          </div>
                        </div>
                      </li>

                      <li id="choose-btns">
                        <%--<button class="btn btn-primary js-buy-now ui2-add-cart js-add-cart" type="button">立即购买</button>--%>
                        <button class="btn btn-primary arrival-notice js-arrival-notice hide">到货通知</button>
                        <button class="btn btn-secondary js-add-cart ui2-add-cart" type="button">加入购物车</button>
                        <span class="warning-words required"
                              style="display:none;">请勾选您要的商品信息</span>
                        <span class="stock-empty hide required">商品库存不足，请选择其他商品</span>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="eve-row">
              <div class="eve-col-cu eve-hide" style="width:1188px;">
                <div class="eve-component">
                  <div class='eve-image js-comp eve-component' data-comp-name='图片' data-comp-path='eevee/image'>
                    <div class="animated image-content element " style="
    overflow:hidden;
    
    
    " data-animate=""
                         data-aniDuration="" data-aniDelay="" data-paramode="" data-paraTop="">
                      <a class="js-link-page" data-href="/special_activity_page/zhc2018.html" data-blank=""
                         data-is-login-modal=""
                         title="" style="
      ">
                        <div class="image-container" style="
      
      
      ">
                          <img class="image-img" alt="" title="" style="width: 100%"
                               data-original="<%=request.getContextPath()%>/static/image/picture/35adc55d-b57d-48c8-9528-edb365bdf298.jpg">
                        </div>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- bottom -->
    <div class="eve-row">
      <div class="eve-col-cu eve-col-align-center" style="width:1188px;margin-top:24px;margin-bottom:60px;">
        <div class="eve-row">
          <div class="eve-col-cu eve-col-align-center" style="width:1188px;">
            <div class="eve-component">
              <div class='free-mixed js-comp clearfix eve-component' data-comp-name='随心配商品详情页展示组件'
                   data-comp-path='shop_design/free_mixed'>
                <div class="free-mix hide">
                  <div class="free-title">
                    <span>随心配</span>
                  </div>
                  <div class="free-content"></div>
                </div>
                <input type="hidden" name="addressId" data-address="370202">

              </div>
            </div>
            <div class="eve-row">
              <div class="eve-col-cu" style="width:1188px;">
                <div class="eve-component">
                  <div class='tab component-spu-tab js-comp eve-component' data-comp-name='商品详情（详情页、评价等）'
                       data-comp-path='shop_design/spu_tab'>
                    <ul class="tab-navs clearfix ui2-tab" data-item="3490" >
                      <li data-role="nav" class="active" data-name="图片详情">
                        <a href="javascript:;">图片详情</a>
                      </li>

                      <li data-role="nav" class="comment-tab-li" id="evaluate" data-name="商品评价">
                        <a href="javascript:;">评价
                          <span class="comment-total">（0）</span>
                        </a>
                      </li>
                      <li data-role="nav" data-name="包装及参数"><a href="javascript:;">包装及参数</a></li>
                      <li data-role="nav" data-name="服务"><a href="javascript:;">服务</a></li>
                      <li class="pull-right">
                        <button class="btn btn-primary spu-buy-now js-buy-now hide">立即购买</button>
                      </li>
                    </ul>
                    <div class="tab-float-background clearfix"></div>
                    <%-- 图片介绍模板引擎 --%>
                    <script type="text/html" id="detailIMGtemplate">
                      {{each data.commoditydetails value i}}
                        <p style="text-align: center">
                        <img src="<%=request.getContextPath()%>/static/image/picture/{{value.commoditydetail}}"
                              title="详情图片"></p>

                      {{/each}}
                      <p><br></p>
                    </script>
                    <%-- 评论 --%>
                    <script type="text/html" id="evaluatemplate">
                      {{each data value i}}
                      <li class="comments-li " data-id="" style="">
                        <div class="comment-user">
                          <img src="<%=request.getContextPath()%>/static/image/details/{{value.user.uportrait}}" alt="">
                        </div>
                        <div class="comment-info-container">
                          <div class="buyer-comment comment-box last">
                            <div class="ui2-comment-header">
                              <span class="comment-user-name">{{value.user.uname}}</span>
                              <div class="star-row">
                                <%--{{each value.num as i }}--%>
                                {{ if value.num == 1 }}
                                <i name="describe" class="i-star icon-feebas icon-feebas-star active"
                                   data-value="1"></i>
                                {{ else if value.num == 2}}
                                <i name="describe" class="i-star icon-feebas icon-feebas-star active"
                                   data-value="1"></i>
                                <i name="describe" class="i-star icon-feebas icon-feebas-star active"
                                   data-value="2"></i>
                                {{ else if value.num == 3}}
                                <i name="describe" class="i-star icon-feebas icon-feebas-star active"
                                   data-value="1"></i>
                                <i name="describe" class="i-star icon-feebas icon-feebas-star active"
                                   data-value="2"></i>
                                <i name="describe" class="i-star icon-feebas icon-feebas-star active"
                                   data-value="3"></i>
                                {{ else if value.num == 4}}
                                <i name="describe" class="i-star icon-feebas icon-feebas-star active"
                                   data-value="1"></i>
                                <i name="describe" class="i-star icon-feebas icon-feebas-star active"
                                   data-value="2"></i>
                                <i name="describe" class="i-star icon-feebas icon-feebas-star active"
                                   data-value="3"></i>
                                <i name="describe" class="i-star icon-feebas icon-feebas-star active"
                                   data-value="4"></i>
                                {{ else if value.num == 5}}
                                <i name="describe" class="i-star icon-feebas icon-feebas-star active"
                                   data-value="1"></i>
                                <i name="describe" class="i-star icon-feebas icon-feebas-star active"
                                   data-value="2"></i>
                                <i name="describe" class="i-star icon-feebas icon-feebas-star active"
                                   data-value="3"></i>
                                <i name="describe" class="i-star icon-feebas icon-feebas-star active"
                                   data-value="4"></i>
                                <i name="describe" class="i-star icon-feebas icon-feebas-star active"
                                   data-value="5"></i>
                                {{/if}}
                              </div>
                            </div>
                            <div class="date-row">{{value.etime}}</div>
                            <div class="context-row">{{value.econtent}}</div>
                            <%-- 图片 --%>
                            <ul class="comment-extra gallery clearfix">
                              <%--<li><img class="comment-img"
                                       src="">
                              </li>--%>
                            </ul>
                          </div>

                        </div>
                      </li>
                      {{/each}}
                      <div class="pagination comments-pagination">
                        <div class="pagination"><label class="total" style="display: none;">共5项,</label><label
                                class="size" style="display: none;">每页显示:</label>
                          <div class="selectric-wrapper" style="display: none;">
                            <div class="selectric-hide-select"><select tabindex="-1" style="">
                              <option value="10">10</option>
                              <option value="20" selected="">20</option>
                              <option value="30">30</option>
                              <option value="40">40</option>
                              <option value="50">50</option>
                            </select>
                            </div>

                            <div class="selectric"><span class="label">20</span><b class="button">▾</b></div>
                            <input class="selectric-input" tabindex="0"></div>
                          <span class="current prev" rel="prev"><i
                                  class="icon-pokeball icon-pokeball-prev"></i></span><span class="current">1</span><span
                                  class="current next" rel="next"><i
                                  class="icon-pokeball icon-pokeball-next"></i></span>
                          <div class="handler" style="display: none;"><input type="text" name="go-page">
                            <button class="btn" type="button">Go</button>
                          </div>
                        </div>
                      </div>

                    </script>
                    <div class="tab-contents clearfix">

                      <div data-role="content" class="tab-content">
                        <div class="spu-tab-item-detail" id="detailIMG">

                        </div>
                      </div>
                      <div data-role="content" class="tab-content comments-content clearfix ui2-tab-content" style="display: none;">
                        <div class="js-total-comment">
                          <div class="comment-header">
                            <div class="ranking-wrapper clearfix">
                              <span class="label">好评度</span>
                              <div class="ranking-counts js-counts">100%</div>
                            </div>
                            <div class="tag-list-wrapper js-tag-list clearfix">
                              <ul class="tags-ul clearfix js-tag-ul">
                                <li data-extra="all" data-id="" class="active ">全部(<span
                                        class="js-all-comment-count">5</span>)
                                </li>
                                <li data-extra="hasdisplay" data-id="">晒图(<span
                                        class="js-display-comment-count">2</span>)
                                </li>
                                <li data-extra="haspursue" data-id="">追评(<span class="js-pursue-comment-count">0</span>)
                                </li>
                                <li data-id="323">送货快(3)</li>
                                <li data-id="317">美观大气(3)</li>
                                <li data-id="326">值得拥有(2)</li>
                                <li data-id="325">质量好(2)</li>
                                <li data-id="324">安装服务好(2)</li>
                                <li data-id="321">易于操作(2)</li>
                                <li data-id="322">性价比高(2)</li>
                                <li data-id="320">音质出众(2)</li>
                                <li data-id="319">颜色纯正(2)</li>
                                <li data-id="318">画面清晰(2)</li>
                              </ul>
                            </div>
                          </div>
                        </div>
                        <ul class="comments-ul">

                        </ul>
                      </div>
                      <div data-role="content" class="tab-content " style="display: none;">
                        <div class="attribute-list js-attribute-container">
                          <div class="ui2-user-tip">
                            <div class="tip-icon"><i class="iconfont icon-ic-logo-info"></i></div>
                            <div class="tip-content">
                              <strong>温馨提示：</strong>因厂家技术不断更新，商城在售产品的包装、产地、性能参数和配件等信息不定期变更，商品详情仅供参考，请您以实物为准。如有疑问，请咨询在线客服，给您带来不便，敬请谅解！
                            </div>
                          </div>
                          <div class="ui2-attr-group">
                            <div class="ui2-attr-group-title">
                              普通信息


                            </div>
                            <div class="attr-group-content">
                              <div class="attr-group-item">
																		<span class="attr-group-item-title">
																			尺寸
																			: &nbsp;
																		</span>
                                <span class="attr-group-item-value">75英寸</span>
                              </div>
                              <div class="attr-group-item">
																		<span class="attr-group-item-title">
																			全面屏
																			: &nbsp;
																		</span>
                                <span class="attr-group-item-value">是</span>
                              </div>
                              <div class="attr-group-item">
																		<span class="attr-group-item-title">
																			大屏
																			: &nbsp;
																		</span>
                                <span class="attr-group-item-value">是</span>
                              </div>
                              <div class="attr-group-item">
																		<span class="attr-group-item-title">
																			AI声控
																			: &nbsp;
																		</span>
                                <span class="attr-group-item-value">是</span>
                              </div>
                              <div class="attr-group-item">
																		<span class="attr-group-item-title">
																			超薄
																			: &nbsp;
																		</span>
                                <span class="attr-group-item-value">是</span>
                              </div>
                              <div class="attr-group-item">
																		<span class="attr-group-item-title">
																			包装清单
																			: &nbsp;
																		</span>
                                <span class="attr-group-item-value">使用说明书*1，遥控器*1，电源线*1，音视频转接线*1 ,底座*2，螺钉*4，电池*2</span>
                              </div>
                            </div>
                          </div>
                          <div class="ui2-attr-group">
                            <div class="ui2-attr-group-title">
                              产品尺寸(mm)
                            </div>
                            <div class="attr-group-content">
                              <div class="attr-group-item">
																		<span class="attr-group-item-title">
																			含底座尺寸 (长*高*厚）
																			: &nbsp;
																		</span>
                                <span class="attr-group-item-value">1677×1055×368mm</span>
                              </div>
                              <div class="attr-group-item">
																		<span class="attr-group-item-title">
																			不含底座尺寸 (长*高*厚）
																			: &nbsp;
																		</span>
                                <span class="attr-group-item-value">1677×961×76mm</span>
                              </div>
                            </div>
                          </div>
                          <div class="ui2-attr-group">
                            <div class="ui2-attr-group-title">
                              硬件
                            </div>
                            <div class="attr-group-content">
                              <div class="attr-group-item">
																		<span class="attr-group-item-title">
																			存储（ROM)
																			: &nbsp;
																		</span>
                                <span class="attr-group-item-value">32GB</span>
                              </div>
                              <div class="attr-group-item">
																		<span class="attr-group-item-title">
																			内存（RAM)
																			: &nbsp;
																		</span>
                                <span class="attr-group-item-value">2GB</span>
                              </div>
                              <div class="attr-group-item">
																		<span class="attr-group-item-title">
																			CPU
																			: &nbsp;
																		</span>
                                <span class="attr-group-item-value">四核 CA53 定频1.2GHz 64位处理器</span>
                              </div>
                              <div class="attr-group-item">
																		<span class="attr-group-item-title">
																			GPU
																			: &nbsp;
																		</span>
                                <span class="attr-group-item-value">2核 Mali G51</span>
                              </div>
                            </div>
                          </div>
                          <div class="ui2-attr-group">
                            <div class="ui2-attr-group-title">
                              网络连接
                            </div>
                            <div class="attr-group-content">
                              <div class="attr-group-item">
																		<span class="attr-group-item-title">
																			网络
																			: &nbsp;
																		</span>
                                <span class="attr-group-item-value">支持</span>
                              </div>
                            </div>
                          </div>
                          <div class="ui2-attr-group">
                            <div class="ui2-attr-group-title">
                              机身接口
                            </div>
                            <div class="attr-group-content">
                              <div class="attr-group-item">
																		<span class="attr-group-item-title">
																			输入
																			: &nbsp;
																		</span>
                                <span class="attr-group-item-value">有线/天线输入*1；USB2.0*1；USB3.0*1；音视频输入*1；HDMI2.0*2（一路支持ARC）；网口*1</span>
                              </div>
                            </div>
                          </div>
                          <div class="ui2-attr-group">
                            <div class="ui2-attr-group-title">
                              能效
                            </div>
                            <div class="attr-group-content">
                              <div class="attr-group-item">
																		<span class="attr-group-item-title">
																			整机功率
																			: &nbsp;
																		</span>
                                <span class="attr-group-item-value">230W</span>
                              </div>
                              <div class="attr-group-item">
																		<span class="attr-group-item-title">
																			能效等级
																			: &nbsp;
																		</span>
                                <span class="attr-group-item-value">1/2级能效</span>
                              </div>
                            </div>
                          </div>
                          <div class="ui2-attr-group">
                            <div class="ui2-attr-group-title">
                              屏幕
                            </div>
                            <div class="attr-group-content">
                              <div class="attr-group-item">
																		<span class="attr-group-item-title">
																			背光源
																			: &nbsp;
																		</span>
                                <span class="attr-group-item-value">E-LED</span>
                              </div>
                              <div class="attr-group-item">
																		<span class="attr-group-item-title">
																			分辨率
																			: &nbsp;
																		</span>
                                <span class="attr-group-item-value">3840*2160</span>
                              </div>
                            </div>
                          </div>
                          <div class="ui2-attr-group">
                            <div class="ui2-attr-group-title">
                              内容资源
                            </div>
                            <div class="attr-group-content">
                              <div class="attr-group-item">
																		<span class="attr-group-item-title">
																			内容方
																			: &nbsp;
																		</span>
                                <span class="attr-group-item-value">爱奇艺</span>
                              </div>
                            </div>
                          </div>
                          <div class="ui2-attr-group">
                            <div class="ui2-attr-group-title">
                              软件功能
                            </div>
                            <div class="attr-group-content">
                              <div class="attr-group-item">
																		<span class="attr-group-item-title">
																			语音控制
																			: &nbsp;
																		</span>
                                <span class="attr-group-item-value">Vidaa AI</span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div data-role="content" class="tab-content " style="display: none;">
                        <div class="spu-tab-item-detail">
                          <p style="text-align: center;"><img
                                  src="<%=request.getContextPath()%>/static/image/picture/fdfb4818-6270-469b-9d52-a10a3ef4fcd7.jpg"
                                  title="790-购买须知-电视_02.jpg"/></p>
                          <p style="text-align: center;"><img
                                  src="<%=request.getContextPath()%>/static/image/picture/c5207974-b914-403b-8f1c-97fb015a18ee.jpg"
                                  title="790-购买须知-电视_03.jpg"/></p>
                          <p style="text-align: center;"><img
                                  src="<%=request.getContextPath()%>/static/image/picture/1ae0251c-77e1-4109-add9-3fa866b3e805.jpg"
                                  title="790-购买须知-电视_04.jpg"/></p>
                          <p style="text-align: center;"><img
                                  src="<%=request.getContextPath()%>/static/image/picture/e44b4e9f-e3b6-4f93-a972-0933aa612d09.jpg"
                                  title="790-购买须知-电视_05.jpg"/></p>
                          <p style="text-align: center;"><img
                                  src="<%=request.getContextPath()%>/static/image/picture/6708f948-b723-4533-92ee-7f9793d3c4a7.jpg"
                                  title="790-购买须知-电视_06.jpg"/></p>
                          <p style="text-align: center;"><img
                                  src="<%=request.getContextPath()%>/static/image/picture/03be96fb-3b37-4633-bcd2-f781c436db31.jpg"
                                  title="790-购买须知-电视_07.jpg"/></p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<%-- 添加成功模态框 --%>
<div class="modal modal-shopping-cart" style="z-index: 999; top: 599px; left: 490px;display: none;">
  <div class="close-btn">
    ×
  </div>
  <div class="modal-shopping-head">
    <img src="${pageContext.request.contextPath}/static/image/details/cart-success.png">
    <div class="modal-shopping-title">新商品已加入到购物车中</div>
  </div>
  <div class="modal-dialog-footer">
    <a class="btn btn-success white-a js-jump-cart" href="<%=request.getContextPath()%>/client/CartServlet?method=getCart" data-id="2432">查看购物车</a>
    <!-- --><a class="close">继续购物</a>
  </div>
</div>


<%--<script src="<%=request.getContextPath()%>/static/js/cart/js/classie.js"></script>
<script src="<%=request.getContextPath()%>/static/js/cart/js/modalEffects.js"></script>--%>

</body>
</html>
