package com.yan1less.otakus.utils;

import com.yan1less.otakus.pojo.lolNews;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class LoadNews {
    public List<lolNews> loadLOLNews() throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from lolNews limit 0,5";
        return qr.query(sql,new BeanListHandler<lolNews>(lolNews.class));
    }
}
