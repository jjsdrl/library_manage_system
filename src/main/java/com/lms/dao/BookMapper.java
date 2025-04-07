package com.lms.dao;

import com.lms.pojo.Book;

import java.util.ArrayList;

public interface BookMapper {
    //获取图书信息
    ArrayList<Book> AllBook();
    //新增
    Book add(String bookNo, String bookName, int bookNumber, String bookAuthor, String press, String pressTime, String ISBN, String address);
}
