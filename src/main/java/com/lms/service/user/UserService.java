package com.lms.service.user;

import com.lms.pojo.BorrowBook;
import com.lms.pojo.User;

import java.time.LocalDateTime;
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
    //根据bookId返回借书信息
    ArrayList<BorrowBook> BorrowInfoByid(String userBookId);
    //所有借阅信息
    ArrayList<BorrowBook> allborrowInfo();
    //借书
    void borrow(String borrowBookNo, String userBookId, LocalDateTime borrowTime);
    //书减1
    void bookJJ(String borrowBookNo);
    //修改用户名
    User ChangeUserNameByBookId(String newName, String userBookId);
    //预约阅览室
    void libneed(String changeLibRoomName);
}
