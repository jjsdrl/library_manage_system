package com.lms.dao;

import com.lms.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface UserMapper {
    //用户信息
    User getUserInfo(@Param("userName") String userName,@Param("userPasswd")String userPasswd);
    //用户注册
    void registerUser(@Param("userName") String userName,@Param("userPasswd")String userPasswd,@Param("userBookId") String userBookId);
    //所有用户信息
    ArrayList<User> AllUser();
}
