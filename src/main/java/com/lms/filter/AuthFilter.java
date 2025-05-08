package com.lms.filter;



import com.lms.pojo.Root;
import com.lms.pojo.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;

@WebFilter("/*")//拦截所有的用户请求
public class AuthFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        //子父接口的关系 把servletRequest强制转换为HttpServletRequest
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        // 设置请求编码
        request.setCharacterEncoding("UTF-8");
        // 设置响应编码
        response.setCharacterEncoding("UTF-8");
        // 设置响应内容类型（可选，通常与编码一起设置）
        response.setContentType("text/html; charset=UTF-8");
        //获取到用户请求的路径
        String requestURI = request.getRequestURI();
        System.out.println(requestURI);//输出到控制台,判断是否正确获取

        // 判断请求路径是否以某些特定的后缀结尾（如登录页面、静态资源等）
        if (requestURI.endsWith("userLogin.jsp") || requestURI.endsWith("rootLogin.jsp")
                || requestURI.endsWith("UserLogin") || requestURI.endsWith("RootLogin")
                || requestURI.endsWith("UserRegister")|| requestURI.endsWith(".css") ||
                requestURI.endsWith(".jpg") || requestURI.endsWith(".js") ) {
            // 放行请求
            filterChain.doFilter(request, response);
        } else {
            // 验证用户是否登录
            //获取session
            HttpSession session = request.getSession();
            //获取session里的值
            Root root = (Root) session.getAttribute("loginRoot");
            User user = (User) session.getAttribute("loginUser");
            System.out.println(root);
            System.out.println(user);
//            if (root != null) {
//                // 登录了放行
//                filterChain.doFilter(request, response);
//            } else {
//                // 未登录
//                String tips = URLEncoder.encode("您没有权限访问，请先登录！！！", "utf-8");
//                //重定向至登录页面并输出错误信息
//                response.sendRedirect(request.getContextPath() + "/userLogin.jsp?tips=" + tips);
//            }
            if (user != null || root != null) {
                // 登录了放行

                filterChain.doFilter(request, response);
            } else {
                // 未登录
                String tips = URLEncoder.encode("您没有权限访问，请先登录！！！", "utf-8");
                //重定向至登录页面并输出错误信息
                response.sendRedirect(request.getContextPath() + "/userLogin.jsp?tips=" + tips);
            }
        }

    }

    @Override
    public void destroy() {

    }
}
