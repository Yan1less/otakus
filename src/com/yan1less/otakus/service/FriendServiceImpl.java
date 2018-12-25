package com.yan1less.otakus.service;

import com.yan1less.otakus.mapper.FriendMapper;
import com.yan1less.otakus.pojo.comment;
import com.yan1less.otakus.pojo.user;
import com.yan1less.otakus.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class FriendServiceImpl implements  FriendService {
    @Autowired
    private FriendMapper friendMapper;

    @Override
    public user SearchFriend(String name) {
        user user = friendMapper.SearchFriend(name);
        return user;
    }
    //再添加好友前需要判断两人是不是好友
    @Override
    public Boolean AddFriend(String name,String userid) {

        Integer isfriend = friendMapper.JudgeIsFriend(name,userid);
        if(isfriend!=0)
            return false;
        else {
            String id = UUID.randomUUID().toString();
            String id2 = UUID.randomUUID().toString();
            Date date = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
            String time = df.format(date);

            Integer succeed = friendMapper.AddFriend(id, id2, time, name, userid);
            if (succeed != 0)
                return true;
            else
                return false;
        }


    }

    @Override
    public Page<user> loadUserFriends(String user_id,Integer currentPage) {
        Page<user> page = new Page<user>();
        Integer pagesize = 5;
        page.setCurrentCount(pagesize);
        page.setCurrentPage(currentPage);
        Integer totalcount = friendMapper.SelectAllFriendNumber(user_id);
        page.setTotalCount(totalcount);
        page.setTotalPage((totalcount+pagesize-1)/pagesize);
        List<user> users = friendMapper.loadUserFriends(user_id,(currentPage-1)*pagesize,pagesize);
        page.setRows(users);
        return page;
    }

    @Override
    public user SerachFriendByID(String id) {
        return friendMapper.SerachFriendByID(id);
    }

    @Override
    public Boolean DeleteFriend(String id, String userid) {
        Integer succeed = friendMapper.DeleteFriend(id,userid);
        Integer othersucceed = friendMapper.DeleteFriend(userid,id);

        if(succeed!=0 && othersucceed!=0)
            return true;
        else
            return false;
    }

    @Override
    public List<comment> LoadFriendComment(String id) {
        return friendMapper.LoadFriendComment(id);
    }
}
