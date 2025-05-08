package com.lms.controller;

import com.lms.service.root.RootService;
import com.lms.service.root.RootServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/libChange")
public class ChangeLibServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RootService rootService = new RootServiceImpl();
        libChange(req, resp, rootService);
    }

    private void libChange(HttpServletRequest req, HttpServletResponse resp, RootService rootService) throws IOException {
        String changeLibRoomName = req.getParameter("changeLibRoomName");
        String changeLibRoomSize = req.getParameter("changeLibRoomSize");
        rootService.libChange(changeLibRoomName, Integer.parseInt(changeLibRoomSize));
        resp.sendRedirect(req.getContextPath() + "/RootHome.jsp");
    }
}
