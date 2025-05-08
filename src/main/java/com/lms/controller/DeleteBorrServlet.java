package com.lms.controller;


import com.lms.service.root.RootService;
import com.lms.service.root.RootServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteBorrow")
public class DeleteBorrServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RootService rootService = new RootServiceImpl();
        deleteBorrow(req, resp, rootService);
    }

    private void deleteBorrow(HttpServletRequest req, HttpServletResponse resp, RootService rootService) throws IOException {
        String deleteBorrUserBookId = req.getParameter("deleteBorrUserBookId");
        String deleteBorrUserBookNo = req.getParameter("deleteBorrUserBookNo");
        rootService.deleteBorrow(deleteBorrUserBookNo,deleteBorrUserBookId);
        resp.sendRedirect(req.getContextPath() + "/RootHome.jsp");
    }
}
