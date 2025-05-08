package com.lms.controller;

import com.google.gson.Gson;
import com.lms.pojo.BorrowBook;
import com.lms.service.root.RootService;
import com.lms.service.root.RootServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/seleteBorrow")
public class selectBorrowServlet extends HttpServlet {
    //get请求
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RootService rootService = new RootServiceImpl();

        // 设置响应内容类型为JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
//        String str = AllUser(req, resp, userService);
//        System.out.println("all"+str);
        // 创建一个PrintWriter对象来写入响应体
        PrintWriter out = resp.getWriter();
        try {
            // 构建JSON格式的响应字符串
            String jsonResponse = seleteBorr(req, resp, rootService);
            // 将JSON响应字符串写入响应体
            out.print(jsonResponse);
        } finally {
            out.close(); // 确保PrintWriter被关闭
        }
    }

    private String seleteBorr(HttpServletRequest req, HttpServletResponse resp, RootService rootService) throws IOException {
        String seleteborrInfo = req.getParameter("seleteborrInfo");
        ArrayList<BorrowBook> borrArrayList = new ArrayList<BorrowBook>(rootService.seleteBorr(seleteborrInfo));
        System.out.println("接口"+borrArrayList);
        //获取session
        HttpSession session = req.getSession();
        session.setAttribute("BookArrayList", borrArrayList);
        //arraylist转json
        Gson gson = new Gson();
        String seleteBorr = gson.toJson(borrArrayList);
        System.out.println("接口"+seleteBorr);
        //将json对象返回
        return seleteBorr ;
    }

    //post请求
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

