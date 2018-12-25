package com.yan1less.otakus.utils;

import com.yan1less.otakus.pojo.animate;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class SolrJ {
    public Page<animate> SearchAnimateByIntro(Integer IntCurrentPage, String search_text) {
        String baseURL="http://localhost:8081/solr/";
        //单机版连接
        SolrServer solrServer = new HttpSolrServer(baseURL);
        SolrQuery solrQuery = new SolrQuery();
        solrQuery.setHighlightFragsize(10000);

        solrQuery.set("df","animate_introduce");
        solrQuery.setQuery(search_text);
        //排序
        solrQuery.addSort("animate_introduce",SolrQuery.ORDER.asc);
        //分页
        int pageSide =5;
        solrQuery.setStart((IntCurrentPage-1)*pageSide);
        solrQuery.setRows(pageSide);
        //高亮
        solrQuery.setHighlight(true);
        solrQuery.addHighlightField("animate_introduce");
        solrQuery.setHighlightSimplePre("<span style='color:red'>");
        solrQuery.setHighlightSimplePost("</span>");
        //执行查询
        QueryResponse query = null;
        try {
            query = solrServer.query(solrQuery);
        } catch (SolrServerException e) {
            System.out.println("solr查询失败");
            e.printStackTrace();
        }
        //文档结果集
        SolrDocumentList results = query.getResults();

        //高亮容器
        Map<String, Map<String, List<String>>> highlighting = query.getHighlighting();
        List<animate> animateList = new ArrayList<animate>();
        for(SolrDocument sd:results){
            animate animate = new animate();
            Map<String, List<String>> map = highlighting.get(sd.get("id"));
            animate.setIntroduce(map.get("animate_introduce").get(0));
            animate.setAnimate_id((String) sd.get("id"));
            animate.setCharacterVoice((String) sd.get("animate_characterVoice"));
            animate.setDate((String) sd.get("animate_date"));
            animate.setImg((String) sd.get("animate_img"));
            animate.setWatchPoint((String) sd.get("animate_watchPoint"));
            animate.setLink((String) sd.get("animate_link"));
            animate.setPlace((String) sd.get("animate_place"));
            animate.setTittle((String) sd.get("animate_tittle"));
            animate.setMadeFrom((String) sd.get("animate_madeFrom"));
            animate.setTag((String) sd.get("animate_tag"));
            animateList.add(animate);
        }
        Page<animate> animatePage = new Page<animate>();
        animatePage.setRows(animateList);
        animatePage.setTotalCount((int) results.getNumFound());
        animatePage.setCurrentCount(pageSide);

        animatePage.setTotalPage(((int) results.getNumFound()+pageSide-1)/pageSide);
        animatePage.setCurrentPage(IntCurrentPage);
        System.out.println("succeed");
        return animatePage;
    }

}
