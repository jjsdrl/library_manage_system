package com.lms.service.root;

import com.lms.pojo.Root;

public interface RootService {
    //管理员登录
    Root login(String rootName , String rootPasswd);
}
