package com.lms.controller;

import com.google.gson.Gson;
import com.lms.pojo.Book;
import com.lms.pojo.User;
import com.lms.service.book.BookService;
import com.lms.service.book.BookServiceImpl;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/AllBook")
public class AllBookServlet extends HttpServlet {
    //get请求
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BookService bookService = new BookServiceImpl();

        // 设置响应内容类型为JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
//        String str = AllUser(req, resp, userService);
//        System.out.println("all"+str);
        // 创建一个PrintWriter对象来写入响应体
        PrintWriter out = resp.getWriter();
        try {
            // 构建JSON格式的响应字符串
            String jsonResponse = AllBook(req, resp, bookService);
            // 将JSON响应字符串写入响应体
            out.print(jsonResponse);
        } finally {
            out.close(); // 确保PrintWriter被关闭
        }
    }

    private String AllBook(HttpServletRequest req, HttpServletResponse resp, BookService bookService) throws IOException {
        ArrayList<Book> bookArrayList = new ArrayList<Book>(bookService.allBook());
        System.out.println("接口"+bookArrayList);
        //获取session
        HttpSession session = req.getSession();
        session.setAttribute("BookArrayList", bookArrayList);
        //arraylist转json
        Gson gson = new Gson();
        String allbook = gson.toJson(bookArrayList);
        System.out.println("接口"+allbook);
        //将json对象返回
        return allbook ;
    }

    //post请求
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

