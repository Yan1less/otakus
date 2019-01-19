package com.yan1less.otakus.mapper;

import com.yan1less.otakus.pojo.animate;
import com.yan1less.otakus.pojo.animateDate;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnimateMapper {

    Integer getAnimateTotalCount();

    List<animate> loadAnimateInfo(@Param("currentPage") Integer currentPage,
                                  @Param("pageSize") Integer pageSize);

    Integer getAnimateTotalCountByDate(String search_text);
    List<animate> loadAnimateInfoByDate(@Param("currentPage")Integer currentPage,
                                        @Param("pageSize")Integer pageSize,
                                        @Param("search_text")String search_text);


    Integer getAnimateTotalCountByTittle(@Param("search_text")String search_text);
    List<animate> loadAnimateInfoByTittle(@Param("currentPage")Integer currentPage,
                                          @Param("pageSize")Integer pageSize,
                                          @Param("search_text")String search_text);

    Integer getAnimateTotalCountByMadeFrom(String search_text);
    List<animate> loadAnimateInfoByMadeFrom(@Param("currentPage")Integer currentPage,
                                            @Param("pageSize")Integer pageSize,
                                            @Param("search_text")String search_text);

    Integer getAnimateTotalCountByCV(String search_text);
    List<animate> loadAnimateInfoByCV(@Param("currentPage")Integer currentPage,
                                      @Param("pageSize")Integer pageSize,
                                      @Param("search_text")String search_text);

    Integer getAnimateTotalCountByTags(String search_text);
    List<animate> loadAnimateInfoByTags(@Param("currentPage")Integer currentPage,
                                        @Param("pageSize")Integer pageSize,
                                        @Param("search_text")String search_text);

    //加入新动漫
    int LoadNewAnimate(animate bean);
    //判断动漫添加年份，这里是取出已添加的年份
    List<String> LoadExistsyears();

    void addExistYears(animateDate bean);
}
