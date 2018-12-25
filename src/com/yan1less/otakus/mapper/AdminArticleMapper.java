package com.yan1less.otakus.mapper;

import com.yan1less.otakus.pojo.admin_article;

import java.util.List;

public interface AdminArticleMapper {
    admin_article LoadAdminArticle(String id);

    List<admin_article> LoadAdminArticleTitle();

    Integer AddWatched(String id);
}
