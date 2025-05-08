package com.lms.controller;

import com.lms.pojo.User;
import com.lms.service.root.RootService;
import com.lms.service.root.RootServiceImpl;
import com.lms.service.user.UserService;
import com.lms.service.user.UserServiceImpl;
import com.lms.utils.Md5Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet("/bookChange")
public class ChangeBookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RootService rootService = new RootServiceImpl();
        ChangeBook(req, resp, rootService);
    }

    private void ChangeBook(HttpServletRequest req, HttpServletResponse resp, RootService rootService) throws IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String changeBookNo = req.getParameter("changeBookNo");
        String changeBookName = req.getParameter("changeBookName");
        String changeBookNumber = req.getParameter("changeBookNumber");
        String changeBookAuthor = req.getParameter("changeBookAuthor");
        String changeBookPress = req.getParameter("changeBookPress");
        String changeBookPressTime = req.getParameter("changeBookPressTime");
        String changeBookISBN = req.getParameter("changeBookISBN");
        String changeBookAddress = req.getParameter("changeBookAddress");
        rootService.ChangeBook(changeBookNo , changeBookName,changeBookNumber,changeBookAuthor,changeBookPress,changeBookPressTime,changeBookISBN,changeBookAddress);
        resp.sendRedirect(req.getContextPath() + "/RootHome.jsp");
    }
}
