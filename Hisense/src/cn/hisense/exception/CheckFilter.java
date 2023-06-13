package cn.hisense.exception;

import javax.servlet.FilterChain;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;


public class CheckFilter extends HttpFilter {

    //从web.xml中获取userSessionKey,redirectUrl,uncheckUrls
    private String userSessionKey;
    private String redirectUrl;
    private String uncheckUrls;

    //重写父类供子类重写的方法，使用getFilterConfig()获取config对象
    @Override
    protected void init() {
        ServletContext context = getFilterConfig().getServletContext();

        userSessionKey = context.getInitParameter("userSessionKey");
        redirectUrl = context.getInitParameter("redirectPage");
        uncheckUrls = context.getInitParameter("uncheckUrls");

    }

    @Override
    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws IOException, ServletException {

        //获取项目的Url,并不是请求的，不是这两个方法
        String requestUrl = request.getRequestURL().toString();
        String requestUri = request.getRequestURI();
        //1.获取请求的URL
        String servletPath = request.getServletPath();

        //System.out.println(requestUrl);
        //System.out.println(requestUri);

        //2.检查1获取的servletPath是否为不需要检查URL中的一个，是则直接放行，方法结束
        List<String> urls = Arrays.asList(uncheckUrls.split(","));//使用逗号进行拆分，
        if (urls.contains(servletPath)){//判断是否是同一路径
            filterChain.doFilter(request,response);
            return;//结束
        }
        //3.从session中获取userSessionKey对应的值，若值不存在（没登录），则转发到redirectUrl
        Object user = request.getSession().getAttribute(userSessionKey);
        if (user==null){
            //response.sendRedirect(request.getContextPath() + redirectUrl);
            request.getRequestDispatcher(redirectUrl).forward(request,response);
            return;
        }
        //4.如存在，表示已登录，放行
        filterChain.doFilter(request,response);
    }
}

