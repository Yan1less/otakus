package com.yan1less.otakus.mapper;

import com.yan1less.otakus.pojo.user;
import org.apache.ibatis.annotations.Param;

public interface LoginDao {
    //用户登录
    user Login(@Param("username") String username, @Param("password") String password);
    //用户注册
    Integer Register(user user);
}
