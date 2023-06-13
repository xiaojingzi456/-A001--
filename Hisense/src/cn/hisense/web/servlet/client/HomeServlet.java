package cn.hisense.web.servlet.client;

import cn.hisense.pojo.Category;
import cn.hisense.pojo.ResultInfo;
import cn.hisense.service.CategoryService;
import cn.hisense.service.impl.CategoryServiceImpl;
import cn.hisense.web.servlet.BaseServlet;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;


@WebServlet("/client/homeServlet")
public class HomeServlet extends BaseServlet {
    private final CategoryService categoryService = new CategoryServiceImpl();
    private final ResultInfo info = new ResultInfo();
    private final ObjectMapper mapper = new ObjectMapper();

    /**
     * 查找所有一级类别
     *
     * @param req
     * @param resp
     * @throws IOException
     */
    public void findCategory(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<Category> categoryAll = categoryService.findCategoryAll();
        req.getSession().setAttribute("category",categoryAll);
        String caid = req.getParameter("caid");
        List<Map<String, Object>> categoryAdnCategoryTowById = categoryService.findCategoryAdnCategoryTowById(caid);
        req.getSession().setAttribute("categoryTow",categoryAdnCategoryTowById);
        System.out.println("categoryAdnCategoryTowById = " + categoryAdnCategoryTowById);
        System.out.println("categoryAll = " + categoryAll);

    }

    public String houtai(HttpServletRequest req, HttpServletResponse resp){
        return "f:/WEB-INF/admin/login.jsp";
    }

}
