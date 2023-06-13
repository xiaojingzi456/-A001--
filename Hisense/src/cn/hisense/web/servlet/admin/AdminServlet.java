package cn.hisense.web.servlet.admin;

import cn.hisense.pojo.Admin;
import cn.hisense.pojo.ResultInfo;
import cn.hisense.pojo.User;
import cn.hisense.service.AdminService;
import cn.hisense.service.impl.AdminServiceImpl;
import cn.hisense.utils.MyBeanUtils;
import cn.hisense.web.servlet.BaseServlet;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;


@WebServlet("/admin")
public class AdminServlet extends BaseServlet {
    private final AdminService adminService = new AdminServiceImpl();
    private final ResultInfo info = new ResultInfo();
    private final ObjectMapper mapper = new ObjectMapper();

    public String index(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        return "f:/WEB-INF/admin/page/index.jsp";
    }

    /**
     * 登录
     *
     * @param req
     * @param resp
     * @throws IOException
     */
    public void login(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String aname = req.getParameter("aname");
        String apwd = req.getParameter("apwd");
        Admin admin = new Admin();
        admin.setAname(aname);
        admin.setApwd(apwd);
        Admin admin1 = adminService.findAdmin(admin);
        if (admin1 != null) {
            if (admin1.getAstate() == 0) {
                info.setFlag(true);
                info.setErrorMsg("您的账户已被冻结！");
            } else {
                info.setFlag(false);
                info.setErrorMsg("用户密码正确！");
            }
            info.setData(admin1);
            req.getSession().setAttribute("admin", admin1);
        } else {
            info.setFlag(true);
            info.setErrorMsg("用户名或密码错误！");
        }
        mapper.writeValue(resp.getWriter(), info);
    }

    /**
     * 修改管理员个人信息
     *
     * @param req
     * @param resp
     * @throws IOException
     */
    public void modify(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Map<String, String[]> map = req.getParameterMap();
        Admin admin = MyBeanUtils.toBean(map, Admin.class);
        Admin adminByNameAndPhone = adminService.findAdminByNameAndPhone(admin.getAname(), admin.getAtelephone());
        if (adminByNameAndPhone == null) {
            adminService.modifyAdmin(admin);
            info.setFlag(false);
            info.setErrorMsg("修改个人信息成功！");
            req.getSession().invalidate();
        } else {
            info.setFlag(true);
            info.setErrorMsg("用户名或手机号已被占用！");
        }
        mapper.writeValue(resp.getWriter(), info);
    }

    /**
     * 增加管理员
     *
     * @param req
     * @param resp
     * @throws IOException
     */
    public void addAdmin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Map<String, String[]> map = req.getParameterMap();
        Admin admin = MyBeanUtils.toBean(map, Admin.class);
        Admin adminByNameAndPhone = adminService.findAdminByNameAndPhone(admin.getAname(), admin.getAtelephone());
        if (adminByNameAndPhone == null) {
            adminService.addAdmin(admin);
            info.setFlag(false);
            info.setErrorMsg("增加管理员成功！");
        } else {
            info.setFlag(true);
            info.setErrorMsg("用户名或手机号已被注册！");
        }
        mapper.writeValue(resp.getWriter(), info);
    }


    /**
     * 查询所有管理员用户
     *
     * @param req
     * @param resp
     * @throws Exception
     */
    public void adminList(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        List<Admin> adminAll = adminService.findAdminAll();
        if (adminAll != null && !adminAll.isEmpty()) {
            info.setData(adminAll);
            req.getSession().setAttribute("adminList", adminAll);
            info.setData(adminAll);
            mapper.writeValue(resp.getWriter(), info);
        }
    }

    /**
     * 通过姓名和手机条件查询用户
     *
     * @param req
     * @param resp
     * @throws Exception
     */
    public void findAdminByNameAndPhone(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        Map<String, String[]> parameterMap = req.getParameterMap();
        List<Admin> adminByNameAndPhone = adminService.findAdminByNameAndPhone(parameterMap);
        info.setData(adminByNameAndPhone);
        req.getSession().setAttribute("condition", parameterMap);
        mapper.writeValue(resp.getWriter(), info);
    }

    /**
     * 查询所有前台用户
     *
     * @param req
     * @param resp
     * @return
     */
    public void memberList(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<User> userAll = adminService.findUserAll();
        if (userAll != null && !userAll.isEmpty()) {
            info.setData(userAll);
            req.getSession().setAttribute("user_admin", userAll);
            mapper.writeValue(resp.getWriter(), info);
        }
    }

    /**
     * 通过ID修改管理员账户状态
     *
     * @param req
     * @param resp
     * @throws Exception
     */
    public void modifyAdminState(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String aatate = req.getParameter("astate");
        String id = req.getParameter("aid");
        adminService.modifyAdminState(Integer.parseInt(aatate), id);
        info.setFlag(false);
        info.setErrorMsg("成功！");
        mapper.writeValue(resp.getWriter(), info);
    }

    /**
     * 修改用户账号状态
     *
     * @param req
     * @param resp
     * @throws Exception
     */
    public void modifyUserState(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String ustate = req.getParameter("ustate");
        String id = req.getParameter("uid");
        int i = Integer.parseInt(ustate);
        adminService.modifyUserState(i, id);
        info.setFlag(false);
        info.setErrorMsg("成功！");
        mapper.writeValue(resp.getWriter(), info);
    }

    /**
     * 批量修改用户账号状态
     *
     * @param req
     * @param resp
     * @throws Exception
     */
    public void updUserState(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String[] ids = req.getParameterValues("uid[]");
        String ustate = req.getParameter("ustate");
        if (ids != null) {
            int i = Integer.parseInt(ustate);
            int[] ints = adminService.updUserState(i, ids);
            if (ints != null && ints.length != 0) {
                info.setFlag(false);
                info.setErrorMsg("修改成功！");
            } else {
                info.setFlag(true);
                info.setErrorMsg("修改失败！");
            }
            mapper.writeValue(resp.getWriter(), info);
        }
    }
}
