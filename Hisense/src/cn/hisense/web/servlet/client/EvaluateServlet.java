package cn.hisense.web.servlet.client;

import cn.hisense.pojo.Evaluate;
import cn.hisense.pojo.ResultInfo;
import cn.hisense.service.EvaluateService;
import cn.hisense.service.OrderService;
import cn.hisense.service.impl.EvaluateServiceImpl;
import cn.hisense.service.impl.OrderServiceImpl;
import cn.hisense.utils.MyBeanUtils;
import cn.hisense.web.servlet.BaseServlet;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/client/EvaluateServlet")
public class EvaluateServlet extends BaseServlet {


    EvaluateService evaluateService = new EvaluateServiceImpl();
    OrderService orderService = new OrderServiceImpl();
    ObjectMapper mapper = new ObjectMapper();
    ResultInfo info = new ResultInfo();
    public String gotoEvaluate(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String oid = req.getParameter("oid");
        req.setAttribute("oid", oid);

        return "f:/WEB-INF/client/evaluate.jsp";
    }

    public void addEvaluate(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String oid = req.getParameter("oid");
        System.out.println(oid);
        System.out.println("添加评论");
        Evaluate evaluate = MyBeanUtils.toBean(req.getParameterMap(), Evaluate.class);

        evaluateService.addEvaluateByoid(oid,evaluate);
        orderService.updateOrderStatus(oid,6);

        info.setFlag(true);
        mapper.writeValue(resp.getWriter(),info);


    }
}
