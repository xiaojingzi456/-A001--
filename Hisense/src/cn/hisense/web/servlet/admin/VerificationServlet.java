package cn.hisense.web.servlet.admin;

import cn.hisense.pojo.ResultInfo;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet("/verification")
public class VerificationServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //接口类型：互亿无线触发短信接口，支持发送验证码短信、订单通知短信等。
        // 账户注册：请通过该地址开通账户http://user.ihuyi.com/register.html
        // 注意事项：
        //（1）调试期间，请使用用系统默认的短信内容：您的验证码是：【变量】。请不要把验证码泄露给其他人。
        //（2）请使用 APIID 及 APIKEY来调用接口，可在会员中心获取；
        //（3）该代码仅供接入互亿无线短信接口参考使用，客户可根据实际需要自行编写；

        String postUrl = "http://106.ihuyi.com/webservice/sms.php?method=Submit";

        int mobileCode = (int) ((Math.random() * 9 + 1) * 100000); //获取随机数

        String account = "C63244556"; //查看用户名 登录用户中心->验证码通知短信>产品总览->API接口信息->APIID
        String password = "95c981dbcfd0598876ea9891c550aca3";  //查看密码 登录用户中心->验证码通知短信>产品总览->API接口信息->APIKEY
        String uphone = req.getParameter("uphone");
//        String mobile = (String) req.getSession().getAttribute("mobile");
        System.out.println("mobile = " + uphone);
        //存入session
        req.getSession().setAttribute("mobile_code", mobileCode);
        String content = new String("您的验证码是：" + mobileCode + "。请不要把验证码泄露给其他人。");
        System.out.println(mobileCode);
        try {
            URL url = new URL(postUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setDoOutput(true);//允许连接提交信息
            connection.setRequestMethod("POST");//网页提交方式"GET"、"POST"
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            connection.setRequestProperty("Connection", "Keep-Alive");
            StringBuffer sb = new StringBuffer();
            sb.append("account=" + account);
            sb.append("&password=" + password);
            sb.append("&mobile=" + uphone);
            sb.append("&content=" + content);
            OutputStream os = connection.getOutputStream();
            os.write(sb.toString().getBytes());
            os.close();

            String line, result = "";
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
            while ((line = in.readLine()) != null) {
                result += line + "\n";
            }
            in.close();
            ResultInfo info = new ResultInfo();
            info.setData(true);
            info.setErrorMsg(result);
            ObjectMapper mapper = new ObjectMapper();
            mapper.writeValue(resp.getWriter(), info);
        } catch (IOException e) {
            e.printStackTrace(System.out);
        }
    }
}
