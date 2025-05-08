package com.lms.service.root;

import com.lms.dao.BookMapper;
import com.lms.dao.RootMapper;
import com.lms.dao.UserMapper;
import com.lms.pojo.*;
import com.lms.utils.MybatisUtils;

import java.time.LocalDateTime;
import java.util.ArrayList;

public class RootServiceImpl implements RootService {


    @Override
    public Root login(String rootName, String rootPasswd) {
        Root root = new Root();
        //通过mybatis获取数据
        RootMapper rootMapper = MybatisUtils.getSqlSession().getMapper(RootMapper.class);
        //获取root对象
        root = rootMapper.getRootInfo(rootName,rootPasswd);
        System.out.println(root);
        return root;
    }

    @Override
    public void deleteUserById(String userBookId) {
        //通过mybatis获取数据
        RootMapper rootMapper = MybatisUtils.getSqlSession().getMapper(RootMapper.class);
        //删除用户
        rootMapper.deleteUserById(userBookId);
    }
    @Override
    public void deleteBookByIsbn(String ISBN) {
        //通过mybatis获取数据
        RootMapper rootMapper = MybatisUtils.getSqlSession().getMapper(RootMapper.class);
        //删除用户
        rootMapper.deleteBookByIsbn(ISBN);
    }

    @Override
    public void ChangeBook(String changeBookNo, String changeBookName, String changeBookNumber, String changeBookAuthor, String changeBookPress, String changeBookPressTime, String changeBookISBN, String changeBookAddress) {
        RootMapper rootMapper = MybatisUtils.getSqlSession().getMapper(RootMapper.class);
        //修改书本
        rootMapper.ChangeBook(changeBookNo , changeBookName,changeBookNumber,changeBookAuthor,changeBookPress,changeBookPressTime,changeBookISBN,changeBookAddress);

    }

    @Override
    public void deleteBorrow(String deleteBorrUserBookNo, String deleteBorrUserBookId) {
        RootMapper rootMapper = MybatisUtils.getSqlSession().getMapper(RootMapper.class);
        //删除借书记录
        rootMapper.deleteBorrow(deleteBorrUserBookNo,deleteBorrUserBookId);

    }

    @Override
    public void returnBook(String changeBorrUserBookNo, String changeBorrUserBookId, String state, LocalDateTime returnTime, String changeBorrText) {
        RootMapper rootMapper = MybatisUtils.getSqlSession().getMapper(RootMapper.class);
        //还书
        rootMapper.returnBook(changeBorrUserBookNo,changeBorrUserBookId,state,returnTime,changeBorrText);
    }

    @Override
    public void bookJiaJ(String changeBorrUserBookNo) {
        RootMapper rootMapper = MybatisUtils.getSqlSession().getMapper(RootMapper.class);
        //还书
        rootMapper.bookJiaJ(changeBorrUserBookNo);
    }

    @Override
    public ArrayList<User> seleteUser(String seleteuserInfo) {
        //通过mybatis获取数据
        RootMapper rootMapper = MybatisUtils.getSqlSession().getMapper(RootMapper.class);
        //获取信息
        ArrayList<User> users = new ArrayList<>(rootMapper.seleteUser(seleteuserInfo));
        System.out.println(users);
        return users;
    }

    @Override
    public ArrayList<BorrowBook> seleteBorr(String seleteborrInfo) {
        //通过mybatis获取数据
        RootMapper rootMapper = MybatisUtils.getSqlSession().getMapper(RootMapper.class);
        //获取信息
        ArrayList<BorrowBook> borrs = new ArrayList<>(rootMapper.seleteBorr(seleteborrInfo));
        System.out.println(borrs);
        return borrs;
    }

    @Override
    public User addUser(String addUserBookId, String userPasswd) {
        //通过mybatis获取数据
        RootMapper rootMapper = MybatisUtils.getSqlSession().getMapper(RootMapper.class);
        UserMapper userMapper = MybatisUtils.getSqlSession().getMapper(UserMapper.class);
        //创建User
        rootMapper.addUser(addUserBookId , userPasswd);
        //获取user对象
        User user = userMapper.getUserInfo(addUserBookId,userPasswd);
        System.out.println(user);
        return user;
    }

    @Override
    public ArrayList<Library> allLib() {
        //通过mybatis获取数据
        RootMapper rootMapper = MybatisUtils.getSqlSession().getMapper(RootMapper.class);
        //获取信息
        ArrayList<Library> libs = new ArrayList<>(rootMapper.allLib());
        System.out.println(libs);
        return libs;
    }

    @Override
    public void libChange(String changeLibRoomName, int changeLibRoomSize) {
        RootMapper rootMapper = MybatisUtils.getSqlSession().getMapper(RootMapper.class);
        rootMapper.libChange(changeLibRoomName , changeLibRoomSize);
    }

    @Override
    public void deleteLib(String deleteLibName) {
        RootMapper rootMapper = MybatisUtils.getSqlSession().getMapper(RootMapper.class);
        rootMapper.deleteLib(deleteLibName);
    }

    @Override
    public Library addLib(String addLibRoomName, int addLibRoomSize) {
        //通过mybatis获取数据
        RootMapper rootMapper = MybatisUtils.getSqlSession().getMapper(RootMapper.class);
        rootMapper.addLib(addLibRoomName , addLibRoomSize);
        Library lib = rootMapper.getLibInfo(addLibRoomName);
        System.out.println(lib);
        return lib;
    }

    @Override
    public ArrayList<Library> seleteLib(String seleteLibInfo) {
        //通过mybatis获取数据
        RootMapper rootMapper = MybatisUtils.getSqlSession().getMapper(RootMapper.class);
        //获取信息
        ArrayList<Library> libs = new ArrayList<>(rootMapper.seleteLib(seleteLibInfo));
        System.out.println(libs);
        return libs;
    }

}

