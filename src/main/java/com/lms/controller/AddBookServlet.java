package com.lms.controller;

import com.lms.pojo.Book;
import com.lms.pojo.User;
import com.lms.service.book.BookService;
import com.lms.service.book.BookServiceImpl;
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

@WebServlet("/AddBook")
public class AddBookServlet extends HttpServlet {
    //get请求
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    //post请求
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BookService bookService = new BookServiceImpl();
        add(req, resp, bookService);

    }

    //登录
    private void add(HttpServletRequest req, HttpServletResponse resp, BookService bookService) throws IOException, ServletException {
        //获取页面输入
        String bookNo = req.getParameter("addBookNo");
        String bookName = req.getParameter("addBookName");
        int bookNumber = Integer.parseInt(req.getParameter("addBookNumber"));
        String bookAuthor = req.getParameter("addBookAuthor");
        String press = req.getParameter("addBookPress");
        String pressTime = req.getParameter("addBookPressTime");
        String ISBN = req.getParameter("addBookISBN");
        String address = req.getParameter("addBookAddress");
        //添加
        Book book = bookService.add(bookNo , bookName,bookNumber,bookAuthor,press,pressTime,ISBN,address);
        System.out.println(book);
        //判断是否添加成功
        if(book != null){
            //获取session
            HttpSession session = req.getSession();
            //将数据存入session
            session.setAttribute("addBook",book );
            //重定向至主页
            resp.sendRedirect(req.getContextPath() + "/RootHome.jsp");
        }else{
//            req.setAttribute("msg","用户名或密码错误");
//            req.getRequestDispatcher("login.jsp").forward(req,resp);
            String tips = URLEncoder.encode("添加失败请重新输入", "utf-8");
            //向页面输出错误原因
            resp.sendRedirect(req.getContextPath() + "/RootHome.jsp?tips=" + tips);
        }
    }
}
