package cn.hisense.web.servlet.client;

import cn.hisense.pojo.*;
import cn.hisense.service.AddressService;
import cn.hisense.service.CartService;
import cn.hisense.service.CommodityService;
import cn.hisense.service.OrderService;
import cn.hisense.service.impl.AddressServiceImpl;
import cn.hisense.service.impl.CartServiceImpl;
import cn.hisense.service.impl.CommodityServiceImpl;
import cn.hisense.service.impl.OrderServiceImpl;
import cn.hisense.utils.MyBeanUtils;
import cn.hisense.vo.CriteriaOrder;
import cn.hisense.vo.Page;
import cn.hisense.web.servlet.BaseServlet;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;


@WebServlet("/client/OrderServlet")
public class OrderServlet extends BaseServlet {


    CartService cartService = new CartServiceImpl();
    OrderService orderService = new OrderServiceImpl();
    CommodityService commodityService = new CommodityServiceImpl();
    AddressService addressService = new AddressServiceImpl();
    private ResultInfo info = new ResultInfo();
    ObjectMapper mapper = new ObjectMapper();

    //结算
    public void cashOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        String oid = req.getParameter("oid");
        //校验库存是否充足
        StringBuffer error = validateStore(oid);
        Order order = orderService.getOrderItem(oid);
        List<Orderdetails> orderList = order.getOrderdetails();
//        StringBuilder stb = new StringBuilder("");
//        for (Orderdetails item : orderList) {//删除购物项
//            String coid = item.getCommodity().getCoid();
//            stb.append(coid);
//        }

        if (!error.toString().equals("")){//没通过
            info.setFlag(false);
            info.setErrorMsg(error.toString());
            mapper.writeValue(resp.getWriter(),info);
            return;
        }
        if (error.toString().trim().equals("")){//通过，库存够
            orderService.updateOrderStatus(oid,4);//修改状态
            orderService.cash(orderList);
            info.setFlag(true);
            mapper.writeValue(resp.getWriter(),info);
        }

    }
    //立即付款
    public String getOrderByoid(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        String oid = req.getParameter("oid");
        String aid = req.getParameter("aid");
        Order order = orderService.getOrderItem(oid);
        order.setAddress(addressService.getAddressByoid(aid));

        req.setAttribute("order", order);

        return "f:/WEB-INF/client/order/order_success.jsp";
    }
    //验证库存
    private StringBuffer validateStore(String caids) {
        //获取购物车
        StringBuffer error = new StringBuffer();
        List<Cart> cartList = cartService.selectCheckCaid(caids);
        for (Cart cart : cartList) {
            int quantity = cart.getCanumber();
            //int store = cart.getCommodity().getStock();//容易出现线程并发，不是最新数据
            int store = commodityService.getDetail(cart.getCommodity().getCoid()).getSnumber();//获取最新库存

            if (quantity > store){
                error.append(cart.getCommodity().getConame() +"库存不足！<br>");
            }
        }
        return error;
    }

    public String createOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        User user = (User) req.getSession().getAttribute("user");
        String uid = user.getUid();
//        String uid = "1";
        //获取勾选的购物车条目id
        String caids = req.getParameter("caids");
        String aid = req.getParameter("aid");
        String remark = req.getParameter("remark");
        //不使用传参获取总计double sum = Double.parseDouble(req.getParameter("sum"));

        List<Cart> cartList = cartService.selectCheckCaid(caids);//获得要购买的商品
        if (cartList.size() == 0) {
            req.setAttribute("msg", "您没有选择要购买的图书，不能下单！");
            req.getRequestDispatcher("/client/msg.jsp").forward(req, resp);
        }

        //创建订单对象
        Order order = new Order();
        order.setOid(MyBeanUtils.uuid());
        order.setUid(uid);
        order.setAid(aid);
        order.setRemark(remark);

        order.setOtime(new java.sql.Timestamp(System.currentTimeMillis()));
        order.setOstate(2);
        BigDecimal sum = new BigDecimal("0");//使用数学类，精度丢失计算偏差问题
        for (Cart cart : cartList) {
            sum = sum.add(new BigDecimal(cart.getCountPrice() + ""));//double转字符串类型
        }
        order.setOtatol(sum.doubleValue());


        //构建一个OrderItem集合，一个cart对应一个订单详情
        List<Orderdetails> orderdetails = new ArrayList<>();
        for (Cart cart : cartList) {
            Orderdetails orderItem = new Orderdetails();
            orderItem.setOtid(MyBeanUtils.uuid());
            orderItem.setOrder(order);
            orderItem.setCommodity(cart.getCommodity());
            orderItem.setOnumber(cart.getCanumber());
            orderItem.setOprice(cart.getCountPrice());
            orderItem.setOactual(cart.getCountPrice());

            orderdetails.add(orderItem);
        }

        //地址设置给订单
        order.setAddress(addressService.getAddressByoid(aid));
        //把订单条目置值给订单
        order.setOrderdetails(orderdetails);

        orderService.createOrder(order);

        //删除购物车中购买了的商品
        //cartService.delBatchCart(caids);

        req.setAttribute("order", order);

        return "f:/WEB-INF/client/order/order_success.jsp";

    }

    //状态查询页面
    public String getOrderByStatus(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        User user = (User) req.getSession().getAttribute("user");
        String uid = user.getUid();
//        String uid = "1";

        //封装查询条件
        Map<String, String[]> map = req.getParameterMap();
        CriteriaOrder coder = MyBeanUtils.toBean(map, CriteriaOrder.class);
        Page<Order> orderPage = orderService.getPage(map,uid);

        req.setAttribute("orderPage", orderPage);
        req.setAttribute("coder",coder);
        return "f:/WEB-INF/client/orderitem.jsp";
    }

    public String getOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        User user = (User) req.getSession().getAttribute("user");
        String uid = user.getUid();
//        String uid = "1";
        System.out.println("getOrder");
        //封装查询条件
        Map<String, String[]> map = req.getParameterMap();
        CriteriaOrder coder = MyBeanUtils.toBean(map, CriteriaOrder.class);

        Page<Order> orderPage = orderService.getPage(map,uid);

        req.setAttribute("orderPage", orderPage);
        req.setAttribute("coder",coder);

        return "f:/WEB-INF/client/order1.jsp";
    }

    public void updateOrderByStatus(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        String oid = req.getParameter("oid");
        Integer state = Integer.parseInt(req.getParameter("status"));
        /*int status = orderService.findOrderByStatus(oid);
        if (status == 1 || status == 5) {//已发货和已完成不能取消订单
            info.setFlag(false);
            info.setErrorMsg("已发货和已收货不能取消订单");
            mapper.writeValue(resp.getWriter(),info);
            return;
        }*/
        orderService.updateOrderStatus(oid, state);
        info.setFlag(true);
        mapper.writeValue(resp.getWriter(),info);
    }

    public String getOrderDetail(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        String oid = req.getParameter("oid");
        Order order = orderService.getOrderItem(oid);

        System.out.println(order);
        req.setAttribute("odList",order);

        return "f:/WEB-INF/client/orderdetail.jsp";

    }




}