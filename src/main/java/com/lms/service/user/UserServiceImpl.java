package com.lms.service.user;


import com.lms.dao.UserMapper;
import com.lms.pojo.User;
import com.lms.utils.MybatisUtils;

import java.util.ArrayList;
import java.util.List;

public class UserServiceImpl implements UserService{
    @Override
    public User login(String userName, String userPasswd) {
        User user = new User();
        //通过mybatis获取数据
        UserMapper userMapper = MybatisUtils.getSqlSession().getMapper(UserMapper.class);
        //获取root对象
        user = userMapper.getUserInfo(userName,userPasswd);
        System.out.println(user);
        return user;
    }

    @Override
    public User register(String userName, String userPasswd, String userBookId) {
        User user = new User();
        //通过mybatis获取数据
        UserMapper userMapper = MybatisUtils.getSqlSession().getMapper(UserMapper.class);
        //创建User
        userMapper.registerUser(userName , userPasswd , userBookId);
        //获取root对象
        user = userMapper.getUserInfo(userName,userPasswd);
        System.out.println(user);
        return user;
    }

    @Override
    public ArrayList<User> allUser() {
        //通过mybatis获取数据
        UserMapper userMapper = MybatisUtils.getSqlSession().getMapper(UserMapper.class);
        //创建User
        ArrayList<User> users = new ArrayList<>(userMapper.AllUser());
        System.out.println(users);
        return users;


    }
}
