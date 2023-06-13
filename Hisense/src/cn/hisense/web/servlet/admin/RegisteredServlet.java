package cn.hisense.web.servlet.admin;

import cn.hisense.dao.AdminDao;
import cn.hisense.pojo.Admin;
import cn.hisense.pojo.ResultInfo;
import cn.hisense.web.servlet.BaseServlet;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/register1")
public class RegisteredServlet extends BaseServlet {
    private final ResultInfo info = new ResultInfo();
    private final ObjectMapper mapper = new ObjectMapper();

    public void phone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phone = request.getParameter("phone");
        System.out.println("phone = " + phone);
        System.out.println(phone.length() == 11);
        if (phone.length() == 11) {
            info.setFlag(true);
            info.setErrorMsg("手机号正确！");
            request.getSession().setAttribute("mobile", phone);
        } else {
            info.setFlag(false);
            info.setErrorMsg("手机号不正确");
        }
        mapper.writeValue(response.getWriter(), info);
    }

    public void sms(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String vCode = request.getParameter("vCode");
        System.out.println("vCode = " + vCode);
        Object code = request.getSession().getAttribute("mobile_code");
        String s = String.valueOf(code);
        System.out.println("code = " + code);
        System.out.println("vCode.equals(code) = " + vCode.equals(s));
        if (vCode.equals(s)) {
            info.setFlag(true);
            info.setErrorMsg("注册成功！");
            AdminDao adminDao = new AdminDao();
            Admin admin = new Admin();
            admin.setAstate(1);
            admin.setArole(1);
            admin.setAid("12324234");
            admin.setApwd("1234567");
            String mobile = (String) request.getSession().getAttribute("mobile");
            admin.setAtelephone(mobile);
            admin.setAname("李明");
            admin.setAsex("男");
            admin.setAintroduce("分会联合");
            int i = adminDao.addAdmin(admin);
            if (i == 1) {
                System.out.println("增加会员成功！");
            }
        } else {
            info.setFlag(false);
            info.setErrorMsg("注册成功失败");
        }
        mapper.writeValue(response.getWriter(), info);
    }
}
