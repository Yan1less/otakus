package com.yan1less.otakus.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class IndexController {



    //进入登录页面
    @RequestMapping("/login.action")
    public  String ToLogin(){
        return "/WEB-INF/login/login";
    }

    //进入注册页面
    @RequestMapping("/logon.action")
    public String ToLogon(){
        return "/WEB-INF/login/logon";
    }


//    去用户主页
    @RequestMapping("usermain.action")
    public String ToUserMain(){
        return "/WEB-INF/back/profile";
    }
//    去编辑用户信息页面
    @RequestMapping("user_editinfo.action")
    public String EditInfo(){
        return "/WEB-INF/back/edit_information";
    }
//    去发帖页面
    @RequestMapping("send_invitation.action")
    public String ToSend_Invitation(){ return "/WEB-INF/back/send_invitation";}

    @RequestMapping("calendar")
    public String ToCalender(){return "/WEB-INF/back/calendar";}

    //联系我们
    @RequestMapping("contact")
    public String ToContact(){
        return "/WEB-INF/front/page/contact";
    }

    @RequestMapping("adminLogin")
    public String AdminLogin(){
        return "/WEB-INF/back/adminlogin";
    }


}
