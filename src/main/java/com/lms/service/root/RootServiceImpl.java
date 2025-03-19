package com.lms.service.root;

import com.lms.dao.RootMapper;
import com.lms.pojo.Root;
import com.lms.utils.MybatisUtils;

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
}

