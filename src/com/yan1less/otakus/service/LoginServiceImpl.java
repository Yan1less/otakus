package com.yan1less.otakus.service;

import com.yan1less.otakus.mapper.LoginDao;
import com.yan1less.otakus.pojo.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class LoginServiceImpl implements LoginService{

    @Autowired
    private LoginDao loginDao;
    @Override
    public user Login(String id, String password) {
        user user = loginDao.Login(id,password);
        return user;
    }

    @Override
    public boolean Register(user user) {
        String id = UUID.randomUUID().toString();

        user.setUser_id(id);
        user.setExtra("futsu");
        Integer succeed = loginDao.Register(user);
        if (succeed!=0)
            return true;
        else
            return false;
    }
}
