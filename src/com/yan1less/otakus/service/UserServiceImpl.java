package com.yan1less.otakus.service;

import com.yan1less.otakus.mapper.UserMapper;
import com.yan1less.otakus.pojo.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Override
    public Boolean EditUserInfo(user user) {
        System.out.println(user.getUser_id());

        System.out.println(user.getAddress());
        //可以从session中取出用户ID，不过这里通过表单中的hidden属性来直接传到后台
        Integer succeed = userMapper.EditUserInfo(user);
        System.out.println(succeed);
        if(succeed==1)
            return true;
        else

        return null;
    }
}
