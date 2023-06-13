package cn.hisense.test;

import cn.hisense.utils.MyBeanUtils;
import cn.hisense.web.servlet.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@SuppressWarnings("all")
@WebServlet("/servletTest")
public class ServletTest extends BaseServlet {
    /**
     * 测试请求转发
     *
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String testForward(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        req.setAttribute("name", "张三");
        System.out.println("zs123" + req.getMethod());
//        转发(f:/index.jsp 或者 /index.jsp)
        return "/index.jsp";
    }

    /**
     * 测试重定向
     *
     * @param req
     * @param resp
     * @return
     * @throws Exception
     */
    public String testRedirect(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        HttpSession session = req.getSession();
        session.setAttribute("age", 21);
//        重定向（r:/index.jsp)
        return "r:/index.jsp";
    }


    public void testBeanUtil(HttpServletRequest req, HttpServletResponse resp) throws Exception {
//        使用Apache封装的BeanUtils
//        People people = new People();
//        BeanUtils.populate(people, req.getParameterMap());
//        System.out.println(people);

//        使用改版的BeanUtils
        People people = MyBeanUtils.toBean(req.getParameterMap(), People.class);
        System.out.println(people);
    }
}
