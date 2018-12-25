package com.yan1less.otakus.service;

import com.yan1less.otakus.mapper.CommitMapper;
import com.yan1less.otakus.pojo.comment;
import com.yan1less.otakus.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class CommitServiceImpl implements CommitService{
    @Autowired
    private CommitMapper commitMapper;

    @Override
    public Boolean submit_commit(String id, String commit, String userID) {
        //通过帖子ID找到帖子名字，再把帖子名字给封进去
        String infoname = commitMapper.getInfoNameById(id);


        String comment_id = UUID.randomUUID().toString();

        String username = commitMapper.SearchUsernameByID(userID);

        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
        String comment_time = df.format(date);



        Integer success = commitMapper.submit_commit(comment_id,id,userID,infoname,username,comment_time,commit);
        if(success!=0)
            return true;
        else
            return false;
    }

    @Override
    public List<comment> loadComments(String id) {
        List<comment> comment = commitMapper.loadComments(id);

        return comment;
    }

    @Override
    public Boolean commitPraise(String comment_id) {
        Integer praise = commitMapper.getcommitPraise(comment_id);
        praise +=1;
        Integer success = commitMapper.setcommitPraise(comment_id,praise);
        if(success!=0)
            return true;
        else
            return false;

    }



    @Override
    public Page<comment> loadPageUserComments(String userID, Integer currentPage) {
        if(currentPage == null)
            currentPage = 1;
        Page<comment> commentPage = new Page<comment>();

        Integer pagesize = 5;
        commentPage.setCurrentCount(pagesize);
        commentPage.setCurrentPage(currentPage);
        Integer totalcount = commitMapper.getCommitTotalCount(userID);
        commentPage.setTotalPage((totalcount+pagesize-1)/pagesize);
        commentPage.setTotalCount(totalcount);
        commentPage.setRows(commitMapper.loadUserComments(userID,(currentPage-1)*pagesize,pagesize));
        return commentPage;
    }
}
