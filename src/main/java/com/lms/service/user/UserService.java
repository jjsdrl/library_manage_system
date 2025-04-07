package com.lms.service.user;

import com.lms.pojo.User;

import java.util.ArrayList;

public interface UserService {
    //用户登录
    User login(String rootName , String rootPasswd);
    //用户注册
    User register(String userName, String userPasswd, String userBookId);
    //所有用户
    ArrayList<User> allUser();
    //根据bookid修改用户密码
    User ChangeUserByBookId(String userPasswd, String userBookId);
}
