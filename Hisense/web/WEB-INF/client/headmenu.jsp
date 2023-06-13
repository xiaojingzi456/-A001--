<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<div id="">--%>
<%--  <img src="<%=request.getContextPath()%>/static/image/home/45873d18-17f2-46af-a7dc-a20b176faa8f.jpg" class="img-fluid"--%>
<%--       alt="">--%>
<%--</div>--%>
<div class='component-ceiling js-comp eve-component'>
  <div class="navbar navbar-top js-navbar-top">
    <div class="navbar-collapse clearfix" style="width: 1188px;">

      <ul class="navbar-left-ul pull-left">
        <li>
          <span class="link-hisense-official"></span>
        </li>
      </ul>

      <ul class="navbar-right-ul">
        <c:if test="${user==null}">
          <li class="nav-item hover-primary">
            <a href="<%=request.getContextPath()%>/controller?method=login" class="log-in" id="js-login-in" onclick="">登录</a>
          </li>
          <li class="nav-item hover-primary">
            <a href="<%=request.getContextPath()%>/controller?method=register" id="js-user-register" onclick="">注册</a>
          </li>
        </c:if>
        <c:if test="${user!=null}">
          <li class="nav-item hover-primary">
            <a href="<%=request.getContextPath()%>/controller?method=personal" class="log-in"  onclick="">${user.uphone}</a>
          </li>
          <li class="nav-item hover-primary">
            <a href="<%=request.getContextPath()%>/user?method=logout" onclick="">退出</a>
          </li>
          <li class="nav-item hover-primary">
            <a href="<%=request.getContextPath()%>/controller?method=personal" onclick="">个人中心</a>
          </li>
        </c:if>
        <li class="nav-item">
          <a href="/buyer/message" onclick="">
            消息中心
          </a>
        </li>
        <li class="nav-item">
          <a href="/helps">帮助中心</a>
        </li>
        <li class="nav-item">
          <a href="/special_activity_page/ecpx">外部合作</a>
        </li>
        <li class="nav-item">
          <i class="iconfont icon-ic-cart"></i>
          <a rel="nofollow" href="<%=request.getContextPath()%>/client/CartServlet?method=getCart" onclick="_smq.push(['custom', '全站页面顶部', '顶部', '购物车']);"> 购物车</a>
        </li>
      </ul>
    </div>
  </div>
</div>
<div id="t-h">
  <div class="t-2-1190">
    <div class="t-w-1026">
      <ul>
        <li><a href="<%=request.getContextPath()%>/controller?method=home">官网</a></li>
        <li style="position: relative;"><a
                href="">冰爽节</a><span
                class="item-tag">HOT</span></li>
        <li class="t-ds">
          <a href="">电视</a>
          <div class="t-h-288">
            <div class="w-w-1188">
              <div class="t-h-l">
                <ul class="t-ul-l">
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/87eb1729-99ed-4353-b1f4-fab8a4860258.png"
                          alt=""><span>75英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/cd8bc8d3-4e36-41e5-9219-640bd8ff2de4.png"
                          alt=""><span>60英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/e37ac76d-56b9-407e-8b67-08583b09f6e5.png"
                          alt=""><span>50英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/95e6efea-e48a-4732-a1af-0093c648c81c.png"
                          alt=""><span>55英寸</span></a></li>
                </ul>
                <ul class="t-ul-l">
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/87eb1729-99ed-4353-b1f4-fab8a4860258.png"
                          alt=""><span>75英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/cd8bc8d3-4e36-41e5-9219-640bd8ff2de4.png"
                          alt=""><span>60英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/e37ac76d-56b9-407e-8b67-08583b09f6e5.png"
                          alt=""><span>50英寸</span></a></li>
                  <li><a href=""><span class="t-w-94">进入频道&nbsp;&nbsp;> </span></a></li>
                </ul>
              </div>
              <div class="t-h-r">
                <ul class="t-ul-l  t-h-130">
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/6d675799-7f31-4a68-af55-f27a5fea5667.png"
                           alt="">
                      <div class="t-w-20">
                        <span style="">55英寸/无边全面屏/4K HDR/AI语音/8GB大存储电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/63ef04fa-0aff-4a89-8d43-e85a97b4c791.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/无边全面屏/MEMC防抖/16GB大存储电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/9af8e2dd-09f5-46c5-b89f-ec0bfdeb13b4.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/超薄全面屏/MEMC防抖/2GB+32GB电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/47eee20e-82b8-4fa3-9f55-f603cdf9e610.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/超薄全面屏/MEMC防抖/2GB+32GB电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </li>
        <li class="t-jg">
          <a href="">激光</a>
          <div class="t-h-288">
            <div class="w-w-1188">
              <div class="t-h-l">
                <ul class="t-ul-l">
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/87eb1729-99ed-4353-b1f4-fab8a4860258.png"
                          alt=""><span>75英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/cd8bc8d3-4e36-41e5-9219-640bd8ff2de4.png"
                          alt=""><span>60英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/e37ac76d-56b9-407e-8b67-08583b09f6e5.png"
                          alt=""><span>50英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/95e6efea-e48a-4732-a1af-0093c648c81c.png"
                          alt=""><span>55英寸</span></a></li>
                </ul>
                <ul class="t-ul-l">
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/87eb1729-99ed-4353-b1f4-fab8a4860258.png"
                          alt=""><span>75英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/cd8bc8d3-4e36-41e5-9219-640bd8ff2de4.png"
                          alt=""><span>60英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/e37ac76d-56b9-407e-8b67-08583b09f6e5.png"
                          alt=""><span>50英寸</span></a></li>
                  <li><a href=""><span class="t-w-94">进入频道&nbsp;&nbsp;> </span></a></li>
                </ul>
              </div>
              <div class="t-h-r">
                <ul class="t-ul-l  t-h-130">
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/6d675799-7f31-4a68-af55-f27a5fea5667.png"
                           alt="">
                      <div class="t-w-20">
                        <span style="">55英寸/无边全面屏/4K HDR/AI语音/8GB大存储电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/63ef04fa-0aff-4a89-8d43-e85a97b4c791.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/无边全面屏/MEMC防抖/16GB大存储电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/9af8e2dd-09f5-46c5-b89f-ec0bfdeb13b4.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/超薄全面屏/MEMC防抖/2GB+32GB电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/47eee20e-82b8-4fa3-9f55-f603cdf9e610.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/超薄全面屏/MEMC防抖/2GB+32GB电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>

        </li>
        <li class="t-kt">
          <a href="">空调</a>
          <div class="t-h-288">
            <div class="w-w-1188">
              <div class="t-h-l">
                <ul class="t-ul-l">
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/87eb1729-99ed-4353-b1f4-fab8a4860258.png"
                          alt=""><span>75英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/cd8bc8d3-4e36-41e5-9219-640bd8ff2de4.png"
                          alt=""><span>60英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/e37ac76d-56b9-407e-8b67-08583b09f6e5.png"
                          alt=""><span>50英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/95e6efea-e48a-4732-a1af-0093c648c81c.png"
                          alt=""><span>55英寸</span></a></li>
                </ul>
                <ul class="t-ul-l">
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/87eb1729-99ed-4353-b1f4-fab8a4860258.png"
                          alt=""><span>75英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/cd8bc8d3-4e36-41e5-9219-640bd8ff2de4.png"
                          alt=""><span>60英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/e37ac76d-56b9-407e-8b67-08583b09f6e5.png"
                          alt=""><span>50英寸</span></a></li>
                  <li><a href=""><span class="t-w-94">进入频道&nbsp;&nbsp;> </span></a></li>
                </ul>
              </div>
              <div class="t-h-r">
                <ul class="t-ul-l  t-h-130">
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/6d675799-7f31-4a68-af55-f27a5fea5667.png"
                           alt="">
                      <div class="t-w-20">
                        <span style="">55英寸/无边全面屏/4K HDR/AI语音/8GB大存储电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/63ef04fa-0aff-4a89-8d43-e85a97b4c791.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/无边全面屏/MEMC防抖/16GB大存储电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/9af8e2dd-09f5-46c5-b89f-ec0bfdeb13b4.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/超薄全面屏/MEMC防抖/2GB+32GB电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/47eee20e-82b8-4fa3-9f55-f603cdf9e610.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/超薄全面屏/MEMC防抖/2GB+32GB电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>

        </li>
        <li class="t-bx">
          <a href="">冰箱</a>
          <div class="t-h-288">
            <div class="w-w-1188">
              <div class="t-h-l">
                <ul class="t-ul-l">
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/87eb1729-99ed-4353-b1f4-fab8a4860258.png"
                          alt=""><span>75英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/cd8bc8d3-4e36-41e5-9219-640bd8ff2de4.png"
                          alt=""><span>60英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/e37ac76d-56b9-407e-8b67-08583b09f6e5.png"
                          alt=""><span>50英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/95e6efea-e48a-4732-a1af-0093c648c81c.png"
                          alt=""><span>55英寸</span></a></li>
                </ul>
                <ul class="t-ul-l">
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/87eb1729-99ed-4353-b1f4-fab8a4860258.png"
                          alt=""><span>75英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/cd8bc8d3-4e36-41e5-9219-640bd8ff2de4.png"
                          alt=""><span>60英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/e37ac76d-56b9-407e-8b67-08583b09f6e5.png"
                          alt=""><span>50英寸</span></a></li>
                  <li><a href=""><span class="t-w-94">进入频道&nbsp;&nbsp;> </span></a></li>
                </ul>
              </div>
              <div class="t-h-r">
                <ul class="t-ul-l  t-h-130">
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/6d675799-7f31-4a68-af55-f27a5fea5667.png"
                           alt="">
                      <div class="t-w-20">
                        <span style="">55英寸/无边全面屏/4K HDR/AI语音/8GB大存储电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/63ef04fa-0aff-4a89-8d43-e85a97b4c791.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/无边全面屏/MEMC防抖/16GB大存储电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/9af8e2dd-09f5-46c5-b89f-ec0bfdeb13b4.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/超薄全面屏/MEMC防抖/2GB+32GB电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/47eee20e-82b8-4fa3-9f55-f603cdf9e610.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/超薄全面屏/MEMC防抖/2GB+32GB电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>

        </li>
        <li class="t-xyj">
          <a href="">洗衣机</a>
          <div class="t-h-288">
            <div class="w-w-1188">
              <div class="t-h-l">
                <ul class="t-ul-l">
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/87eb1729-99ed-4353-b1f4-fab8a4860258.png"
                          alt=""><span>75英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/cd8bc8d3-4e36-41e5-9219-640bd8ff2de4.png"
                          alt=""><span>60英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/e37ac76d-56b9-407e-8b67-08583b09f6e5.png"
                          alt=""><span>50英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/95e6efea-e48a-4732-a1af-0093c648c81c.png"
                          alt=""><span>55英寸</span></a></li>
                </ul>
                <ul class="t-ul-l">
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/87eb1729-99ed-4353-b1f4-fab8a4860258.png"
                          alt=""><span>75英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/cd8bc8d3-4e36-41e5-9219-640bd8ff2de4.png"
                          alt=""><span>60英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/e37ac76d-56b9-407e-8b67-08583b09f6e5.png"
                          alt=""><span>50英寸</span></a></li>
                  <li><a href=""><span class="t-w-94">进入频道&nbsp;&nbsp;> </span></a></li>
                </ul>
              </div>
              <div class="t-h-r">
                <ul class="t-ul-l  t-h-130">
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/6d675799-7f31-4a68-af55-f27a5fea5667.png"
                           alt="">
                      <div class="t-w-20">
                        <span style="">55英寸/无边全面屏/4K HDR/AI语音/8GB大存储电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/63ef04fa-0aff-4a89-8d43-e85a97b4c791.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/无边全面屏/MEMC防抖/16GB大存储电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/9af8e2dd-09f5-46c5-b89f-ec0bfdeb13b4.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/超薄全面屏/MEMC防抖/2GB+32GB电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/47eee20e-82b8-4fa3-9f55-f603cdf9e610.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/超薄全面屏/MEMC防抖/2GB+32GB电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>

        </li>
        <li class="t-lg">
          <a href="">冷柜</a>
          <div class="t-h-288">
            <div class="w-w-1188">
              <div class="t-h-l">
                <ul class="t-ul-l">
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/87eb1729-99ed-4353-b1f4-fab8a4860258.png"
                          alt=""><span>75英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/cd8bc8d3-4e36-41e5-9219-640bd8ff2de4.png"
                          alt=""><span>60英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/e37ac76d-56b9-407e-8b67-08583b09f6e5.png"
                          alt=""><span>50英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/95e6efea-e48a-4732-a1af-0093c648c81c.png"
                          alt=""><span>55英寸</span></a></li>
                </ul>
                <ul class="t-ul-l">
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/87eb1729-99ed-4353-b1f4-fab8a4860258.png"
                          alt=""><span>75英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/cd8bc8d3-4e36-41e5-9219-640bd8ff2de4.png"
                          alt=""><span>60英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/e37ac76d-56b9-407e-8b67-08583b09f6e5.png"
                          alt=""><span>50英寸</span></a></li>
                  <li><a href=""><span class="t-w-94">进入频道&nbsp;&nbsp;> </span></a></li>
                </ul>
              </div>
              <div class="t-h-r">
                <ul class="t-ul-l  t-h-130">
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/6d675799-7f31-4a68-af55-f27a5fea5667.png"
                           alt="">
                      <div class="t-w-20">
                        <span style="">55英寸/无边全面屏/4K HDR/AI语音/8GB大存储电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/63ef04fa-0aff-4a89-8d43-e85a97b4c791.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/无边全面屏/MEMC防抖/16GB大存储电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/9af8e2dd-09f5-46c5-b89f-ec0bfdeb13b4.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/超薄全面屏/MEMC防抖/2GB+32GB电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/47eee20e-82b8-4fa3-9f55-f603cdf9e610.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/超薄全面屏/MEMC防抖/2GB+32GB电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>

        </li>
        <li class="t-cw">
          <a href="">厨卫</a>
          <div class="t-h-288">
            <div class="w-w-1188">
              <div class="t-h-l">
                <ul class="t-ul-l">
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/87eb1729-99ed-4353-b1f4-fab8a4860258.png"
                          alt=""><span>75英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/cd8bc8d3-4e36-41e5-9219-640bd8ff2de4.png"
                          alt=""><span>60英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/e37ac76d-56b9-407e-8b67-08583b09f6e5.png"
                          alt=""><span>50英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/95e6efea-e48a-4732-a1af-0093c648c81c.png"
                          alt=""><span>55英寸</span></a></li>
                </ul>
                <ul class="t-ul-l">
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/87eb1729-99ed-4353-b1f4-fab8a4860258.png"
                          alt=""><span>75英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/cd8bc8d3-4e36-41e5-9219-640bd8ff2de4.png"
                          alt=""><span>60英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/e37ac76d-56b9-407e-8b67-08583b09f6e5.png"
                          alt=""><span>50英寸</span></a></li>
                  <li><a href=""><span class="t-w-94">进入频道&nbsp;&nbsp;> </span></a></li>
                </ul>
              </div>
              <div class="t-h-r">
                <ul class="t-ul-l  t-h-130">
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/6d675799-7f31-4a68-af55-f27a5fea5667.png"
                           alt="">
                      <div class="t-w-20">
                        <span style="">55英寸/无边全面屏/4K HDR/AI语音/8GB大存储电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/63ef04fa-0aff-4a89-8d43-e85a97b4c791.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/无边全面屏/MEMC防抖/16GB大存储电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/9af8e2dd-09f5-46c5-b89f-ec0bfdeb13b4.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/超薄全面屏/MEMC防抖/2GB+32GB电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/47eee20e-82b8-4fa3-9f55-f603cdf9e610.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/超薄全面屏/MEMC防抖/2GB+32GB电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </li>
        <li class="t-kj">
          <a href="">空净</a>
          <div class="t-h-288">
            <div class="w-w-1188">
              <div class="t-h-l">
                <ul class="t-ul-l">
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/87eb1729-99ed-4353-b1f4-fab8a4860258.png"
                          alt=""><span>75英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/cd8bc8d3-4e36-41e5-9219-640bd8ff2de4.png"
                          alt=""><span>60英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/e37ac76d-56b9-407e-8b67-08583b09f6e5.png"
                          alt=""><span>50英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/95e6efea-e48a-4732-a1af-0093c648c81c.png"
                          alt=""><span>55英寸</span></a></li>
                </ul>
                <ul class="t-ul-l">
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/87eb1729-99ed-4353-b1f4-fab8a4860258.png"
                          alt=""><span>75英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/cd8bc8d3-4e36-41e5-9219-640bd8ff2de4.png"
                          alt=""><span>60英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/e37ac76d-56b9-407e-8b67-08583b09f6e5.png"
                          alt=""><span>50英寸</span></a></li>
                  <li><a href=""><span class="t-w-94">进入频道&nbsp;&nbsp;> </span></a></li>
                </ul>
              </div>
              <div class="t-h-r">
                <ul class="t-ul-l  t-h-130">
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/6d675799-7f31-4a68-af55-f27a5fea5667.png"
                           alt="">
                      <div class="t-w-20">
                        <span style="">55英寸/无边全面屏/4K HDR/AI语音/8GB大存储电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/63ef04fa-0aff-4a89-8d43-e85a97b4c791.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/无边全面屏/MEMC防抖/16GB大存储电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/9af8e2dd-09f5-46c5-b89f-ec0bfdeb13b4.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/超薄全面屏/MEMC防抖/2GB+32GB电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/47eee20e-82b8-4fa3-9f55-f603cdf9e610.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/超薄全面屏/MEMC防抖/2GB+32GB电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>

        </li>
        <li class="t-jxj">
          <a href="">聚享家</a>
          <div class="t-h-288">
            <div class="w-w-1188">
              <div class="t-h-l">
                <ul class="t-ul-l">
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/87eb1729-99ed-4353-b1f4-fab8a4860258.png"
                          alt=""><span>75英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/cd8bc8d3-4e36-41e5-9219-640bd8ff2de4.png"
                          alt=""><span>60英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/e37ac76d-56b9-407e-8b67-08583b09f6e5.png"
                          alt=""><span>50英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/95e6efea-e48a-4732-a1af-0093c648c81c.png"
                          alt=""><span>55英寸</span></a></li>
                </ul>
                <ul class="t-ul-l">
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/87eb1729-99ed-4353-b1f4-fab8a4860258.png"
                          alt=""><span>75英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/cd8bc8d3-4e36-41e5-9219-640bd8ff2de4.png"
                          alt=""><span>60英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/e37ac76d-56b9-407e-8b67-08583b09f6e5.png"
                          alt=""><span>50英寸</span></a></li>
                  <li><a href=""><span class="t-w-94">进入频道&nbsp;&nbsp;> </span></a></li>
                </ul>
              </div>
              <div class="t-h-r">
                <ul class="t-ul-l  t-h-130">
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/6d675799-7f31-4a68-af55-f27a5fea5667.png"
                           alt="">
                      <div class="t-w-20">
                        <span style="">55英寸/无边全面屏/4K HDR/AI语音/8GB大存储电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/63ef04fa-0aff-4a89-8d43-e85a97b4c791.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/无边全面屏/MEMC防抖/16GB大存储电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/9af8e2dd-09f5-46c5-b89f-ec0bfdeb13b4.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/超薄全面屏/MEMC防抖/2GB+32GB电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/47eee20e-82b8-4fa3-9f55-f603cdf9e610.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/超薄全面屏/MEMC防抖/2GB+32GB电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>

        </li>
        <li class="t-zqlg">
          <a href="">政企乐购</a>
          <div class="t-h-288">
            <div class="w-w-1188">
              <div class="t-h-l">
                <ul class="t-ul-l">
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/87eb1729-99ed-4353-b1f4-fab8a4860258.png"
                          alt=""><span>75英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/cd8bc8d3-4e36-41e5-9219-640bd8ff2de4.png"
                          alt=""><span>60英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/e37ac76d-56b9-407e-8b67-08583b09f6e5.png"
                          alt=""><span>50英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/95e6efea-e48a-4732-a1af-0093c648c81c.png"
                          alt=""><span>55英寸</span></a></li>
                </ul>
                <ul class="t-ul-l">
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/87eb1729-99ed-4353-b1f4-fab8a4860258.png"
                          alt=""><span>75英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/cd8bc8d3-4e36-41e5-9219-640bd8ff2de4.png"
                          alt=""><span>60英寸</span></a></li>
                  <li><a href=""><img
                          src="<%=request.getContextPath()%>/static/image/home/e37ac76d-56b9-407e-8b67-08583b09f6e5.png"
                          alt=""><span>50英寸</span></a></li>
                  <li><a href=""><span class="t-w-94">进入频道&nbsp;&nbsp;> </span></a></li>
                </ul>
              </div>
              <div class="t-h-r">
                <ul class="t-ul-l  t-h-130">
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/6d675799-7f31-4a68-af55-f27a5fea5667.png"
                           alt="">
                      <div class="t-w-20">
                        <span style="">55英寸/无边全面屏/4K HDR/AI语音/8GB大存储电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/63ef04fa-0aff-4a89-8d43-e85a97b4c791.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/无边全面屏/MEMC防抖/16GB大存储电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/9af8e2dd-09f5-46c5-b89f-ec0bfdeb13b4.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/超薄全面屏/MEMC防抖/2GB+32GB电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <img src="<%=request.getContextPath()%>/static/image/home/47eee20e-82b8-4fa3-9f55-f603cdf9e610.png"
                           alt="">
                      <div class="t-w-20">
                        <span>55英寸/AI声控/超薄全面屏/MEMC防抖/2GB+32GB电视</span>
                        <span class="t-s-r">￥5999</span>
                      </div>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>

        </li>
      </ul>
      <div class="i-search">
        <img src="<%=request.getContextPath()%>/static/image/home/search.png" alt="">
      </div>
      <div id="form-se">
        <form action="a" method="get" class="form-search2" id="searForm">
          <input id="put" type="text" placeholder="巅峰狂欢 7.25-7.27 送万元家装购物津贴">
          <img src="<%=request.getContextPath()%>/static/image/home/close2.png">
        </form>
      </div>
    </div>
  </div>
</div>

