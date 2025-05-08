package com.lms.dao;

import com.lms.pojo.BorrowBook;
import com.lms.pojo.Library;
import com.lms.pojo.Root;
import com.lms.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDateTime;
import java.util.ArrayList;

public interface RootMapper {
    //登录
    Root getRootInfo(@Param("rootName") String rootNumber , @Param("rootPasswd") String rootPasswd);
    //删除用户
    void deleteUserById(@Param("userBookId") String userBookId);
    //删除书本
    void deleteBookByIsbn(@Param("ISBN") String ISBN);
    //修改书本
    void ChangeBook(@Param("changeBookNo")String changeBookNo, @Param("changeBookName")String changeBookName, @Param("changeBookNumber")String changeBookNumber,@Param("changeBookAuthor") String changeBookAuthor,@Param("changeBookPress") String changeBookPress,@Param("changeBookPressTime") String changeBookPressTime, @Param("changeBookISBN")String changeBookISBN, @Param("changeBookAddress")String changeBookAddress);
    //删除借书记录
    void deleteBorrow(@Param("deleteBorrUserBookNo")String deleteBorrUserBookNo,@Param("deleteBorrUserBookId") String deleteBorrUserBookId);
    //还书
    void returnBook(@Param("changeBorrUserBookNo")String changeBorrUserBookNo, @Param("changeBorrUserBookId")String changeBorrUserBookId,@Param("state") String state,@Param("returnTime") LocalDateTime returnTime, @Param("changeBorrText")String changeBorrText);
    //还书后书的数量加一
    void bookJiaJ(@Param("changeBorrUserBookNo")String changeBorrUserBookNo);
    //查询用户
    ArrayList<User> seleteUser(@Param("seleteuserInfo")String seleteuserInfo);
    //查询借阅情况
    ArrayList<BorrowBook> seleteBorr(@Param("seleteborrInfo")String seleteborrInfo);
    //新增用户
    void addUser(@Param("addUserBookId")String addUserBookId,@Param("userPasswd") String userPasswd);
    //所有借阅室
    ArrayList<Library> allLib();
    //修改借阅室容量
    void libChange(@Param("changeLibRoomName")String changeLibRoomName,@Param("changeLibRoomSize") int changeLibRoomSize);
    //删除借阅室
    void deleteLib(@Param("deleteLibName")String deleteLibName);
    //新建
    void addLib(@Param("addLibRoomName")String addLibRoomName,@Param("addLibRoomSize") int addLibRoomSize);
    //根据roomid获取借阅室信息
    Library getLibInfo(@Param("addLibRoomName")String addLibRoomName);
    //模糊查询借阅室
    ArrayList<Library> seleteLib(@Param("seleteLibInfo")String seleteLibInfo);
}
