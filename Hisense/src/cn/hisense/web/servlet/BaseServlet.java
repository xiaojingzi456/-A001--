package cn.hisense.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;


@SuppressWarnings("all")
public class BaseServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        请求编码格式
        request.setCharacterEncoding("utf-8");
//        响应编码格式
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
//       获取参数，用来识别用户请求的方法
        String methodName = request.getParameter("method");
//        trim()去掉空格
        if (methodName == null || methodName.trim().isEmpty()) {
            throw new RuntimeException("您没有传递method参数，无法确定您想要调用的方法！");
        }

        Method method = null;
        try {
//            得到当前类的class对象，获取当前类的方法
            method = this.getClass().getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
        } catch (Exception e) {
            throw new RuntimeException("您调用的方法：" + methodName + "不存在！");
        }
        try {
//            通过反射，method对象调用表示的方法，返回一个字符串
            String result = (String) method.invoke(this, request, response);
//            return "f:/index.jsp  转发
//            return "r:/index.jsp  重定向
//            通过冒号进行分割，判断是否有前缀，如果没有则是转发，如果有通过冒号进行分割，得到前缀（冒号之前)和后缀（冒号之后)
//            前缀为f表示转发，前缀为r表示是重定向，后缀是转发或重定向的路径
//            如果返回的字符串是null，或者为“ ”则不进行转发或重定向
            if (result != null && !result.trim().isEmpty()) {
//                获取第一个冒号所在索引位置
                int i = result.indexOf(":");
//                如果没有冒号，使用转发
                if (i == -1) {
                    request.getRequestDispatcher(result).forward(request, response);
                } else {
//                截取前缀（冒号之前）
                    String s = result.substring(0, i);
//                截取后缀（冒号之后）
                    String path = result.substring(i + 1);
//                    前缀为r表示重定向，为f表示转发
                    if ("r".equalsIgnoreCase(s)) {
                        response.sendRedirect(request.getContextPath() + path);
                    } else if ("f".equalsIgnoreCase(s)) {
                        request.getRequestDispatcher(path).forward(request, response);
                    } else {
                        throw new RuntimeException("您指定的操作：" + s + "当前不支持！");
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("您调用的方法：" + methodName + "内部抛出了异常！");
            throw new RuntimeException(e);
        }
    }

//    @Override
//    protected void service(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
////        请求编码格式
//        request.setCharacterEncoding("utf-8");
////        响应编码格式
//        response.setCharacterEncoding("utf-8");
//        response.setContentType("text/html;charset=utf-8");
//
//        //1.方法名
//        String methodName = request.getParameter("method");
//
//        try {
//            //2.通过反射获取方法名
//            Method method = this.getClass().getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
//            //3.调用方法
//            method.invoke(this, request, response);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
}
