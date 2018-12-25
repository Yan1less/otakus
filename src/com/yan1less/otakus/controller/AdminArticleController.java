package com.yan1less.otakus.controller;

import com.yan1less.otakus.pojo.admin_article;
import com.yan1less.otakus.service.AdminArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
//管理员推荐帖子
public class AdminArticleController {
    @Autowired
    private AdminArticleService adminArticleService;
    //进入管理员帖子页面
    @RequestMapping("adminArticle")
    public String LoadAdminArticle(String id, HttpServletRequest request){

        admin_article article = adminArticleService.LoadAdminArticle(id);
        request.setAttribute("adminArticle",article);
        //访问量+1
        int rtn = adminArticleService.AddWatched(id);
        System.out.println(rtn);
        return "/AdminArticle/w1";
    }
    //进入帖子页面



}
