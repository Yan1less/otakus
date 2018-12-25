package com.yan1less.otakus.service;

import com.yan1less.otakus.pojo.user;

public interface LoginService {

    //登录
    user Login(String id,String password);
    //注册
    boolean Register(user user);
}
