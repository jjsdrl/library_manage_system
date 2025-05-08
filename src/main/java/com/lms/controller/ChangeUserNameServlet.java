package com.lms.controller;

import com.lms.pojo.User;
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

@WebServlet("/userNameChange")
public class ChangeUserNameServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserService userService = new UserServiceImpl();
        Change(req, resp, userService);
    }

    private void Change(HttpServletRequest req, HttpServletResponse resp, UserService userService) throws IOException {
        String userBookId = req.getParameter("changeusernameBookId");
        String newName = req.getParameter("newName");
            //用户修改密码
            User user = userService.ChangeUserNameByBookId(newName , userBookId);
            System.out.println(user);
            //获取sission
            HttpSession session = req.getSession();
            //将数据存入session
            session.setAttribute("loginUser",user );
            //重定向至登录页面
            String tips = URLEncoder.encode("用户名修改成功", "utf-8");
            resp.sendRedirect(req.getContextPath() + "/UserHome.jsp?tips=" + tips);
    }
}
