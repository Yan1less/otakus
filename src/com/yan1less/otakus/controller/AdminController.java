package com.yan1less.otakus.controller;

import com.yan1less.otakus.pojo.information;
import com.yan1less.otakus.pojo.user;
import com.yan1less.otakus.service.AdminService;
import com.yan1less.otakus.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;

    //管理员就是一个特殊的user，在extra中设置信息admin即为管理员
    @RequestMapping("UserManager")
    public String ToUserManager(HttpServletRequest request,Integer currentPage){
        Page<user> userList = adminService.loadAllUser(currentPage);
        request.setAttribute("userList",userList);

        return "/WEB-INF/back/user_manager";
    }

    @RequestMapping("DeleteUser")
    public void DeleteUser(String id, HttpServletResponse response) throws IOException {
        System.out.println("id = " + id);
        Boolean succeed = adminService.DeleteAllAboutUser(id);
        if(succeed)
            response.getWriter().write("{\"succeed\":\"1\"}");
        else
            response.getWriter().write("{\"succeed\":\"0\"}");
    }

    @RequestMapping("InfoManager")
    public String ToInfoManager(HttpServletRequest request){
        List<information> invitationList = adminService.LoadAllInfo();
        request.setAttribute("invitationList",invitationList);
        return "/WEB-INF/back/infoManager";
    }

}
