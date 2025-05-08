package com.lms.controller;

import com.lms.pojo.BorrowBook;
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
import java.time.LocalDateTime;

@WebServlet("/BorrowBook")
public class BorrowServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserService userService = new UserServiceImpl();
        Borrow(req, resp, userService);
    }

    private void Borrow(HttpServletRequest req, HttpServletResponse resp, UserService userService) throws IOException {
        int flag = Integer.parseInt(req.getParameter("hidden-number"));
        if (flag == 1) {
            String borrowBookNo = req.getParameter("borrbookno");
            HttpSession session = req.getSession();
            User loginUser =(User) session.getAttribute("loginUser");
            LocalDateTime borrowTime = LocalDateTime.now();
            System.out.println(borrowBookNo+"    "   +flag+"   "+ loginUser+" "+borrowTime);
            userService.borrow(borrowBookNo , loginUser.getUserBookId() , borrowTime);
            userService.bookJJ(borrowBookNo);
            //重定向至主页
            resp.sendRedirect("UserHome.jsp");
        }else if(flag == 2) {
            String borrowBookNo = req.getParameter("addBorrUserBookNo");
            String addBorrUserBookId = req.getParameter("addBorrUserBookId");
            LocalDateTime borrowTime = LocalDateTime.now();
            userService.borrow(borrowBookNo , addBorrUserBookId , borrowTime);
            userService.bookJJ(borrowBookNo);
            //重定向至主页
            resp.sendRedirect("RootHome.jsp");
        }

    }
}
