package cn.hisense.web.servlet.admin;

import cn.hisense.pojo.Logistics;
import cn.hisense.pojo.Order;
import cn.hisense.pojo.Orderdetails;
import cn.hisense.pojo.ResultInfo;
import cn.hisense.service.OrderService;
import cn.hisense.service.impl.OrderServiceImpl;
import cn.hisense.utils.MyBeanUtils;
import cn.hisense.web.servlet.BaseServlet;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;


@WebServlet("/orderAdminServlet")
public class OrderServlet extends BaseServlet {
    private final OrderService orderService = new OrderServiceImpl();
    private final ResultInfo info = new ResultInfo();
    private final ObjectMapper mapper = new ObjectMapper();

    /**
     * 条件查询所有订单
     *
     * @param req
     * @param resp
     */
    public void findOrderAll(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Map<String, String[]> map = req.getParameterMap();
        List<Map<String, Object>> orderList = orderService.findOrderList(map);
        info.setData(orderList);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        mapper.setDateFormat(sdf);
        req.getSession().setAttribute("orderList", orderList);
        mapper.writeValue(resp.getWriter(), info);
    }


    /**
     * 通过ID修改订单状态
     *
     * @param req
     * @param resp
     * @throws IOException
     */
    public void updOrderById(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Map<String, String[]> parameterMap = req.getParameterMap();
        Logistics logistics = MyBeanUtils.toBean(parameterMap, Logistics.class);
        String[] ldprovinces = parameterMap.get("ldprovince");
        logistics.setLdprovince(ldprovinces[0] + "省");
        String oid = logistics.getOid();
        int i = orderService.updOrderById(5, oid);
        if (i == 1) {
            info.setFlag(false);
            info.setErrorMsg("发货成功！");
            orderService.insLogistics(logistics);
        } else {
            info.setFlag(true);
            info.setErrorMsg("发货失败！");
        }
        mapper.writeValue(resp.getWriter(), info);
    }

    /**
     * 通过订单ID连表查询地址、订单
     *
     * @param req
     * @param resp
     * @throws IOException
     */
    public void findAddressAndOrderById(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String oid = req.getParameter("oid");
        Map<String, Object> addressAndOrderById = orderService.findAddressAndOrderById(oid);
        if (!addressAndOrderById.isEmpty()) {
            req.getSession().setAttribute("addressAndOrder", addressAndOrderById);
        }
    }

    /**
     * 通过订单ID查询订单详情
     *
     * @param req
     * @param resp
     * @throws IOException
     */
    public void findOrderDetailsById(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String oid = req.getParameter("oid");
        List<Orderdetails> orderDetailsById = orderService.findOrderDetailsById(oid);
        info.setData(orderDetailsById);
        req.getSession().setAttribute("orderDetails", orderDetailsById);
        mapper.writeValue(resp.getWriter(), info);
    }

    /**
     * 通过订单ID四表联查（订单、订单详情、商品、地址）
     *
     * @param req
     * @param resp
     * @return
     */
    public void findOrderAndOrderDetailsAndCommodity(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String oid = req.getParameter("oid");
        List<Map<String, Object>> orderAndOrderDetailsAndCommodity = orderService.findOrderAndOrderDetailsAndCommodity(oid);
        req.getSession().setAttribute("orderDetails", orderAndOrderDetailsAndCommodity);
    }

    /**
     * 查询所有物流发货信息
     *
     * @param req
     * @param resp
     * @throws IOException
     */
    public void findLogistics(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Map<String, String[]> parameterMap = req.getParameterMap();
        List<Map<String, Object>> logistics = orderService.findLogistics(parameterMap);
        info.setData(logistics);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        mapper.setDateFormat(simpleDateFormat);
        req.getSession().setAttribute("logistics", logistics);
        mapper.writeValue(resp.getWriter(), info);
    }
}
