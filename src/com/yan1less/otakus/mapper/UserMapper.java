package com.yan1less.otakus.mapper;

import com.yan1less.otakus.pojo.user;

public interface UserMapper {
    Integer EditUserInfo(user user);

    String SelectPetnameByID(String user_id);
}
