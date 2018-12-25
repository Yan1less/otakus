package com.yan1less.otakus.service;

import com.yan1less.otakus.mapper.ArticleMapper;
import com.yan1less.otakus.pojo.comment;
import com.yan1less.otakus.pojo.information;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;
    //准备数据
    @Override
    public List<information> PrepareData() {
        List<information> articles = articleMapper.PrepareData();
        return articles;
    }
    //发帖,这里的username其实是user表中的petname
    @Override
    public Boolean SubmitInformation(String information_id,String main_information, String title, String id,String username) {
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
        String time = df.format(date);



        Integer succeed = articleMapper.SubmitInformation(information_id,title,id,username,main_information,time);
        System.out.println("service: " + succeed);
        if (succeed!=0)
            return true;
        else
            return false;
    }

    @Override
    public information loadArticleDetails(String id) {

        return articleMapper.loadArticleDetails(id);
    }

    @Override
    public List<information> selectInvitationByUserId(String user_id) {
        return articleMapper.selectInvitationByUserId(user_id);
    }

    @Override
    public Boolean AddTotalVisited(String id) {
        Integer succeed = articleMapper.AddTotalVisited(id);
        if(succeed !=0)
            return true;
        else
            return false;
    }

    @Override
    public Boolean AddTotalCommit(String id) {
        Integer succeed = articleMapper.AddTotalCommit(id);
        if(succeed !=0)
            return true;
        else
            return false;
    }

    @Override
    public List<comment> SelectCommentByInfoID(String information_id) {
        return articleMapper.SelectCommentByInfoID(information_id);
    }

    @Override
    public Boolean DeleteInformationByID(String id) {
        Integer success = articleMapper.DeleteInformationByID(id);
        //因为有可能没有评论，所以不接受这个数据
        articleMapper.DeleteCommitByID(id);
        if(success!=0)
            return true;
        else
            return false;

    }


    @Override
    public Boolean SetArticlePic(String artId,String savePath) {
        Integer succeed = articleMapper.UpdateArticlePic(artId,savePath);
        if (succeed==1)
            return true;
        else
            return false;
    }


}
