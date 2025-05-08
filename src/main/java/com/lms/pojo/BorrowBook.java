package com.lms.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class BorrowBook {
    //书本编号
    private String bookNo;
    //借书者id
    private String userBookId;
    //状态
    private String state;
    //借书时间
    private Date borrowTime;
    //还书时间
    private Date returnTime;
    //备注
    private String text;

}
