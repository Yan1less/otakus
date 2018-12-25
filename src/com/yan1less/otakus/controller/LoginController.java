package com.yan1less.otakus.controller;

import com.yan1less.otakus.pojo.user;
import com.yan1less.otakus.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class LoginController {
    @Autowired
    private LoginService loginService;
    //用户登录
    @RequestMapping("/mylogin")
    public String Login(String logname, String logpass, HttpServletRequest request){


        user user = loginService.Login(logname, logpass);
        //代表该用户是管理员
        if(user.getExtra().equals("admin"))
            user = null;
        if(user==null){

            request.setAttribute("error","登录失败，账号或密码错误");
            request.setAttribute("LogInDefeat","LogInDefeat");

        }
        else {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            request.setAttribute("LogInSucceed","LogInSucceed");

        }
        return "/WEB-INF/front/page/ToMainPage";

    }
    //用户注册
    @RequestMapping("/register")
    public String  Register(user user,HttpServletRequest request){
        boolean succeed = loginService.Register(user);
        if (succeed){
            request.getSession().setAttribute("user",user);
            //注册成功，返回引导页
            return "/leadpage/index";
        }

        else
            return "/WEB-INF/login/logon";
    }

    //管理员登录
    @RequestMapping("/adminloginsubmit")
    public String AdminLogin(String admin_name , String admin_pas , HttpServletRequest request){

        System.out.println("xxx");
        user admin = loginService.Login(admin_name, admin_pas);
        //代表该用户是管理员
        if(!admin.getExtra().equals("admin"))
            admin = null;
        if(admin==null){

            request.setAttribute("error","登录失败，账号或密码错误");
            request.setAttribute("LogInDefeat","LogInDefeat");

        }
        else {
            request.getSession().setAttribute("user", admin);

            request.setAttribute("LogInSucceed","LogInSucceed");

        }
        return "/WEB-INF/front/page/ToMainPage";

    }
}
