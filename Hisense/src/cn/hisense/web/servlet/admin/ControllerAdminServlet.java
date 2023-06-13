package cn.hisense.web.servlet.admin;

import cn.hisense.web.servlet.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/controllerAdmin")
public class ControllerAdminServlet extends BaseServlet {

    public String welcome(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/admin/page/welcome.jsp";
    }

    public String login(HttpServletRequest req, HttpServletResponse resp) {
        req.getSession().invalidate();
        return "f:/WEB-INF/admin/login.jsp";
    }

    public String echarts(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/admin/page/echarts1.jsp";
    }

    public String memberList(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/admin/page/member-list.jsp";
    }

    public String orderList(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/admin/page/order-list.jsp";
    }

    public String cate(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/admin/page/cate.jsp";
    }

    public String adminList(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/admin/page/admin-list.jsp";
    }

    public String index(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/admin/page/index.jsp";
    }

    public String personal(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/admin/page/personal.jsp";
    }

    public String adminPassword(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/admin/page/admin-password.jsp";
    }

    public String adminAdd(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/admin/page/admin-add.jsp";
    }

    public String addCategoryTow(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/admin/page/addCategoryTow.jsp";
    }

    public String editCategory(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/admin/page/editCategory.jsp";
    }

    public String productList(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/admin/page/productList.jsp";
    }

    public String productAdd(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/admin/page/productAdd.jsp";
    }

    public String specification(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/admin/page/specification.jsp";
    }

    public String addSpecsTow(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/admin/page/addSpecsTow.jsp";
    }

    public String orderDetails(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/admin/page/orderDetails.jsp";
    }
    public String orderShip(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/admin/page/orderShip.jsp";
    }

    public String logisticsList(HttpServletRequest req, HttpServletResponse resp) {
        return "f:/WEB-INF/admin/page/logisticsList.jsp";
    }
}
