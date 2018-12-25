package com.yan1less.otakus.service;

import com.yan1less.otakus.pojo.admin_article;

import java.util.List;

public interface AdminArticleService {
    admin_article LoadAdminArticle(String id);

    List<admin_article> LoadAdminArticleTitle();

    Integer AddWatched(String id);
}
