package com.yan1less.otakus.service;

import com.yan1less.otakus.mapper.AnimateMapper;
import com.yan1less.otakus.pojo.animate;
import com.yan1less.otakus.pojo.animateDate;
import com.yan1less.otakus.utils.Page;
import com.yan1less.otakus.utils.SolrJ;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class AnimateServiceImpl implements AnimateService{
    @Autowired
    private AnimateMapper animateMapper;
    @Override
    public Page<animate> LoadAnimateInfo(Integer currentPage) {
        Page<animate> AnimatePage = new Page<animate>();
        Integer pageSize = 5;
        AnimatePage.setCurrentCount(pageSize);

        Integer totalCount = animateMapper.getAnimateTotalCount();
        AnimatePage.setTotalCount(totalCount);
        Integer totalPage = (totalCount+pageSize-1)/pageSize;
        AnimatePage.setTotalPage(totalPage);

        if(currentPage == null|currentPage<1|currentPage>totalPage)
            currentPage = 1;
        AnimatePage.setCurrentPage(currentPage);
        AnimatePage.setRows(animateMapper.loadAnimateInfo((currentPage-1)*pageSize,pageSize));
        return AnimatePage;

    }

    @Override
    public Page<animate> SearchAnimateByTittle(Integer currentPage,String search_text) {
        search_text = "%"+search_text+"%";
        Page<animate> AnimatePage = new Page<animate>();
        Integer pageSize = 5;
        AnimatePage.setCurrentCount(pageSize);

        Integer totalCount = animateMapper.getAnimateTotalCountByTittle(search_text);
        AnimatePage.setTotalCount(totalCount);
        Integer totalPage = (totalCount+pageSize-1)/pageSize;
        AnimatePage.setTotalPage(totalPage);

        if(currentPage == null|currentPage<1|currentPage>totalPage)
            currentPage = 1;
        AnimatePage.setCurrentPage(currentPage);
        AnimatePage.setRows(animateMapper.loadAnimateInfoByTittle((currentPage-1)*pageSize,pageSize,search_text));
        return AnimatePage;

    }

    @Override
    public Page<animate> SearchAnimateByMadeFrom(Integer currentPage,String search_text) {
        search_text = "%"+search_text+"%";
        Page<animate> AnimatePage = new Page<animate>();
        Integer pageSize = 5;
        AnimatePage.setCurrentCount(pageSize);

        Integer totalCount = animateMapper.getAnimateTotalCountByMadeFrom(search_text);
        AnimatePage.setTotalCount(totalCount);
        Integer totalPage = (totalCount+pageSize-1)/pageSize;
        AnimatePage.setTotalPage(totalPage);

        if(currentPage == null|currentPage<1|currentPage>totalPage)
            currentPage = 1;
        AnimatePage.setCurrentPage(currentPage);
        AnimatePage.setRows(animateMapper.loadAnimateInfoByMadeFrom((currentPage-1)*pageSize,pageSize,search_text));
        return AnimatePage;

    }
    //通过时间查询
    @Override
    public Page<animate> SearchAnimateByDate(Integer currentPage,String search_text) {
        Page<animate> AnimatePage = new Page<animate>();
        Integer pageSize = 5;
        AnimatePage.setCurrentCount(pageSize);

        Integer totalCount = animateMapper.getAnimateTotalCountByDate(search_text);
        AnimatePage.setTotalCount(totalCount);
        Integer totalPage = (totalCount+pageSize-1)/pageSize;
        AnimatePage.setTotalPage(totalPage);

        if(currentPage == null|currentPage<1|currentPage>totalPage)
            currentPage = 1;
        AnimatePage.setCurrentPage(currentPage);
        AnimatePage.setRows(animateMapper.loadAnimateInfoByDate((currentPage-1)*pageSize,pageSize,search_text));
        return AnimatePage;
    }
    //这个是走solr服务器
    @Override
    public Page<animate> SearchAnimateByIntro(Integer currentPage,String search_text) {
        if(currentPage == null|currentPage<1)
            currentPage = 1;
        SolrJ solrJ = new SolrJ();
        return solrJ.SearchAnimateByIntro(currentPage,search_text);
    }

    @Override
    public Page<animate> SearchAnimateByCV(Integer currentPage,String search_text) {
        search_text = "%"+search_text+"%";
        Page<animate> AnimatePage = new Page<animate>();
        Integer pageSize = 5;
        AnimatePage.setCurrentCount(pageSize);

        Integer totalCount = animateMapper.getAnimateTotalCountByCV(search_text);
        AnimatePage.setTotalCount(totalCount);
        Integer totalPage = (totalCount+pageSize-1)/pageSize;
        AnimatePage.setTotalPage(totalPage);

        if(currentPage == null|currentPage<1|currentPage>totalPage)
            currentPage = 1;
        AnimatePage.setCurrentPage(currentPage);
        AnimatePage.setRows(animateMapper.loadAnimateInfoByCV((currentPage-1)*pageSize,pageSize,search_text));
        return AnimatePage;
    }

    @Override
    public Page<animate> SearchAnimateByTags(Integer currentPage, String search_text) {
        search_text = "%"+search_text+"%";
        Page<animate> AnimatePage = new Page<animate>();
        Integer pageSize = 5;
        AnimatePage.setCurrentCount(pageSize);

        Integer totalCount = animateMapper.getAnimateTotalCountByTags(search_text);
        AnimatePage.setTotalCount(totalCount);
        Integer totalPage = (totalCount+pageSize-1)/pageSize;
        AnimatePage.setTotalPage(totalPage);

        if(currentPage == null|currentPage<1|currentPage>totalPage)
            currentPage = 1;
        AnimatePage.setCurrentPage(currentPage);
        AnimatePage.setRows(animateMapper.loadAnimateInfoByTags((currentPage-1)*pageSize,pageSize,search_text));
        return AnimatePage;
    }

    @Override
    public Boolean AddNewAnimate(List<animate> animateList) {
        System.out.println(animateList.toString());
        for(animate animate:animateList){
            animateMapper.LoadNewAnimate(animate);
        }
        return true;
    }

    @Override
    public boolean judgeYearIsExist(String years) {
        List<String> yearList = animateMapper.LoadExistsyears();
        for (String temp:yearList){
            if(temp.equals(years))
                return true;
        }
        return false;
    }

    @Override
    public Boolean addExistYears(String years) {
        Date now = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss a zzz");
        String time = ft.format(now);
        animateDate bean = new animateDate();
        bean.setYears(years);bean.setAddDate(time);
        animateMapper.addExistYears(bean);
        return null;
    }
}
