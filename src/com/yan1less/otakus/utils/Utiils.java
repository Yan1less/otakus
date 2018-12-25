package com.yan1less.otakus.utils;


import com.yan1less.otakus.mapper.AnimateMapper;
import com.yan1less.otakus.pojo.animate;
import org.apache.ibatis.session.SqlSession;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Utiils {
    //一次只接受一组


    public boolean setWatchPoint(String watchPoint,animate bean) {


        //match=<p><b>看点：</b>有生之年系列！</p>
        Pattern compile = Pattern.compile("(<p><b>看点：</b>([\\u4E00-\\u9FA5|\\\\！|\\\\,|\\\\。|\\\\（|\\\\）|\\\\《|\\\\》|\\\\“|\\\\”|\\\\？|\\\\：|\\\\；|\\\\【|\\\\】|\\S|\\s]*)</p>)");
        Matcher matcher = compile.matcher(watchPoint);
        if(matcher.matches()) {
            bean.setWatchPoint(matcher.group(2));
            return true;
        }
        return false;
    }


    public boolean setCV(String cv, animate bean) {
        //match=<p><b>声优：</b><a href="/cast/Atsushi">阿部敦</a><a href="/cast/OkamotoNobuhiko">冈本信彦</a><a href="/cast/IguchiYuka">井口裕香</a><a href="/cast/HinoSatoshi">日野聪</a><a href="/cast/AraiSatomi">新井里美</a><a href="/cast/SatouRina">佐藤利奈</a></p>
       // String temp = "<p><b>声优：</b><a href=\"/cast/Atsushi\">阿部敦</a><a href=\"/cast/OkamotoNobuhiko\">冈本信彦</a><a href=\"/cast/IguchiYuka\">井口裕香</a><a href=\"/cast/HinoSatoshi\">日野聪</a><a href=\"/cast/AraiSatomi\">新井里美</a><a href=\"/cast/SatouRina\">佐藤利奈</a></p>\n";
        int flag=0;
        Pattern p3 = Pattern.compile("(<a href=\"/cast/[\\s|\\S]*?>([\\u4E00-\\u9FA5]*)</a>)");
        Matcher m3 = p3.matcher(cv);
        String temp = "";
        while (m3.find()) {
            temp =temp + m3.group(2)+" & ";
            flag=1;
        }
        if(flag==1){
            temp = temp.substring(0,temp.length()-2);
            bean.setCharacterVoice(temp);
            return true;
        }
        return false;
    }

    public boolean setIntro(String intro, animate bean) {
        //match=<p><b>简介：</b>电视动画《魔法禁书目录Ⅲ》改编自日本轻小说家镰池和马原作的轻小说《魔法禁书目录》，是电视动画《魔法禁书目录》系列的第3期。2017年10月1日，在“电击文库 秋之祭典2017”活动当中正式宣布了《魔法禁书目录Ⅲ》的制作决定!将于2018年10月播出</p>
        Pattern compile = Pattern.compile("(<p><b>简介：</b>([\\u4E00-\\u9FA5|\\\\！|\\\\,|\\\\。|\\\\（|\\\\）|\\\\《|\\\\》|\\\\“|\\\\”|\\\\？|\\\\：|\\\\；|\\\\【|\\\\】|\\S|\\s]*)</p>)");
        Matcher matcher = compile.matcher(intro);
        if(matcher.matches()) {
            bean.setIntroduce(matcher.group(2));
            return true;
        }
        return false;
    }

    public boolean setPlace(String place, animate bean) {
        //发行地区
        Pattern p1 = Pattern.compile("[\\s|\\S]*<a href=\"/.*/\" title=\"[\u4E00-\u9FA5]*\">([\u4E00-\u9FA5]*)</a>[\\s|\\S]*");
        Matcher m1 = p1.matcher(place);
        if (m1.matches()){
            bean.setPlace(m1.group(1));
            return true;
        }
        return false;
    }

    public boolean setTime(String time, animate bean) {
        //发行时间<a href="/anime/201807/" title="2018年7月番剧">2018年7月</a>
        Pattern p2 = Pattern.compile("[\\s|\\S]*<a href=\"/anime/\\d*/\" title=\"\\d*年\\d*月番剧\">(\\d*[\u4E00-\u9FA5]*\\d*[\u4E00-\u9FA5]*)</a>[\\s|\\S]*");
        Matcher m2 = p2.matcher(time);
        if (m2.matches()){
            bean.setDate(m2.group(1));
            return true;
        }
        return false;
    }

    public boolean setTags(String tags, animate bean) {
        //标签
        int flag = 0;
        Pattern p3 = Pattern.compile("( <a href=[\\s|\\S]*?>([\u4E00-\u9FA5]*)</a>)");
        Matcher m3 = p3.matcher(tags);
        String temp = "";
        while (m3.find()) {
            temp =temp + m3.group(2)+" & ";
            flag=1;
        }
        if(flag==1) {
            temp = temp.substring(0, temp.length() - 2);
            bean.setTag(temp);
            return true;
        }
        return false;
    }

    public boolean setMadeFrom(String madeFrom, animate bean) {
        //制作商
        Pattern p4 = Pattern.compile("[\\s|\\S]*<a href=\"/staff/[\\s|\\S]*>([\\s|\\S]*)</a>[\\s|\\S]*");
        Matcher m4 = p4.matcher(madeFrom);
        if (m4.matches()){
            bean.setMadeFrom(m4.group(1));
            return true;
        }
        return false;
    }

    public boolean setTittle(String tittle, animate bean) {
        //match=<a href="/anime/project-index3/">魔法禁书目录第三季</a>
        Pattern compile = Pattern.compile("(<a href=\"/anime/[\\s|\\S]*?/\">([\\u4E00-\\u9FA5|\\\\！|\\\\,|\\\\。|\\\\（|\\\\）|\\\\《|\\\\》|\\\\“|\\\\”|\\\\？|\\\\：|\\\\；|\\\\【|\\\\】|\\S|\\s]*)</a>)");
        Matcher matcher = compile.matcher(tittle);
        if(matcher.matches()) {
            bean.setTittle(matcher.group(2));
            return true;
        }
        return false;
    }


    public String getPureSrc(String imgSrc) {
        //match=<img src="http://www.dilidili.wang/uploads/allimg/180706/290_1052592331.jpg">
        String pureSrc = "";
        Pattern pattern = Pattern.compile("<img src=\"([\\s|\\S]*)\"[\\s|\\S]*>");
        Matcher matcher = pattern.matcher(imgSrc);
        if(matcher.matches())
            pureSrc=matcher.group(1);
        return pureSrc;
    }

    public String getImgName(String imgSrc) {
        //match=<img src="http://www.dilidili.wang/uploads/allimg/180706/290_1052592331.jpg">
        //<img src="http://www.dilidili.wang/images/cover/5400.jpg">
        String ImgName = "";
        Pattern pattern = Pattern.compile("<img src=\"http://www\\.dilidili\\.wang/uploads/[\\s|\\S]*/([\\s|\\S]*)\"[\\s|\\S]*>");
        Matcher matcher = pattern.matcher(imgSrc);
        if(matcher.matches())
            ImgName=matcher.group(1);

        if(ImgName.equals(""))
            ImgName = this.getImgName2(imgSrc);
        if(ImgName.equals(""))
            ImgName = this.getImgName3(imgSrc);
        if(ImgName.equals(""))
            ImgName = this.getFullImgName(imgSrc);
        if(ImgName.contains("?")){
            return  ImgName.substring(0,ImgName.indexOf("?"));
        }
        //处理<img src="http://www.dilidili.wang/uploads/allimg/161118/1_1633465201.jpg  &#10;">

        if(ImgName.charAt(ImgName.length()-4)!='.') {
            if(ImgName.contains(" "))
                ImgName = ImgName.substring(0,ImgName.indexOf('.') + 4);

        }
        return ImgName;
    }

    public String getImgName2(String imgSrc){
        String ImgName = "";
        Pattern compile = Pattern.compile("<img src=\"http://www\\.dilidili\\.wang/+images/([\\s|\\S]*)\"[\\s|\\S]*>");
        Matcher matcher = compile.matcher(imgSrc);
        if(matcher.matches()) {
            ImgName = matcher.group(1);
            ImgName = ImgName.replace("/","_");
        }
        return ImgName;
    }

    public String getImgName3(String imgSrc){
        //<img src="http://www.dilidili.wang//uploads/201602/1-16021611104c35.jpg">
        String ImgName = "";
        Pattern compile = Pattern.compile("<img src=\"http://www\\.dilidili\\.wang//uploads/([\\s|\\S]*)\"[\\s|\\S]*>");
        Matcher matcher = compile.matcher(imgSrc);
        if(matcher.matches()) {
            ImgName = matcher.group(1);
            ImgName = ImgName.replace("/","_");
        }
        return ImgName;
    }
    public String getFullImgName(String imgSrc){
        //<img src="https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=515150241,2811387496&amp;fm=58">
        String ImgName = "";
        Pattern compile = Pattern.compile("<img src=\"([\\s|\\S]*)\"[\\s|\\S]*>");
        Matcher matcher = compile.matcher(imgSrc);
        if(matcher.matches()) {
            ImgName = matcher.group(1);
            int start = ImgName.lastIndexOf("/")+1;
            int end = ImgName.length();
            ImgName = ImgName.substring(start,end);
        }
        return ImgName;
    }


    public Elements getPureInfo2(Elements Info2Elements) {
        List<Element> elementsList = new ArrayList<Element>();
        for (int i = 0;i<Info2Elements.size();i++) {
            Element element = Info2Elements.get(i);
            if(element.toString().matches("\\s?<p></p>\\s?")){
                Info2Elements.get(i).remove();
            }
            else {
                elementsList.add(Info2Elements.get(i));
            }
        }
        Elements PureInfo2Element = new Elements(elementsList);

        return PureInfo2Element;

    }
    //传入当前位置，返回接下来几条也制作组的逻辑
    public int SearchNextIsMadeFromOrNot(int CurrentPostion, animate bean, Elements Info1Elements) {
        //System.out.println("CurrentPostion = "+CurrentPostion);
        int MadeFromInfo = 0;
        int temp = 1;

            while (true) {
                String NextMadeFrom = Info1Elements.get(CurrentPostion + temp >= Info1Elements.size() ? Info1Elements.size() - 1 : CurrentPostion + temp).toString();
                //如果他已经到边界了，那么他的next就是自己，所以添加一下if,否则会无限死循环
                if(CurrentPostion + temp == Info1Elements.size())
                    break;
                boolean setNextMadeFrom = this.setMadeFrom(NextMadeFrom, bean);

                if (setNextMadeFrom) {
                    MadeFromInfo++;
                    temp++;
                }
                else {
                    break;
                }
            }
        return MadeFromInfo;
    }
    public void setID(animate bean){
        String temp = UUID.randomUUID().toString();
        bean.setAnimate_id(temp.substring(temp.length()-12,temp.length()));

    }
    //设置link
    public boolean setLink(String link, animate bean) {
        //match=<a href="/anime/project-index3/">魔法禁书目录第三季</a>
        Pattern compile = Pattern.compile("(<a href=\"/anime/([\\s|\\S]*?)/\">[\\u4E00-\\u9FA5|\\\\！|\\\\,|\\\\。|\\\\（|\\\\）|\\\\《|\\\\》|\\\\“|\\\\”|\\\\？|\\\\：|\\\\；|\\\\【|\\\\】|\\S|\\s]*</a>)");
        Matcher matcher = compile.matcher(link);
        if(matcher.matches()) {
            bean.setLink("http://www.dilidili.wang/anime/"+matcher.group(2));
            return true;
        }
        return false;
    }
//    //获得一个实例化的sqlsession
//    public SqlSession getSqlSession(){
//
//        return SqlSessionFactoryUtil.openSession();
//
//
//    }
   // 执行语句
    public void ExcuteInsert(animate bean,SqlSession sqlSession){


        try {
            AnimateMapper mapper = sqlSession.getMapper(AnimateMapper.class);
            int res = mapper.LoadNewAnimate(bean);
            System.out.println(res);
            sqlSession.commit();

        } catch (Exception e) {
            System.out.println(e);
            sqlSession.rollback();
        }finally{
            if(sqlSession != null){
                sqlSession.close();
            }
        }
    }
}
