package com.yan1less.otakus.mapper;

import com.yan1less.otakus.pojo.comment;
import com.yan1less.otakus.pojo.user;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FriendMapper {
    //petname
    user SearchFriend(String name);
    //加载用户好友
    List<user> loadUserFriends(@Param("user_id") String user_id,
                               @Param("currentPage") Integer currentPage,
                               @Param("pagesize") Integer pagesize);
    //查询所有好友数量
    Integer SelectAllFriendNumber(String user_id);

    Integer AddFriend(@Param("id") String id,
                      @Param("id2")String id2,
                      @Param("time") String time,
                      @Param("friendid") String name,
                      @Param("userid") String userid);

    user SerachFriendByID(String id);

    Integer DeleteFriend(@Param("friend_id") String id,
                         @Param("user_id") String userid);

    List<comment> LoadFriendComment(String id);

    Integer JudgeIsFriend(@Param("friend_id") String name,
                          @Param("user_id") String userid);
}
