package cn.hisense.test;

import cn.hisense.utils.MyBeanUtils;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/register")
public class BeanServletTest extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        People people = MyBeanUtils.toBean(req.getParameterMap(), People.class);
        String uName = req.getParameter("uName");
        people.setuName("zs");
        req.setAttribute("pe", people);
        if (uName.equals(people.getuName())) {
            ResultInfo info = new ResultInfo();
            info.setFlag(false);
            info.setErrorMsg("用户名已被注册，请更换！");
            String s = new Gson().toJson(info);
            resp.getWriter().write(s);
        }
    }
}
