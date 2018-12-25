package com.yan1less.otakus.controller;

import com.sun.istack.internal.Nullable;
import com.yan1less.otakus.pojo.comment;
import com.yan1less.otakus.pojo.user;
import com.yan1less.otakus.service.FriendService;
import com.yan1less.otakus.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class FriendController {
    @Autowired
    private FriendService friendService;

    @RequestMapping("friend_list")
    public String ToFriendList(HttpServletRequest request,Integer currentPage){
        if(currentPage == null)
            currentPage=1;

        user user = (user)request.getSession().getAttribute("user");
        String user_id = user.getUser_id();
        Page<user> friends = friendService.loadUserFriends(user_id,currentPage);
        request.setAttribute("friends",friends);

        return "/WEB-INF/back/friend_list";
    }
    @RequestMapping("SearchFriend")
    public void SearchFriend(HttpServletRequest request,HttpServletResponse response,String name) throws IOException {
        request.getSession().removeAttribute("searchfriend");
        user user = friendService.SearchFriend(name);
        if(user!=null) {
            request.getSession().setAttribute("searchfriend", user);

            response.getWriter().write("{\"succeed\":\"yes\"}");
        }
        else
            response.getWriter().write("{\"succeed\":\"no\"}");
    }
    //接受的是用户的id和好友的id
    @RequestMapping("AddFriend")
    public void AddFriend(HttpServletResponse response,String name,String userid) throws IOException {
        Boolean succeed = friendService.AddFriend(name,userid);

        if(succeed)
            response.getWriter().write("{\"succeed\":\"succeed\"}");
        else
            response.getWriter().write("{\"succeed\":\"no\"}");
    }
    @RequestMapping("FriendMain")
    public String ToFriendMain(HttpServletRequest request ,@Nullable String id){
        if(id!=null){
            user friend = friendService.SerachFriendByID(id);
            request.setAttribute("friendDetail",friend);
            //把好友参与的评论也放进request域
            List<comment> comments = friendService.LoadFriendComment(id);
            request.setAttribute("FriendComments",comments);
        }
        return "/WEB-INF/back/friend_details";
    }
    @RequestMapping("DeleteFriend")
    public void DeleteFriend(HttpServletResponse response,String id,String userid) throws IOException {

        Boolean succeed = friendService.DeleteFriend(id,userid);

        if(succeed)
             response.getWriter().write("{\"succeed\":\"1\"}");
        else
            response.getWriter().write("{\"succeed\":\"0\"}");
    }
}
