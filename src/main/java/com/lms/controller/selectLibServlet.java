package com.lms.controller;

import com.google.gson.Gson;
import com.lms.pojo.Library;
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

@WebServlet("/seleteLib")
public class selectLibServlet extends HttpServlet {
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
            String jsonResponse = seleteLib(req, resp, rootService);
            // 将JSON响应字符串写入响应体
            out.print(jsonResponse);
        } finally {
            out.close(); // 确保PrintWriter被关闭
        }
    }

    private String seleteLib(HttpServletRequest req, HttpServletResponse resp, RootService rootService) throws IOException {
        String seleteLibInfo = req.getParameter("seleteLibInfo");
        ArrayList<Library> libArrayList = new ArrayList<Library>(rootService.seleteLib(seleteLibInfo));
        System.out.println("接口"+libArrayList);
        //获取session
        HttpSession session = req.getSession();
        session.setAttribute("libArrayList", libArrayList);
        //arraylist转json
        Gson gson = new Gson();
        String seleteLib = gson.toJson(libArrayList);
        System.out.println("接口"+seleteLib);
        //将json对象返回
        return seleteLib ;
    }

    //post请求
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

