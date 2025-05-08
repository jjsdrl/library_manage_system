package com.lms.service.book;

import com.lms.dao.BookMapper;
import com.lms.pojo.Book;
import com.lms.utils.MybatisUtils;

import java.util.ArrayList;

public class BookServiceImpl implements BookService {
    @Override
    public ArrayList<Book> allBook() {
        //通过mybatis获取数据
        BookMapper bookMapper = MybatisUtils.getSqlSession().getMapper(BookMapper.class);
        //获取信息
        ArrayList<Book> books = new ArrayList<>(bookMapper.AllBook());
        System.out.println(books);
        return books;
    }

    @Override
    public Book add(String bookNo, String bookName, int bookNumber, String bookAuthor, String press, String pressTime, String ISBN, String address) {
        //通过mybatis获取数据
        BookMapper bookMapper = MybatisUtils.getSqlSession().getMapper(BookMapper.class);
        //创建User
        bookMapper.add(bookNo , bookName,bookNumber,bookAuthor,press,pressTime,ISBN,address);
        Book book = bookMapper.findBook(bookNo , bookName,bookNumber,bookAuthor,press,pressTime,ISBN,address);
        System.out.println(book);
        return book;
    }

    @Override
    public ArrayList<Book> seleteBook(String seletebookInfo) {
        //通过mybatis获取数据
        BookMapper bookMapper = MybatisUtils.getSqlSession().getMapper(BookMapper.class);
        //获取信息
        ArrayList<Book> books = new ArrayList<>(bookMapper.seleteBook(seletebookInfo));
        System.out.println(books);
        return books;
    }
}
