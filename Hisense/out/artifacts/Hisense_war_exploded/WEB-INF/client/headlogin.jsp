<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<div id="">--%>
<%--    <img src="<%=request.getContextPath()%>/static/image/home/45873d18-17f2-46af-a7dc-a20b176faa8f.jpg" class="img-fluid"--%>
<%--         alt="">--%>
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

