package com.lms.controller;

import com.lms.service.root.RootService;
import com.lms.service.root.RootServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/returnBook")
public class ReturnBookServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RootService rootService = new RootServiceImpl();
        returnBook(req, resp, rootService);
    }

    private void returnBook(HttpServletRequest req, HttpServletResponse resp, RootService rootService) throws IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String changeBorrUserBookNo = req.getParameter("changeBorrUserBookNo");
        String changeBorrUserBookId = req.getParameter("changeBorrUserBookId");
        String changeBorrText = req.getParameter("changeBorrText");
        String state = "已归还";
        LocalDateTime returnTime = LocalDateTime.now();
        rootService.returnBook(changeBorrUserBookNo,changeBorrUserBookId,state,returnTime,changeBorrText);
        rootService.bookJiaJ(changeBorrUserBookNo);
        resp.sendRedirect(req.getContextPath() + "/RootHome.jsp");
    }
}
