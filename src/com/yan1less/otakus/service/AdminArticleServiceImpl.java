package com.yan1less.otakus.service;

import com.yan1less.otakus.mapper.AdminArticleMapper;
import com.yan1less.otakus.pojo.admin_article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminArticleServiceImpl implements AdminArticleService{
    @Autowired
    private AdminArticleMapper adminArticleMapper;
    //去具体的帖子
    @Override
    public admin_article LoadAdminArticle(String id) {
        return adminArticleMapper.LoadAdminArticle(id);
    }
    //只返回标题和图片
    @Override
    public List<admin_article> LoadAdminArticleTitle() {
        return adminArticleMapper.LoadAdminArticleTitle();
    }

    @Override
    public Integer AddWatched(String id) {

        return adminArticleMapper.AddWatched(id);
    }
}
