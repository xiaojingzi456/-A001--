package cn.hisense.web.servlet.admin;

import cn.hisense.pojo.Category;
import cn.hisense.pojo.Categorytow;
import cn.hisense.pojo.ResultInfo;
import cn.hisense.service.CategoryService;
import cn.hisense.service.impl.CategoryServiceImpl;
import cn.hisense.utils.MyBeanUtils;
import cn.hisense.utils.UploadUtils;
import cn.hisense.web.servlet.BaseServlet;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;



@WebServlet("/category")
public class CategoryServlet extends BaseServlet {
    private final CategoryService categoryService = new CategoryServiceImpl();
    private final ResultInfo info = new ResultInfo();
    private final ObjectMapper mapper = new ObjectMapper();

    /**
     * 增加一级类别
     *
     * @param req
     * @param resp
     * @throws IOException
     */
    public void addCategory(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String caname = req.getParameter("caname");
        String category = categoryService.findCategory(caname);
        if (category == null) {
            int i = categoryService.addCategory(caname);
            if (i == 1) {
                info.setFlag(false);
                info.setErrorMsg("一级类别增加成功！");
            }
        } else if (caname != null) {
            info.setFlag(true);
            info.setErrorMsg("一级类别已存在，请勿重复添加！");
        }
        mapper.writeValue(resp.getWriter(), info);
    }

    /**
     * 通过一级ID查询类别
     *
     * @param req
     * @param resp
     * @throws IOException
     */
    public void findCategoryById(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String caid = req.getParameter("caid");
        Category category = categoryService.findCategoryById(caid);
        if (category != null) {
            info.setData(category);
            req.getSession().setAttribute("categoryById", category);
        }
        mapper.writeValue(resp.getWriter(), info);
    }

    /**
     * 添加二级类别
     *
     * @param req
     * @param resp
     * @throws IOException
     */
    public void addCategoryTow(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String ctname = req.getParameter("ctname");
        if (!ctname.trim().isEmpty()) {
            String categoryTow = categoryService.findCategoryTow(ctname);
            if (categoryTow == null) {
                Map<String, String> upload = UploadUtils.upload(req);
                Categorytow categorytow = MyBeanUtils.toBean(upload, Categorytow.class);
                int i = categoryService.addCategoryTow(categorytow);
                if (i == 1) {
                    info.setFlag(false);
                    info.setErrorMsg("增加二级类别成功！");
                } else {
                    info.setFlag(true);
                    info.setErrorMsg("增加二级类别失败！");
                }
            } else {
                info.setFlag(true);
                info.setErrorMsg("二级类别已存在，请勿重复添加！");
            }
        } else {
            info.setFlag(true);
            info.setErrorMsg("您还没有填写二级类别，请填写！");
        }
        mapper.writeValue(resp.getWriter(), info);
    }

    /**
     * 通过一级ID删除一级类别
     *
     * @param req
     * @param resp
     * @throws IOException
     */
    public void delCategory(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String caid = req.getParameter("caid");
        List<Map<String, Object>> categoryAdnCategoryTow = categoryService.findCategoryAdnCategoryTowById(caid);
        if (categoryAdnCategoryTow == null || categoryAdnCategoryTow.isEmpty()) {
            int i = categoryService.delCategory(caid);
            if (i == 1) {
                info.setFlag(false);
                info.setErrorMsg("删除成功！");
            } else {
                info.setFlag(true);
                info.setErrorMsg("删除失败！");
            }
        } else {
            info.setFlag(true);
            info.setErrorMsg("一级类别下存在二级类别，无法删除！");

        }
        mapper.writeValue(resp.getWriter(), info);
    }

    /**
     * 查询二级类别下是否有商品，无则删除二级类别
     *
     * @param req
     * @param resp
     * @throws IOException
     */
    public void findCategoryTowAdnCommodity(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String ctid = req.getParameter("ctid");
        List<Map<String, Object>> categoryTowAdnCommodity = categoryService.findCategoryTowAdnCommodity(ctid);
        if (categoryTowAdnCommodity.isEmpty()) {
            int i = categoryService.delCategoryTow(ctid);
            if (i == 1) {
                info.setFlag(false);
                info.setErrorMsg("二级类别删除成功！");
            } else {
                info.setFlag(true);
                info.setErrorMsg("二级类别删除成功！");
            }
        } else {
            info.setFlag(true);
            info.setErrorMsg("二级类别下存在商品，无法删除！");
        }
        mapper.writeValue(resp.getWriter(), info);
    }

    /**
     * 批量删除二级类别
     *
     * @param req
     * @param resp
     */
    public void delCategoryTow(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String[] ctids = req.getParameterValues("ctid[]");
        List<String> list = new ArrayList<>();
        for (String ctid : ctids) {
            List<Map<String, Object>> categoryTowAdnCommodity = categoryService.findCategoryTowAdnCommodity(ctid);
            if (categoryTowAdnCommodity.isEmpty()) {
                list.add(ctid);
            }
        }
        String[] strings = list.toArray(new String[list.size()]);
        int[] ints = categoryService.delCategoryTow(strings);
        if (ints != null && ints.length == 0) {
            info.setFlag(true);
            info.setErrorMsg("二级类别下存在商品，删除失败！");
        } else {
            info.setFlag(false);
            info.setErrorMsg("删除成功！");
        }
        mapper.writeValue(resp.getWriter(), info);
    }

    /**
     * 通过ID修改一级类别
     *
     * @param req
     * @param resp
     * @throws IOException
     */
    public void updCategoryById(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String caid = req.getParameter("caid");
        String caname = req.getParameter("caname");
        String category = categoryService.findCategory(caname);
        if (category == null) {
            int i = categoryService.updCategoryById(caname, caid);
            if (i == 1) {
                info.setFlag(false);
                info.setErrorMsg("修改成功！");
            } else {
                info.setFlag(true);
                info.setErrorMsg("修改失败！");
            }
        } else {
            info.setFlag(true);
            info.setErrorMsg("一级类别名称并未修改！");
        }

        mapper.writeValue(resp.getWriter(), info);
    }

    /**
     * 查询所有一级类别和二级类别
     *
     * @param req
     * @param resp
     * @return
     */
    public String cate(HttpServletRequest req, HttpServletResponse resp) {
        List<Category> categoryAll = categoryService.findCategoryAll();
        List<Map<String, Object>> categoryInnerCategoryTow = categoryService.findCategoryInnerCategoryTow();
        req.getSession().setAttribute("category", categoryAll);
        req.getSession().setAttribute("categoryTow", categoryInnerCategoryTow);
        return "f:/WEB-INF/admin/page/cate.jsp";
    }


}
