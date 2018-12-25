package com.yan1less.otakus.controller;

import com.yan1less.otakus.pojo.user;
import com.yan1less.otakus.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("submit_info")
    public String EditUserInfo(user user, HttpServletRequest request){

        Boolean succeed = userService.EditUserInfo(user);
        if(succeed)
            request.setAttribute("UserEditInfoSucceed","UserEditInfoSucceed");
        else
            request.setAttribute("UserEditInfoDefeat","UserEditInfoDefeat");
        return "/WEB-INF/back/ToUserMain";
    }
}
