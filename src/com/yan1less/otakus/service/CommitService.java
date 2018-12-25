package com.yan1less.otakus.service;

import com.yan1less.otakus.pojo.comment;
import com.yan1less.otakus.utils.Page;

import java.util.List;

public interface CommitService {
    Boolean submit_commit(String id, String commit, String userID);
    //进入页面时加载评论
    List<comment> loadComments(String id);

    Boolean commitPraise(String comment_id);

    //加载用户评论带分页
    Page<comment> loadPageUserComments(String userID, Integer currentPage);
}
