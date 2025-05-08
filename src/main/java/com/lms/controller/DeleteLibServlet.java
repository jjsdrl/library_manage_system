package com.lms.controller;


import com.lms.service.root.RootService;
import com.lms.service.root.RootServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteLib")
public class DeleteLibServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RootService rootService = new RootServiceImpl();
        deleteLib(req, resp, rootService);
    }

    private void deleteLib(HttpServletRequest req, HttpServletResponse resp, RootService rootService) throws IOException {
        String deleteLibName = req.getParameter("deleteLibName");
        rootService.deleteLib(deleteLibName);
        resp.sendRedirect(req.getContextPath() + "/RootHome.jsp");
    }
}
