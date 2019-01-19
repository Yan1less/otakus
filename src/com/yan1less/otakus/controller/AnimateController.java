package com.yan1less.otakus.controller;

import com.sun.istack.internal.Nullable;
import com.yan1less.otakus.pojo.animate;
import com.yan1less.otakus.service.AnimateService;
import com.yan1less.otakus.utils.AddNewAnimateUtils;
import com.yan1less.otakus.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class AnimateController {
    //进入主页面都要先加载数据
    @Autowired
    private AnimateService animateService;
    //退出按钮，清除了用户的session
    @RequestMapping("travellerout")
    public String Travellerout(HttpServletRequest request){
        Page<animate> animatePage = animateService.LoadAnimateInfo(0);
        HttpSession session = request.getSession();
        session.removeAttribute("searchfriend");
        session.removeAttribute("user");

        return "/WEB-INF/front/page/index";
    }


    //从引导页进入主页面，这时肯定没有登录
    @RequestMapping("traveller")
    public String ToMainPage(HttpServletRequest request,
                             @Nullable String currentPage){
        int IntCurrentPage = 0;
        if(currentPage==null)
            IntCurrentPage=Integer.parseInt(currentPage);
        Page<animate> animatePage = animateService.LoadAnimateInfo(IntCurrentPage);

        request.setAttribute("animatePage",animatePage);

        return "/WEB-INF/front/page/index";
    }
    //
    @RequestMapping("animate")
    public String ToAnimatePage(HttpServletRequest request,
                               @Nullable String currentPage){



        int IntCurrentPage = 0;
        if (currentPage != null)
            IntCurrentPage = Integer.parseInt(currentPage);
        Page<animate> animatePage = null;

        String search_type = request.getParameter("search_type");
        String search_text = request.getParameter("search_text");

        System.out.println(search_text);

        if(search_type==null || search_text==null || search_text.equals("")||search_type.equals("null")) {
            System.out.println("xxxxxx");
            animatePage =animateService.LoadAnimateInfo(IntCurrentPage);
        }
        else{
            if(search_type.equals("title"))
                animatePage = animateService.SearchAnimateByTittle(IntCurrentPage, search_text);
            if(search_type.equals("madefrom"))
                animatePage = animateService.SearchAnimateByMadeFrom(IntCurrentPage, search_text);
            if(search_type.equals("date"))
                animatePage = animateService.SearchAnimateByDate(IntCurrentPage, search_text);
            if(search_type.equals("intro"))
                animatePage = animateService.SearchAnimateByIntro(IntCurrentPage, search_text);
            if(search_type.equals("cv"))
                animatePage = animateService.SearchAnimateByCV(IntCurrentPage,search_text);
            if(search_type.equals("tags"))
                animatePage = animateService.SearchAnimateByTags(IntCurrentPage,search_text);

        }
        request.setAttribute("current_search",search_type);
        request.setAttribute("current_text",search_text);
        request.setAttribute("animatePage", animatePage);
        return "/WEB-INF/front/page/index";
    }


    //去主页面
    @RequestMapping("main")
    public String ToIndexPage(){

        Page<animate> animatePage = animateService.LoadAnimateInfo(0);
        return "/WEB-INF/front/page/index";
    }

    //添加动漫（管理员才能做）
    @RequestMapping("addNewAnimate")
    public void AddNewAnimate(String years, HttpServletResponse response) throws IOException {
        //先判断传来的时间是否正确
        System.out.println(years);

        AddNewAnimateUtils utils = new AddNewAnimateUtils();
        if(utils.CheckYears(years)) {
            List<animate> animateList = utils.DLDLSpider("http://www.dilidili.wang/anime/" + years);

            Boolean succeed = animateService.AddNewAnimate(animateList);
            System.out.println("添加结果"+succeed);
            response.getWriter().write("{\"kekka\":\"succeed\"}");

        }
        else {
            System.out.println("失败");
            response.getWriter().write("{\"kekka\":\"error\"}");
        }

    }



    //test
    @RequestMapping("test")
    public void AddNewAnimate1(String years, HttpServletResponse response) throws IOException {
        //先判断传来的时间是否正确


        System.out.println(years);
        boolean isExist = animateService.judgeYearIsExist(years);
        response.getWriter().write("{\"kekka\":\"succeed\"}");

    }



}
