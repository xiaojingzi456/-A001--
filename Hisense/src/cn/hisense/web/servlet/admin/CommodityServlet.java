package cn.hisense.web.servlet.admin;

import cn.hisense.pojo.*;
import cn.hisense.service.CategoryService;
import cn.hisense.service.CommodityService;
import cn.hisense.service.SpecsService;
import cn.hisense.service.impl.CategoryServiceImpl;
import cn.hisense.service.impl.CommodityServiceImpl;
import cn.hisense.service.impl.SpecsServiceImpl;
import cn.hisense.utils.MyBeanUtils;
import cn.hisense.utils.UploadUtils;
import cn.hisense.web.servlet.BaseServlet;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/commodity")
public class CommodityServlet extends BaseServlet {
    private final CommodityService commodityService = new CommodityServiceImpl();
    private final CategoryService categoryService = new CategoryServiceImpl();
    private final SpecsService specsService = new SpecsServiceImpl();
    private final ResultInfo info = new ResultInfo();
    private final ObjectMapper mapper = new ObjectMapper();

    /**
     * 条件分页查询并排序
     *
     * @param req
     * @param resp
     * @throws IOException
     */
    public void productList(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Map<String, String[]> map = req.getParameterMap();
        List<Commodity> commodityAll = commodityService.findCommodityAll(map);
        req.getSession().setAttribute("condition", map);
        info.setData(commodityAll);
        mapper.writeValue(resp.getWriter(), info);
    }

    /**
     * 通过ID修改商品上下架状态
     *
     * @param req
     * @param resp
     * @throws IOException
     */
    public void updStateById(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String cstate = req.getParameter("cstate");
        String coid = req.getParameter("coid");
        commodityService.updStateById(Integer.parseInt(cstate), coid);
        info.setErrorMsg("修改成功！");
        mapper.writeValue(resp.getWriter(), info);
    }


    /**
     * 添加商品
     *
     * @param req
     * @param resp
     */
    public void addCommodity(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String coname = req.getParameter("coname");
        if (!coname.trim().isEmpty()) {
            Commodity commodityByName = commodityService.findCommodityByName(coname);
            if (commodityByName == null) {
                Map<String, String> upload = UploadUtils.upload(req);
                Commodity commodity = MyBeanUtils.toBean(upload, Commodity.class);
                int i = commodityService.addCommodity(commodity);
                if (i == 1) {
                    info.setFlag(false);
                    info.setErrorMsg("增加成功！");
                } else {
                    info.setFlag(true);
                    info.setErrorMsg("增加失败！");
                }
            } else {
                info.setFlag(true);
                info.setErrorMsg("商品已存在！");
            }
        } else {
            info.setFlag(true);
            info.setErrorMsg("请检查红色必填项是否填写完整！");
        }
        mapper.writeValue(resp.getWriter(), info);

    }


    /**
     * 查询所有一级二级类别和规格
     *
     * @param req
     * @param resp
     * @return
     */
    public String productAdd(HttpServletRequest req, HttpServletResponse resp) {
        List<Category> categoryAll = categoryService.findCategoryAll();
        List<Map<String, Object>> categoryInnerCategoryTow = categoryService.findCategoryInnerCategoryTow();
        req.getSession().setAttribute("category", categoryAll);
        req.getSession().setAttribute("categoryTow", categoryInnerCategoryTow);
        List<Specs> specsAll = specsService.findSpecsAll();
        List<Specstow> specsTowAll = specsService.findSpecsTowAll();
        req.getSession().setAttribute("specsAll", specsAll);
        req.getSession().setAttribute("specsTowAll", specsTowAll);
        return "f:/WEB-INF/admin/page/productAdd.jsp";
    }
}
