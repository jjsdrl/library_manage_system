package com.lms.pojo;

import lombok.Data;

@Data
public class Book {
    //图书编号
    private String bookNo;
    //图书名字
    private String bookName;
    //图书数量
    private int bookNumber;
    //作者
    private String bookAuthor;
    //出版社
    private String press;
    //出版时间
    private String pressTime;
    //ISBN码
    private String ISBN;
    //地址
    private String address;
}
