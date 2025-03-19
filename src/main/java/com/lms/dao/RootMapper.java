package com.lms.dao;

import com.lms.pojo.Root;
import org.apache.ibatis.annotations.Param;

public interface RootMapper {
    //登录
    public Root getRootInfo(@Param("rootName") String rootNumber , @Param("rootPasswd") String rootPasswd);
}
