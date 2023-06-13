package cn.hisense.web.servlet.client;

import cn.hisense.dao.UserDao;
import cn.hisense.pojo.ResultInfo;
import cn.hisense.pojo.User;
import cn.hisense.service.UserService;
import cn.hisense.service.impl.UserServiceImpl;
import cn.hisense.utils.CodeUtils;
import cn.hisense.utils.MyBeanUtils;
import cn.hisense.web.servlet.BaseServlet;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.RenderedImage;
import java.io.IOException;
import java.util.Map;
import java.util.Objects;


@WebServlet("/user")
public class UserServlet extends BaseServlet {
    private final ResultInfo info = new ResultInfo();
    private final ObjectMapper mapper = new ObjectMapper();
    private final UserService userService = new UserServiceImpl();
    private UserDao userDao=new UserDao();

    /**
     * 生成验证码
     *
     * @param req
     * @param resp
     */
    public void code(HttpServletRequest req, HttpServletResponse resp) {
        //        禁止图片缓存
        resp.setHeader("Pragma", "no-cache");
        resp.setHeader("Cache-Control", "no-cache");
        resp.setDateHeader("Expires", -1);
        resp.setContentType("image/jpeg");
        //        调用验证码工具类生成验证码和验证码图片
        Map<String, Object> codeMap = CodeUtils.generateCodeAndPic();
        //        将四位数字的验证码保存到Session中
        HttpSession session = req.getSession();
        session.setAttribute("code", codeMap.get("code").toString());
        //        将图像输出到Servlet输出流中
        ServletOutputStream sos;
        try {
            sos = resp.getOutputStream();
            ImageIO.write((RenderedImage) codeMap.get("codePic"), "jpeg", sos);
            sos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 检验验证码
     *
     * @param req
     * @param resp
     * @throws IOException
     */
    public void checkCode(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String code = req.getParameter("verify");
        String code1 = (String) req.getSession().getAttribute("code");
        info.setFlag(true);
        if (code != null) {
            if (!code.equalsIgnoreCase(code1)) {
                info.setErrorMsg("请输入正确验证码");
            } else {
                info.setFlag(false);
                info.setErrorMsg("");
            }
        } else {
            info.setErrorMsg("请输入正确验证码");
        }
        mapper.writeValue(resp.getWriter(), info);
    }

    /**
     * 通过手机号查询
     *
     * @param req
     * @param resp
     * @throws IOException
     */
    public void findUserByPhone(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String uphone = req.getParameter("uphone");
        info.setFlag(true);
        if (uphone.length() != 11 || uphone.trim().isEmpty()) {
            info.setErrorMsg("请输入正确的手机号！");
        } else {
            String userByPhone = userService.findUserByPhone(uphone);
            if (userByPhone != null) {
                info.setFlag(false);
                info.setErrorMsg("");
            } else {
                info.setErrorMsg("手机号不存在！");
            }
        }
        mapper.writeValue(resp.getWriter(), info);
    }

    public void findUserByPhone2(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String uphone = req.getParameter("uphone");
        info.setFlag(true);
        if (uphone.length() != 11 || uphone.trim().isEmpty()) {
            info.setErrorMsg("请输入正确的手机号！");
        } else {
            String userByPhone = userService.findUserByPhone(uphone);
            if (userByPhone == null) {
                info.setFlag(false);
                info.setErrorMsg("");
            } else {
                info.setErrorMsg("手机号已被注册！");
            }
        }
        mapper.writeValue(resp.getWriter(), info);
    }

    /**
     * 通过姓名和密码进行登录
     *
     * @param req
     * @param resp
     * @throws IOException
     * @throws ServletException
     */
    public void loginUser(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String uphone = req.getParameter("uphone");
        String upwd = req.getParameter("upwd");
        String code = req.getParameter("verify");
        String code1 = (String) req.getSession().getAttribute("code");
        info.setFlag(true);
        if (code != null) {
            if (code.equalsIgnoreCase(code1)) {
                User user = userService.getUser(uphone, upwd);
                if (user != null) {
                    info.setFlag(false);
                    info.setErrorMsg("登录成功！");
                    req.getSession().setAttribute("user", user);
                } else {
                    info.setErrorMsg("用户名或密码错误！");
                }
            } else {
                info.setErrorMsg("请输入正确验证码");
            }
        } else {
            info.setErrorMsg("请输入正确验证码");
        }
        mapper.writeValue(resp.getWriter(), info);
    }

    /**
     * 退出登录
     *
     * @param req
     * @param resp
     * @return
     */
    public String logout(HttpServletRequest req, HttpServletResponse resp) {
        req.getSession().removeAttribute("user");
        return "r:/controller?method=home";
    }

    /**
     * 注册会员用户
     *
     * @param req
     * @param resp
     * @return
     */
    public void insertUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Map<String, String[]> parameterMap = req.getParameterMap();
        String[] uphones = parameterMap.get("uphone");
        String[] phoneCods = parameterMap.get("phoneCod");
        System.out.println("phoneCods = " + phoneCods[0]);
        String userByPhone = userService.findUserByPhone(uphones[0]);
        info.setFlag(true);
        if (uphones[0].length() != 11) {
            info.setErrorMsg("请输入正确的手机号！");
        } else {
            Object mobileCode = req.getSession().getAttribute("mobile_code");
            String mobile = String.valueOf(mobileCode);
            System.out.println("mobile = " + mobile);
            System.out.println(mobile.equals(phoneCods[0]));
            if (mobile.equals(phoneCods[0])) {
                if (userByPhone != null) {
                    info.setErrorMsg("此手机号已被注册！");
                } else {
                    User user = MyBeanUtils.toBean(parameterMap, User.class);
                    int i = userService.insertUser(user);
                    if (i == 1) {
                        info.setFlag(false);
                        info.setErrorMsg("注册成功！");
                    } else {
                        info.setErrorMsg("注册失败！");
                    }
                }
            } else {
                info.setErrorMsg("验证码错误！");
            }
        }
        mapper.writeValue(resp.getWriter(), info);
    }

    public void verificationCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String phoneCod = req.getParameter("phoneCod");
        Object mobileCode = req.getSession().getAttribute("mobile_code");
        String mobile = String.valueOf(mobileCode);
        if (Objects.equals(mobile, phoneCod)) {
            info.setFlag(false);
            info.setErrorMsg("");
        } else {
            info.setFlag(true);
            info.setErrorMsg("验证码错误!");
        }
        mapper.writeValue(resp.getWriter(),info);
    }

    //修改个人信息
    public void xiugaiinfo(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String name=request.getParameter("name");
        String zshouji=request.getParameter("zshouji");
        String zyoux=request.getParameter("zyoux");
        int i=userDao.xiugaiinfo(name,zshouji,zyoux);
        if (i>=1){
            response.getWriter().write("ok");
        }else {
            response.getWriter().write("fs");
        }
    }

    //修改密码
    public void xiumima(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String zshouji=request.getParameter("zshouji");
        String mimaer=request.getParameter("mimaer");
        int i=userDao.xiumima(zshouji,mimaer);
        if (i>=1){
            response.getWriter().write("ok");
        }else {
            response.getWriter().write("fs");
        }
    }
}
