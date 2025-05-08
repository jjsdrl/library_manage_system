package com.lms.service.root;

import com.lms.pojo.*;

import java.time.LocalDateTime;
import java.util.ArrayList;

public interface RootService {
    //管理员登录
    Root login(String rootName , String rootPasswd);
    //根据id删除用户
    void deleteUserById(String userBookId);
    //根据isbn删除书本
    void deleteBookByIsbn(String ISBN);
    //修改书本信息
    void ChangeBook(String changeBookNo, String changeBookName, String changeBookNumber, String changeBookAuthor, String changeBookPress, String changeBookPressTime, String changeBookISBN, String changeBookAddress);
    //删除借阅记录
    void deleteBorrow(String deleteBorrUserBookNo, String deleteBorrUserBookId);
    //还书
    void returnBook(String changeBorrUserBookNo, String changeBorrUserBookId, String state, LocalDateTime returnTime, String changeBorrText);
    //还书后数量加一
    void bookJiaJ(String changeBorrUserBookNo);
    //搜索用户
    ArrayList<User> seleteUser(String seleteuserInfo);
    //搜索借阅情况
    ArrayList<BorrowBook> seleteBorr(String seleteborrInfo);
    //添加用户
    User addUser(String addUserBookId, String userPasswd);
    //借阅室
    ArrayList<Library> allLib();
    //修改借阅室信息
    void libChange(String changeLibRoomName, int changeLibRoomSize);
    //删除借阅室
    void deleteLib(String deleteLibName);
    //新建阅览室
    Library addLib(String addLibRoomName, int addLibRoomSize);
    //模糊查询
    ArrayList<Library> seleteLib(String seleteLibInfo);
}
