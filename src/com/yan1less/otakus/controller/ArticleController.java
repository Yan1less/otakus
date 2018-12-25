package com.yan1less.otakus.controller;

import com.yan1less.otakus.pojo.*;

import com.yan1less.otakus.service.AdminArticleService;
import com.yan1less.otakus.service.ArticleService;
import com.yan1less.otakus.service.CommitService;
import com.yan1less.otakus.utils.LoadNews;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

@Controller
public class ArticleController {
    @Autowired
    private ArticleService articleService;

    @Autowired
    private CommitService commitService;

    @Autowired
    private AdminArticleService adminArticleService;

    //从前台页面跳转去帖子页面
    @RequestMapping("article.action")
    public String ToArticle(HttpServletRequest request){
        //还要准备数据（文章）
        List<information> articles = articleService.PrepareData();
        request.setAttribute("articles",articles);

        //准备管理员推荐
        List<admin_article> admin_articles = adminArticleService.LoadAdminArticleTitle();

        request.setAttribute("admin_articles",admin_articles);
        //还要准备新闻
        LoadNews loadNews = new LoadNews();
        try {
            List<lolNews> lolNewsList = loadNews.loadLOLNews();
            request.setAttribute("news",lolNewsList);
        } catch (SQLException e) {
            System.out.println("连接强孙数据库服务器异常");
            e.printStackTrace();
        }


        return "/WEB-INF/front/page/article";
    }
    //从后台编辑页面提交
    @ResponseBody
    @RequestMapping("submit_information.action")
    public void SubmitInfo(String main_information, String title,HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println(title+"       "+main_information);
        user user = (user)request.getSession().getAttribute("user");
        String id = user.getUser_id();
        String username = user.getPetname();


        //参数分别是帖子内容，帖子标题，来自用户的id，来自用户的名字
        //这个是帖子id，需要返回进行重置图片操作
        String information_id = UUID.randomUUID().toString();

        Boolean success = articleService.SubmitInformation(information_id,main_information,title,id,username);

        if (success)
            response.getWriter().write("{\"information_id\":\""+information_id+"\",\"ResultState\":\"yes\"}");
        else
            response.getWriter().write("0");
    }

    //跳转到帖子页面时需要准备的数据，分为帖子头和评论部分
//    帖子中的访问量也要+1
    @RequestMapping("ArticleDetail")
    public String ArticleDetail(String id,HttpServletRequest request){
        //帖子头
        information article = articleService.loadArticleDetails(id);
        request.setAttribute("article",article);


        //评论
        List<comment> comment =  commitService.loadComments(id);
        request.setAttribute("comment",comment);

        //访问量+1
        Boolean succeed = articleService.AddTotalVisited(id);
        return "/WEB-INF/front/page/article-details";
    }
    //后台页面，我的帖子
    @RequestMapping("my_article")
    public String MyArticle(HttpServletRequest request){
        user user = (user)request.getSession().getAttribute("user");
        String user_id = user.getUser_id();
        List<information> invitation = articleService.selectInvitationByUserId(user_id);
        request.setAttribute("invitation",invitation);
        //加载评论

        //通过id在commit表中寻找对应的评论，再把所有评论放进一个大容器中
        List<comment> totalComment = new ArrayList<comment>();
        for (information info:invitation) {
            List<comment> tempcomment = articleService.SelectCommentByInfoID(info.getInformation_id());
            totalComment.addAll(tempcomment);
        }

        Collections.sort(totalComment, new Comparator<comment>() {
            @Override
            public int compare(comment comment1, comment comment2) {
                if(comment1.getComment_time().compareTo(comment2.getComment_time())>0)
                    return -1;
                else  if(comment1.getComment_time().compareTo(comment2.getComment_time())==0)
                    return 0;
                else
                    return 1;
            }
        });
        request.setAttribute("totalComment",totalComment);
        return "/WEB-INF/back/my_invitation";
    }
    @ResponseBody
    @RequestMapping
    public void DeleteInformation(String id,HttpServletResponse response) throws IOException {
        //删除帖子信息和评论信息
        Boolean succeed = articleService.DeleteInformationByID(id);

        if(succeed)
             response.getWriter().write("1");
        else
            response.getWriter().write("0");
    }




    //设置帖子图片
    @RequestMapping("SetArtPic")
    public String SetArtPic(HttpServletRequest request,String actId,
                         MultipartFile pictureFileArt) throws IOException {


        if(!pictureFileArt.isEmpty()) {
            String ext = FilenameUtils.getExtension(pictureFileArt.getOriginalFilename());
            if(ext.equals("jpg") ||ext.equals("png")) {
                //当前的文件保存路径，以后会改
                String currentPath = "D:\\IDEAProgram\\OTAKUS\\web\\ArtPic\\";
                String name = UUID.randomUUID().toString() + "." + FilenameUtils.getExtension(pictureFileArt.getOriginalFilename());
                //存储到当前Artpic下
                pictureFileArt.transferTo(new File(currentPath + name));

//
//                //存储到war包的pic下,路径：D:\IDEAProgram\OTAKUS\out\artifacts\OTAKUS_war_exploded\pic\
                String realPath = request.getSession().getServletContext().getRealPath("/ArtPic/"+name);
                pictureFileArt.transferTo(new File(realPath));

                //存储到数据库中，这里只是更改了一下帖子的pic下的值
                String SavePath = "/ArtPic/"+name;

                Boolean succeed =
                articleService.SetArticlePic(actId,SavePath);

                if(succeed) {

                    return "/WEB-INF/back/ToPic";
                }
                else
                    return "/WEB-INF/back/error";
            }
            else {
                System.out.println("不是图片文件:"+ext);
                return "/WEB-INF/back/error";
            }
        }
        else {
            System.out.println("未选中文件");
            return "/WEB-INF/back/error";
        }

    }


}
