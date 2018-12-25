package com.yan1less.otakus.mapper;

import com.yan1less.otakus.pojo.comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommitMapper {
    String SearchUsernameByID(String userID);

    Integer submit_commit(@Param("comment_id") String comment_id,
                          @Param("from_information_id") String id,
                          @Param("from_user_id")String userID,
                          @Param("from_informationname") String infoname,
                          @Param("from_username")String username,
                          @Param("comment_time")String comment_time,
                          @Param("commit_details")String commit
                          );

    List<comment> loadComments(String id);


    //点赞
    Integer getcommitPraise(String comment_id);

    Integer setcommitPraise(@Param("comment_id") String comment_id,
                            @Param("praise") Integer praise);


    List<comment> loadUserComments(@Param("userID") String userID,
                                   @Param("currentPage") Integer currentPage,
                                   @Param("pagesize")Integer pagesize);

    String getInfoNameById(String id);

    //查询总条数
    Integer getCommitTotalCount(String userID);
}
