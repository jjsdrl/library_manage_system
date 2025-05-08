package com.lms.controller;



import com.lms.service.user.UserService;
import com.lms.service.user.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/libneed")
public class NeedLibServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserService userService = new UserServiceImpl();
        libneed(req, resp, userService);
    }

    private void libneed(HttpServletRequest req, HttpServletResponse resp, UserService userService) throws IOException {
        String changeLibRoomName = req.getParameter("changeLibRoomName");
        userService.libneed(changeLibRoomName);
        resp.sendRedirect(req.getContextPath() + "/UserHome.jsp");
    }
}
