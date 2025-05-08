package com.lms.dao;

import com.lms.pojo.Book;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface BookMapper {
    //获取图书信息
    ArrayList<Book> AllBook();
    //新增
    void add(@Param("bookNo")String bookNo,@Param("bookName") String bookName,@Param("bookNumber") int bookNumber,@Param("bookAuthor") String bookAuthor,@Param("press") String press,@Param("pressTime") String pressTime,@Param("ISBN") String ISBN,@Param("address") String address);
    //搜索
    ArrayList<Book> seleteBook(@Param("seletebookInfo")String seletebookInfo);
    //查询
    Book findBook(@Param("bookNo")String bookNo,@Param("bookName") String bookName,@Param("bookNumber") int bookNumber,@Param("bookAuthor") String bookAuthor,@Param("press") String press,@Param("pressTime") String pressTime,@Param("ISBN") String ISBN,@Param("address") String address);
}
