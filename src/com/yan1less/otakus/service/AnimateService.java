package com.yan1less.otakus.service;

import com.yan1less.otakus.pojo.animate;
import com.yan1less.otakus.utils.Page;

import java.util.List;

public interface AnimateService {
    public Page<animate> LoadAnimateInfo(Integer currentPage);

    Page<animate> SearchAnimateByTittle(Integer IntCurrentPage,String search_text);

    Page<animate> SearchAnimateByMadeFrom(Integer IntCurrentPage,String search_text);

    Page<animate> SearchAnimateByDate(Integer IntCurrentPage,String search_text);

    Page<animate> SearchAnimateByIntro(Integer IntCurrentPage,String search_text);

    Page<animate> SearchAnimateByCV(Integer IntCurrentPage,String search_text);

    Page<animate> SearchAnimateByTags(Integer intCurrentPage, String search_text);

    Boolean AddNewAnimate(List<animate> animateList);

    boolean judgeYearIsExist(String years);
}
