package com.yan1less.otakus.mapper;

import com.yan1less.otakus.pojo.comment;
import com.yan1less.otakus.pojo.information;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleMapper {
    List<information> PrepareData();

    Integer SubmitInformation(@Param("information_id") String information_id,
                              @Param("title") String title,
                              @Param("id") String id,
                              @Param("from_username")String username,
                              @Param("main_information") String main_information,
                              @Param("time") String time);

    information loadArticleDetails(String id);
    //跳转到用户页面中的 我的帖子 页面
    List<information> selectInvitationByUserId(String user_id);
    //总访问量+1
    Integer AddTotalVisited(String id);
    //评论量+1
    Integer AddTotalCommit(String id);

    List<comment> SelectCommentByInfoID(String information_id);
    //删帖子
    Integer DeleteInformationByID(String id);
    //删评论
    Integer DeleteCommitByID(String id);
    //设置图片
    Integer UpdateArticlePic(@Param("information_id") String artId,
                             @Param("pics") String savePath);
}
