package cn.hisense.web.servlet.admin;

import cn.hisense.pojo.ResultInfo;
import cn.hisense.pojo.Specs;
import cn.hisense.pojo.Specstow;
import cn.hisense.service.SpecsService;
import cn.hisense.service.impl.SpecsServiceImpl;
import cn.hisense.web.servlet.BaseServlet;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/specsServlet")
public class SpecsServlet extends BaseServlet {
    private final SpecsService specsService = new SpecsServiceImpl();
    private final ResultInfo info = new ResultInfo();
    private final ObjectMapper mapper = new ObjectMapper();

    /**
     * 查询所有一级二级
     *
     * @param req
     * @param resp
     * @return
     * @throws IOException
     */
    public String findSpecsAndSpecsTowAndCommodity(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<Specs> specsAll = specsService.findSpecsAll();
        List<Specstow> specsTowAll = specsService.findSpecsTowAll();
        req.getSession().setAttribute("specsAll", specsAll);
        req.getSession().setAttribute("specsTowAll", specsTowAll);
        return "f:/WEB-INF/admin/page/specification.jsp";
    }

    /**
     * 增加一级规格
     *
     * @param req
     * @param resp
     * @return
     */
    public void addSpecs(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String sname = req.getParameter("sname");
        Specstow specsTowByName = specsService.findSpecsTowByName(sname);
        if (specsTowByName == null) {
            specsService.addSpecs(sname);
            info.setFlag(false);
            info.setErrorMsg("增加一级规格成功！");
        } else {
            info.setFlag(true);
            info.setErrorMsg("一级规格已存在！");
        }
        mapper.writeValue(resp.getWriter(), info);
    }

    /**
     * 增加二级规格
     *
     * @param req
     * @param resp
     * @return
     */
    public void addSpecsTow(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String sid = req.getParameter("sid");
        String stname = req.getParameter("stname");
        Specs specsByName = specsService.findSpecsByName(stname);
        if (specsByName == null) {
            Specstow specstow = new Specstow();
            specstow.setSid(sid);
            specstow.setStname(stname);
            specsService.addSpecsTow(specstow);
            info.setFlag(false);
            info.setErrorMsg("增加二级规格成功！");
        } else {
            info.setFlag(false);
            info.setErrorMsg("增加二级规格失败！");
        }
        mapper.writeValue(resp.getWriter(), info);
    }

    /**
     * 通过一级规格名称查询
     *
     * @param req
     * @param resp
     * @throws IOException
     */
    public void findSpecsByName(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String sname = req.getParameter("sname");
        Specs specsByName = specsService.findSpecsByName(sname);
        if (specsByName != null) {
            info.setData(specsByName);
            req.getSession().setAttribute("specsByName", specsByName);
        }
    }
}



