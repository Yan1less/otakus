package com.yan1less.otakus.utils;

import com.yan1less.otakus.mapper.AnimateMapper;
import com.yan1less.otakus.pojo.animate;
import org.apache.ibatis.session.SqlSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class AddNewAnimateUtils {
    @Autowired
    private AnimateMapper animateMapper;
    public boolean CheckYears(String years){
        Pattern compile = Pattern.compile("20\\d{4}");
        Matcher matcher = compile.matcher(years);
        if(matcher.matches()) {
            String temp = years.substring(years.length() - 2, years.length());
            if (temp.equals("01") || temp.equals("04") || temp.equals("07") || temp.equals("10"))
                return true;
        }
        return false;
    }
    public List<animate> DLDLSpider(String url){
        List<animate> animateList = new ArrayList<>();
        String code = GetCode.GetPageCodeByUrl(url);
        Utiils utiils = new Utiils();

        //定义下载地址
        String picdownload = "";
        Document document = Jsoup.parse(code);
        //这一步拿到img标签
        Elements ImgElements = document.select("div[class=anime_list] dl dt a img");
        Elements TittleElements = document.select("div[class=anime_list] dl dd h3 a");
        //d_label下四个元素为一组，分别是地区，年代，标签，制作
        Elements Info1Elements = document.select("div[class=anime_list] dl dd div[class=d_label]");
        //10个为一个循环，第5个是看点，第8个是声优，第九个是简介
        Elements Info2Elements = document.select("div[class=anime_list] dl dd p");

        //由于Info2太多<p></p>且顺序不均等，所以把<p></p>去掉，在进行退位操作
        //获得的新串是由看点，声优，简介，状态组成
        Elements pureInfo2 = utiils.getPureInfo2(Info2Elements);

        int CurrentI = 0;
        int Info1LackedData = 0;
        while (CurrentI<TittleElements.size()){


            animate bean = new animate();
            //设置图片
            //1.先剥去标签，仅留下路径
            String ImgSrc = ImgElements.get(CurrentI).toString();
            String src = utiils.getPureSrc(ImgSrc);
            //2.剥去路径，留下名字
            System.out.println("ImgSrc = "+ImgSrc);
            String ImgName = utiils.getImgName(ImgSrc);

            //3.下载图片并设置bean中图片的路径
            String psypath = "D:/testpic/"+ImgName;
            String LinuxPsyPath = "/root/otakusProject/OTAKUS/web/pics/AnimatePic/"+ImgName;
            GetCode.downloadPicture(src,psypath);
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                System.out.println("下载出现异常");
                e.printStackTrace();
            }

            //设置图片名字
            String logicPath = "/AnimatePic/"+ImgName;
            bean.setImg(logicPath);

            //设置标题
            String tittle = TittleElements.get(CurrentI).toString();
            boolean setTittle = utiils.setTittle(tittle, bean);


            //设置连接
            String link = TittleElements.get(CurrentI).toString();
            boolean setLink = utiils.setLink(link,bean);

            //设置发行地
            String Place = Info1Elements.get(4*CurrentI-Info1LackedData).toString();
            boolean setPlace = utiils.setPlace(Place, bean);
            if(!setPlace) {
                System.out.println("没有发行地，i=" + CurrentI);
            }

            //设置发行时间
            String Time = Info1Elements.get(4*CurrentI+1-Info1LackedData).toString();
            boolean setTime = utiils.setTime(Time, bean);


            //设置标签
            String Tags = Info1Elements.get(4*CurrentI+2-Info1LackedData).toString();
            boolean setTags = utiils.setTags(Tags, bean);




            //设置制作方，这里有可能没有，如果没有的话要退位
            //也有可能有两条
            //也可能有多条,三条的还未看
            String MadeFrom = Info1Elements.get(4*CurrentI+3-Info1LackedData==Info1Elements.size()?Info1Elements.size()-1:4*CurrentI+3-Info1LackedData).toString();
            // String NextMadeFrom = Info1Elements.get(4*CurrentI+3-Info1LackedData+1>=Info1Elements.size()?Info1Elements.size()-1:4*CurrentI+3-Info1LackedData+1).toString();

            boolean setMadeFrom = utiils.setMadeFrom(MadeFrom, bean);
            //boolean setNextMadeFrom = utiils.setMadeFrom(NextMadeFrom, bean);


            int MadeFromInfo = utiils.SearchNextIsMadeFromOrNot(4*CurrentI+3-Info1LackedData,bean,Info1Elements);
            if(!setMadeFrom)
                Info1LackedData++;
            Info1LackedData -=MadeFromInfo;






            //开始操作info2的数据，这个格式到比较整齐，不用退位
            // 读取看点
            String WatchPoint = (pureInfo2.get(CurrentI*4).toString());
            boolean setWatchPoint = utiils.setWatchPoint(WatchPoint, bean);

            //读取声优
            String CV = pureInfo2.get(CurrentI*4+1).toString();
            boolean setCV = utiils.setCV(CV, bean);


            //读取简介
            String Intro = pureInfo2.get(CurrentI*4+2).toString();
            utiils.setIntro(Intro, bean);

            //设置id
            utiils.setID(bean);

            //设置连接



            animateList.add(bean);
            CurrentI++;

        }

        return animateList;

    }
}
