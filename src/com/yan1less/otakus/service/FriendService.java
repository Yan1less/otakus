package com.yan1less.otakus.service;

import com.yan1less.otakus.pojo.comment;
import com.yan1less.otakus.pojo.user;
import com.yan1less.otakus.utils.Page;

import java.util.List;

public interface FriendService {
    //通过名子/id/昵称来查找
    user SearchFriend(String name);
    //通过id来添加,传入两个id互相添加
    Boolean AddFriend(String name,String userid);
    //查找用户好友
    Page<user> loadUserFriends(String user_id,Integer currentPage);
    //通过好友id去好友页面
    user SerachFriendByID(String id);
    //删除好友，同时删除两条
    Boolean DeleteFriend(String id, String userid);
    //通过好友ID来加载好友的评论
    List<comment> LoadFriendComment(String id);
}
