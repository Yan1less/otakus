package com.yan1less.otakus.service;

import com.yan1less.otakus.pojo.information;
import com.yan1less.otakus.pojo.user;
import com.yan1less.otakus.utils.Page;

import java.util.List;

public interface AdminService {
    Page<user> loadAllUser(Integer curentPage);
    //删除用户所有有关的数据
    Boolean DeleteAllAboutUser(String id);

    List<information> LoadAllInfo();
}
