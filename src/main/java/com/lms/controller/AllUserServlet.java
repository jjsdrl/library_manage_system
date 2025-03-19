package com.lms.controller;

import com.lms.pojo.User;
import com.lms.service.user.UserService;
import com.lms.service.user.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/AllUser")
public class AllUserServlet extends HttpServlet {
    //get请求
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserService userService = new UserServiceImpl();
        AllUser(req, resp, userService);
    }

    private void AllUser(HttpServletRequest req, HttpServletResponse resp, UserService userService) throws IOException {
        ArrayList<User> userArrayList = new ArrayList<User>(userService.allUser());
        //获取session
        HttpSession session = req.getSession();
        session.setAttribute("userArrayList", userArrayList);
        //重定向至主页
        resp.sendRedirect("AllUserInfo.jsp");
    }

    //post请求
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
