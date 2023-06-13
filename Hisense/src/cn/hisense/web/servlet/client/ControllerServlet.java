package cn.hisense.web.servlet.client;

import cn.hisense.web.servlet.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/controller")
public class ControllerServlet extends BaseServlet {
    public String home(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/client/home.jsp";
    }

    public String login(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/client/login.jsp";
    }

    public String register(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/client/register.jsp";
    }

    public String buyer(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/client/buyer.jsp";
    }

    public String account(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/client/account.jsp";
    }

    public String cancellation(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/client/cancellation.jsp";
    }

    public String personal(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/client/personal.jsp";
    }

    public String productList(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/client/productlist.jsp";
    }

    //购物车模块
    public String cart(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/client/cart.jsp";
    }


    //    public String order(HttpServletRequest req, HttpServletResponse resp) {
//        return "f:/WEB-INF/client/order.jsp";
//    }
    public String cartsubmit(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/client/cartsubmit.jsp";
    }
//    public String getOrderdetail(HttpServletRequest req, HttpServletResponse resp) {
//        return "f:/WEB-INF/client/orderdetail.jsp";
//    }

    public String getAddress(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/client/address.jsp";
    }
}
