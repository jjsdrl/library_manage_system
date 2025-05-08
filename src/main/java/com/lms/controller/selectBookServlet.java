package com.lms.controller;

import com.google.gson.Gson;
import com.lms.pojo.Book;
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

@WebServlet("/seleteBook")
public class selectBookServlet extends HttpServlet {
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
            String jsonResponse = seleteBook(req, resp, bookService);
            // 将JSON响应字符串写入响应体
            out.print(jsonResponse);
        } finally {
            out.close(); // 确保PrintWriter被关闭
        }
    }

    private String seleteBook(HttpServletRequest req, HttpServletResponse resp, BookService bookService) throws IOException {
        String seletebookInfo = req.getParameter("seletebookInfo");
        ArrayList<Book> bookArrayList = new ArrayList<Book>(bookService.seleteBook(seletebookInfo));
        System.out.println("接口"+bookArrayList);
        //获取session
        HttpSession session = req.getSession();
        session.setAttribute("BookArrayList", bookArrayList);
        //arraylist转json
        Gson gson = new Gson();
        String seleteBook = gson.toJson(bookArrayList);
        System.out.println("接口"+seleteBook);
        //将json对象返回
        return seleteBook ;
    }

    //post请求
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

