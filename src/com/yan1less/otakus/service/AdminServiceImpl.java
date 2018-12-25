package com.yan1less.otakus.service;

import com.yan1less.otakus.mapper.AdminMapper;
import com.yan1less.otakus.pojo.information;
import com.yan1less.otakus.pojo.user;
import com.yan1less.otakus.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;


    @Override
    public Page<user> loadAllUser(Integer currentPage) {




        if(currentPage == null)
            currentPage = 1;
        Page<user> userPage = new Page<user>();

        Integer pagesize = 5;
        userPage.setCurrentCount(pagesize);
        userPage.setCurrentPage(currentPage);
        Integer totalcount = adminMapper.getUserTotalCount();
        userPage.setTotalPage((totalcount+pagesize-1)/pagesize);
        userPage.setTotalCount(totalcount);
        List<user> userList =  adminMapper.loadAllUser((currentPage-1)*pagesize,pagesize);
        userPage.setRows(userList);
        return userPage;

    }

    @Override
    public Boolean DeleteAllAboutUser(String id) {
        //删除所有表中和本用户有关的数据
        //picture，user，user_friend，media,infomation,friend_message,comment
        //这两条都是删除user_friend表中数据的，因为好友表中一个好友信息存了两条，所以需要两条都删
        Integer FriendNumber1 = adminMapper.DeleteFriendTableDataByUserID(id);
        Integer FriendNumber2 = adminMapper.DeleteFriendTableDataByFriendID(id);
        //删除user表
        Integer userNumber = adminMapper.DeleteUserTableData(id);
        //删除pictrue表
        Integer picture = adminMapper.DeletePictureTableData(id);
        //删除media表
        Integer media = adminMapper.DeleteMediaTableData(id);
        //删除info表
        Integer info = adminMapper.DeleteInformationTableData(id);
        //删除comment表
        Integer comment = adminMapper.DeleteCommentTableData(id);
        //删除friend_message表
        Integer friend_message1 = adminMapper.DeleteFriendMessageTableDataByFrom(id);
        Integer friend_message2 = adminMapper.DeleteFriendMessageTableDataByTo(id);
        System.out.println("friendnumber = " + FriendNumber1+FriendNumber2 + "\n"
        +"userNumber = " + userNumber+ "\n"+
        "picture = " + picture + "\n" +
        "media = " + media +"\n" +
        "info = " + info + "\n" +
        "comment = " + comment + "\n" +
        "friend_mess = " + friend_message1+friend_message2);
        if(userNumber==1)
            return true;
        else
            return false;
    }

    @Override
    public List<information> LoadAllInfo() {
        return adminMapper.LoadAllInfo();
    }
}
