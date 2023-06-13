package cn.hisense.web.servlet.client;

import cn.hisense.pojo.Commodity;
import cn.hisense.pojo.Evaluate;
import cn.hisense.pojo.ResultInfo;
import cn.hisense.service.CommodityService;
import cn.hisense.service.EvaluateService;
import cn.hisense.service.impl.CommodityServiceImpl;
import cn.hisense.service.impl.EvaluateServiceImpl;
import cn.hisense.web.servlet.BaseServlet;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/client/CommodityServlet")
public class CommodityServlet extends BaseServlet {

    CommodityService commoditys = new CommodityServiceImpl();
    EvaluateService evaluateService = new EvaluateServiceImpl();
    private ResultInfo info = new ResultInfo();
    ObjectMapper mapper = new ObjectMapper();


    public String getCommodityDetail(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        System.out.println("查看详情");
        //获取coid
        String coid = req.getParameter("coid");

        if (coid == null){
            coid = "1";
        }
        Commodity commodity = commoditys.getDetail(coid);

        req.setAttribute("commodity", commodity);

        return "f:/WEB-INF/client/detail.jsp";
    }

    public void getDetailImg(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        System.out.println("查看图片");
        //获取coid
        String coid = req.getParameter("coid");

        Commodity commodity = commoditys.getDetailIMG(coid);

        info.setFlag(true);
        info.setData(commodity);
        mapper.writeValue(resp.getWriter(),info);
    }

    public void getEvaluate(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        System.out.println("查看评论");
        //获取coid
        String coid = req.getParameter("coid");
        if (coid == null){
            coid = "1";
        }

        List<Evaluate> evaluates = evaluateService.getEvaluateBycoid(coid);

        info.setFlag(true);
        info.setData(evaluates);
        mapper.writeValue(resp.getWriter(),info);
    }



}
