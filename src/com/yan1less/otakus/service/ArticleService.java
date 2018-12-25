package com.yan1less.otakus.service;

import com.yan1less.otakus.pojo.comment;
import com.yan1less.otakus.pojo.information;

import java.util.List;

public interface ArticleService {
    //跳到帖子主页
    List<information> PrepareData();
    //发帖子
    Boolean SubmitInformation(String information_id,String main_information, String title, String id,String username);
    //通过id找到帖子
    information loadArticleDetails(String id);
    //跳转到用户页面中的 我的帖子 页面
    List<information> selectInvitationByUserId(String user_id);
    //访问量+1
    Boolean AddTotalVisited(String id);
    //评论量+1
    Boolean AddTotalCommit(String id);
    //在用户页面显示近期评论信息
    List<comment> SelectCommentByInfoID(String information_id);
    //用户页面删除帖子
    Boolean DeleteInformationByID(String id);
    //更新值
    Boolean SetArticlePic(String artId,String savePath);
}
