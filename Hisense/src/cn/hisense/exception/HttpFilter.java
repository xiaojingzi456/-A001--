package cn.hisense.exception;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 以后直接继承HttpFilter,比使用Filter接口更方便
 * 因为Filter接口中有ServletRequest，而不是HttpServletRequest比较麻烦
 */
public abstract class HttpFilter implements Filter {

    //把config变为全局变量让其他方法可用
    private FilterConfig filterConfig;
    /**
     * 此方法不建议子类直接覆盖，子类若覆盖，而又没有指定super.init(config),可能会导致filterConfig成员变量
     * 初始化失败，抛出空指针异常，与Servlet的init()相似
     * @param filterConfig
     * @throws ServletException
     */
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        //赋值为全局变量
        this.filterConfig = filterConfig;
        init();
    }

    /**
     * 供子类继承的初始化方法，通过getFilterConfig()获取config对象
     */
    protected void init(){};

    public FilterConfig getFilterConfig() {
        return filterConfig;
    }

    /**
     * 原生的doFilter方法，在方法内部实现了对Servlet的强转,并调用了抽象方法
     * doFilter(HttpServletRequest request,HttpServletResponse response,FilterChain filterChain)
     * 编写过滤器时不建议直接继承原生方法，而是继承抽象方法doFilter()
     * @param req
     * @param resp
     * @param chain
     */
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        //强转变HttpServlert
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        doFilter(request,response,chain);
    }
    /**
     * 为Http请求定制，真正实现的是此方法
     */
    public abstract void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws IOException, ServletException;

    @Override
    public void destroy() {

    }
}

