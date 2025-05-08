package com.lms.controller;


import com.lms.pojo.User;
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

@WebServlet("/addUser")
public class AddUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RootService rootService = new RootServiceImpl();
        addUser(req, resp, rootService);
    }

    private void addUser(HttpServletRequest req, HttpServletResponse resp, RootService rootService) throws IOException {
        String addUserBookId = req.getParameter("addUserBookId");
        String userPasswd = Md5Util.getMD5String("123456");
        User user = rootService.addUser(addUserBookId,userPasswd);
        if (user != null) {
            //刷新用户页面
            String tips = URLEncoder.encode("用户创建成功", "utf-8");
            resp.sendRedirect(req.getContextPath() + "/RootHome.jsp?tips=" + tips);
        }else {
            //刷新用户页面
            String tips = URLEncoder.encode("用户新增失败请重试", "utf-8");
            resp.sendRedirect(req.getContextPath() + "/RootHome.jsp?tips=" + tips);
        }
    }
}
