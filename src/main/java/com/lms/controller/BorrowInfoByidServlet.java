package com.lms.controller;

import com.google.gson.Gson;
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
import java.io.PrintWriter;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@WebServlet("/BorrowInfoByid")
public class BorrowInfoByidServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserService userService = new UserServiceImpl();

        // 设置响应内容类型为JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
//        String str = AllUser(req, resp, userService);
//        System.out.println("all"+str);
        // 创建一个PrintWriter对象来写入响应体
        PrintWriter out = resp.getWriter();
        try {
            // 构建JSON格式的响应字符串
            String jsonResponse = BorrowInfoByid(req, resp, userService);
            // 将JSON响应字符串写入响应体
            out.print(jsonResponse);
        } finally {
            out.close(); // 确保PrintWriter被关闭
        }
    }

    private String BorrowInfoByid(HttpServletRequest req, HttpServletResponse resp, UserService userService) {
        //获取session
        HttpSession session = req.getSession();
        User loginUser =(User) session.getAttribute("loginUser");
        String userBookId = loginUser.getUserBookId();
        System.out.println(userBookId);
        ArrayList<BorrowBook> borrowBookArrayList = new ArrayList<>(userService.BorrowInfoByid(userBookId));
        System.out.println("接口"+borrowBookArrayList);
        session.setAttribute("borrowBookArrayList", borrowBookArrayList);
        //重定向至主页
//        resp.sendRedirect("AllUserInfo.jsp");
//        resp.sendRedirect("index.jsp");

        //arraylist转json
        Gson gson = new Gson();
        String borrowBooks = gson.toJson(borrowBookArrayList);
        System.out.println("接口"+borrowBooks);
        //将json对象返回
        return borrowBooks;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
