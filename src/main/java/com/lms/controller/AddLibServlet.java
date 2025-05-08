package com.lms.controller;


import com.lms.pojo.Library;
import com.lms.pojo.User;
import com.lms.service.root.RootService;
import com.lms.service.root.RootServiceImpl;
import com.lms.utils.Md5Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet("/addLib")
public class AddLibServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RootService rootService = new RootServiceImpl();
        addLib(req, resp, rootService);
    }

    private void addLib(HttpServletRequest req, HttpServletResponse resp, RootService rootService) throws IOException {
        String addLibRoomName = req.getParameter("addLibRoomName");
        int addLibRoomSize = Integer.parseInt(req.getParameter("addLibRoomSize"));

        Library lib = rootService.addLib(addLibRoomName,addLibRoomSize);
        if (lib != null) {
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
