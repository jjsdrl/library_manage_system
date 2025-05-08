package com.lms.controller;

import com.lms.pojo.Root;
import com.lms.service.root.RootService;
import com.lms.service.root.RootServiceImpl;
import com.lms.utils.Md5Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet("/RootLogin")
public class RootLoginServlet extends HttpServlet {
    //get请求
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    //post请求
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RootService rootService = new RootServiceImpl();
        login(req,resp,rootService);
    }

    //登录
    private void login(HttpServletRequest req, HttpServletResponse resp, RootService rootService) throws IOException, ServletException {
        //获取页面输入
        String rootName = req.getParameter("rootName");
        String rootPasswd = req.getParameter("rootPasswd");
        rootPasswd = Md5Util.getMD5String(rootPasswd);
        System.out.println(rootPasswd);
        //登录并获取登录的用户信息
        Root root = rootService.login(rootName , rootPasswd);
        System.out.println(root);
        //判断是否登录成功
        if(root != null){
            //获取session
            HttpSession session = req.getSession();
            //将数据存入session
            session.setAttribute("loginRoot",root );
            //重定向至主页
            resp.sendRedirect("RootHome.jsp");
        }else{
//            req.setAttribute("msg","用户名或密码错误");
//            req.getRequestDispatcher("login.jsp").forward(req,resp);
            String tips = URLEncoder.encode("用户名或密码错误", "utf-8");
            //向页面输出错误原因
            resp.sendRedirect(req.getContextPath() + "/rootLogin.jsp?tips=" + tips);
        }
    }


}

