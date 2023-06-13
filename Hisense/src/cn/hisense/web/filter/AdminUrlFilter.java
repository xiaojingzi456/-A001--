package cn.hisense.web.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;


@WebFilter("/controllerAdmin")
public class AdminUrlFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        String uri = request.getRequestURI();
        if ("login".equals(req.getParameter("method")) || uri.contains("login") || uri.contains("/static/")) {
            chain.doFilter(req, resp);
        } else {
            Object admin = request.getSession().getAttribute("admin");
            if (admin != null) {
                chain.doFilter(req, resp);
            } else {
                request.getRequestDispatcher("/WEB-INF/admin/login.jsp").forward(request, resp);
            }
        }
    }

    @Override
    public void destroy() {

    }
}
