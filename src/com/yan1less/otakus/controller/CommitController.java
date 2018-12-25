package com.yan1less.otakus.controller;

import com.yan1less.otakus.pojo.comment;
import com.yan1less.otakus.pojo.user;
import com.yan1less.otakus.service.ArticleService;
import com.yan1less.otakus.service.CommitService;
import com.yan1less.otakus.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class CommitController {
    @Autowired
    private CommitService commitService;

    @Autowired
    private ArticleService articleService;
//  提交评论
    @ResponseBody
    @RequestMapping("Commit")
    public void Commit(String id , String commit , String userID, HttpServletResponse response) throws IOException {
        //分别接受到帖子id，评论内容，用户id
        Boolean success = commitService.submit_commit(id,commit,userID);

        //在对帖子的评论量属性自增
        Boolean TotalCommitSuccess = articleService.AddTotalCommit(id);
        if(success && TotalCommitSuccess)
            response.getWriter().write("{\"succeed\":\"succeed\"}");
        else
            response.getWriter().write("{\"succeed\":\"false\"}");
    }
    //评论点赞
    @ResponseBody
    @RequestMapping("commentPraise")
    public void  CommitPraise(String comment_id){
        Boolean success = commitService.commitPraise(comment_id);
        if(success)
            System.out.println("成功");
        else
            System.out.println("失败");
    }

    //去我的评论，需要加载数据
    @RequestMapping("my_commit")
    public String ToMyCommit(HttpServletRequest request,Integer currentPage){
        user user = (user)request.getSession().getAttribute("user");
        String userID = user.getUser_id();
       // List<comment> comments = commitService.loadUserComments(userID);
//        request.setAttribute("comments",comments);
        System.out.println(currentPage);

        Page<comment> page = commitService.loadPageUserComments(userID,currentPage);
        request.setAttribute("page",page);



        return "/WEB-INF/back/my_commit";
    }
}
