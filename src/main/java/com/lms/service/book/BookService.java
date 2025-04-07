package com.lms.service.book;

import com.lms.pojo.Book;

import java.util.ArrayList;

public interface BookService {
    //获取所有书籍信息
    ArrayList<Book> allBook();
    //添加
    Book add(String bookNo, String bookName, int bookNumber, String bookAuthor, String press, String pressTime, String isbn, String address);
}
