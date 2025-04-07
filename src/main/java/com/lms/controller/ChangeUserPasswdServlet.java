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
import java.net.URLEncoder;

@WebServlet("/UserChange")
public class ChangeUserPasswdServlet extends HttpServlet {

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
        String userPasswd = req.getParameter("changeUserPasswd");
        String userBookId = req.getParameter("changeUserBookId");
        String flag = req.getParameter("userChangeFlag");
        User user = userService.ChangeUserByBookId(userPasswd , userBookId);
        if(flag.equals("user")){
            //用户修改密码
            //获取sission
            HttpSession session = req.getSession();
            //销毁session
            session.invalidate();
            //重定向至登录页面
            String tips = URLEncoder.encode("密码修改成功,请重新登录", "utf-8");
            resp.sendRedirect(req.getContextPath() + "/userLogin.jsp?tips=" + tips);
        }else if(flag.equals("root")){
            //管理员修改密码
            //刷新用户页面
            String tips = URLEncoder.encode("密码修改成功", "utf-8");
            resp.sendRedirect(req.getContextPath() + "/rootIndex.jsp?tips=" + tips);
        }
    }
}
