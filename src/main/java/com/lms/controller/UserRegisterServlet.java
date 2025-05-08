package com.lms.controller;

import com.lms.pojo.User;
import com.lms.service.user.UserService;
import com.lms.service.user.UserServiceImpl;
import com.lms.utils.Md5Util;
import jdk.jfr.Registered;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet("/UserRegister")
public class UserRegisterServlet extends HttpServlet {
    //get请求
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    //post请求
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserService userService = new UserServiceImpl();
        try {
            Register(req, resp, userService);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    //登录
    private void Register(HttpServletRequest req, HttpServletResponse resp, UserService userService) throws Exception {
        //获取页面输入
        String userName = req.getParameter("registerUserName");
        String userPasswd = req.getParameter("registerUserPasswd");
        String userBookId = req.getParameter("registerUserBookId");
        userPasswd = Md5Util.getMD5String(userPasswd);
        System.out.println("userPasswd:"+userPasswd);
        //登录并获取登录的用户信息
        User user = userService.register(userName , userPasswd , userBookId);
        System.out.println(user);
        //判断是否登录成功
        if(user != null){
            //获取session
            HttpSession session = req.getSession();
            //将数据存入session
            session.setAttribute("loginUser",user );
            //重定向至主页
            resp.sendRedirect("UserHome.jsp");
        }else{
//            req.setAttribute("msg","用户名或密码错误");
//            req.getRequestDispatcher("login.jsp").forward(req,resp);
            String tips = URLEncoder.encode("用户名或密码错误", "utf-8");
            //向页面输出错误原因
            resp.sendRedirect(req.getContextPath() + "/userLogin.jsp?tips=" + tips);
        }
    }
}
