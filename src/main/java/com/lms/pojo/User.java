package com.lms.pojo;

import lombok.Data;

@Data
public class User {
    //账号
    private String userName;
    //密码
    private String userPasswd;
    //借书证编号
    private String userBookId;
}
