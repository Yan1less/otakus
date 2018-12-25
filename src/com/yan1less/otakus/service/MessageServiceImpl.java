package com.yan1less.otakus.service;

import com.yan1less.otakus.mapper.MessageMapper;
import com.yan1less.otakus.pojo.friend_message;
import com.yan1less.otakus.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class MessageServiceImpl implements MessageService{
    @Autowired
    private MessageMapper messageMapper;

    @Override
    public String SearchFriendNameByID(String friend_id) {
        return messageMapper.SearchFriendNameByID(friend_id);
    }

    @Override
    public String SearchFriendIDByName(String friendName) {

        return messageMapper.SearchFriendIDByName(friendName);
    }

    @Override
    public Boolean SubmitMessage(String user_id, String friend_id, String details) {
        String ID = UUID.randomUUID().toString();
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
        String time = df.format(date);

        friend_message fm = new friend_message();
        fm.setFriend_message_id(ID);
        fm.setMessage_from_id(user_id);
        fm.setMessage_to_id(friend_id);
        fm.setSend_time(time);
        fm.setSend_message(details);
        fm.setExtra(null);

        Integer succeed = messageMapper.SubmitMessage(fm);
        if(succeed!=0)
            return true;
        else
            return false;

    }

    @Override
    public Page<friend_message> PrepareUserMessage(String user_id,Integer currentPage) {

        Page<friend_message> FMpage = new Page<friend_message>();
        FMpage.setCurrentPage(currentPage);
        int pagesize = 5;
        FMpage.setCurrentCount(pagesize);
        int totalcount = messageMapper.SearchCountByUserID(user_id);
        FMpage.setTotalCount(totalcount);
        FMpage.setTotalPage((totalcount+pagesize-1)/pagesize);

        List<friend_message> friend_messages = messageMapper.PrepareUserMessage(user_id,(currentPage-1)*pagesize,pagesize);
        //遍历，查询用户的昵称，放到extra中
        for(friend_message fm:friend_messages){
            fm.setExtra(messageMapper.SearchFriendNameByID(fm.getMessage_from_id()));
        }
        FMpage.setRows(friend_messages);
        return FMpage;
    }
}
