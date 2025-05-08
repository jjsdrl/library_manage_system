package com.lms.service.user;


import com.lms.dao.UserMapper;
import com.lms.pojo.BorrowBook;
import com.lms.pojo.User;
import com.lms.utils.MybatisUtils;

import java.time.LocalDateTime;
import java.util.ArrayList;

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
        //获取user对象
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

    @Override
    public User ChangeUserByBookId(String userPasswd, String userBookId) {
        User user = new User();
        //通过mybatis获取数据
        UserMapper userMapper = MybatisUtils.getSqlSession().getMapper(UserMapper.class);
        //创建User
        userMapper.changeUserPasswdById(userPasswd , userBookId);
        //获取user对象
        user = userMapper.getUserInfoById(userBookId);
        System.out.println(user);
        return user;
    }

    @Override
    public ArrayList<BorrowBook> BorrowInfoByid(String userBookId) {
        //通过mybatis获取数据
        UserMapper userMapper = MybatisUtils.getSqlSession().getMapper(UserMapper.class);
        //创建User
        ArrayList<BorrowBook> borrowBooks = new ArrayList<>(userMapper.BorrowInfoByid(userBookId));
        System.out.println(borrowBooks);
        return borrowBooks;
    }

    @Override
    public ArrayList<BorrowBook> allborrowInfo() {
        //通过mybatis获取数据
        UserMapper userMapper = MybatisUtils.getSqlSession().getMapper(UserMapper.class);
        //创建User
        ArrayList<BorrowBook> borrowBooks = new ArrayList<>(userMapper.BorrowInfo());
        System.out.println(borrowBooks);
        return borrowBooks;
    }

    @Override
    public void borrow(String borrowBookNo, String userBookId, LocalDateTime borrowTime) {
        //通过mybatis获取数据
        UserMapper userMapper = MybatisUtils.getSqlSession().getMapper(UserMapper.class);
        //创建借书信息
        userMapper.addBorrowInfo(borrowBookNo , userBookId,borrowTime);
        //书本数量减一
        bookJJ(borrowBookNo);
    }

    @Override
    public void bookJJ(String borrowBookNo) {
        //通过mybatis获取数据
        UserMapper userMapper = MybatisUtils.getSqlSession().getMapper(UserMapper.class);
        //书本数量减一
        userMapper.bookJJ(borrowBookNo);
    }

    @Override
    public User ChangeUserNameByBookId(String newName, String userBookId) {
        User user = new User();
        //通过mybatis获取数据
        UserMapper userMapper = MybatisUtils.getSqlSession().getMapper(UserMapper.class);
        //创建User
        userMapper.ChangeUserNameByBookId(newName , userBookId);
        //获取user对象
        user = userMapper.getUserInfoById(userBookId);
        System.out.println(user);
        return user;
    }

    @Override
    public void libneed(String changeLibRoomName) {
        //通过mybatis获取数据
        UserMapper userMapper = MybatisUtils.getSqlSession().getMapper(UserMapper.class);
        userMapper.libneed(changeLibRoomName);
    }


}
