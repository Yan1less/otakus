package com.yan1less.otakus.service;


import com.yan1less.otakus.pojo.friend_message;
import com.yan1less.otakus.utils.Page;

public interface MessageService {
    //通过传来的friend名字查询friend的昵称
    String SearchFriendNameByID(String friend_id);
    //通过传来的昵称查询id
    String SearchFriendIDByName(String friendName);
    //发消息
    Boolean SubmitMessage(String user_id, String friend_id, String details);
    //跳到收信息页面时要准备的数据
    Page<friend_message> PrepareUserMessage(String user_id,Integer currentPage);
}
