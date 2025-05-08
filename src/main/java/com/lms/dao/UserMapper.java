package com.lms.dao;

import com.lms.pojo.BorrowBook;
import com.lms.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDateTime;
import java.util.ArrayList;

public interface UserMapper {
    //用户信息
    User getUserInfo(@Param("userName") String userName,@Param("userPasswd")String userPasswd);
    //用户注册
    void registerUser(@Param("userName") String userName,@Param("userPasswd")String userPasswd,@Param("userBookId") String userBookId);
    //所有用户信息
    ArrayList<User> AllUser();
    //修改用户密码
    void changeUserPasswdById(@Param("userPasswd")String userPasswd,@Param("userBookId") String userBookId);
    //根据bookid查询用户
    User getUserInfoById(@Param("userBookId") String userBookId);
    //根据bookid查询借书情况
    ArrayList<BorrowBook> BorrowInfoByid(@Param("userBookId") String userBookId);
    //所有借阅情况
    ArrayList<BorrowBook> BorrowInfo();
    //借书
    void addBorrowInfo(@Param("borrowBookNo")String borrowBookNo,@Param("userBookId") String userBookId,@Param("borrowTime") LocalDateTime borrowTime);
    //借完书数量减一
    void bookJJ(@Param("borrowBookNo")String borrowBookNo);
    //修改用户名
    void ChangeUserNameByBookId(@Param("newName")String newName,@Param("userBookId") String userBookId);
    //预约
    void libneed(@Param("changeLibRoomName")String changeLibRoomName);
}
