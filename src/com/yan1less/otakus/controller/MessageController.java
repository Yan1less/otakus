package com.yan1less.otakus.controller;

import com.yan1less.otakus.pojo.friend_message;
import com.yan1less.otakus.pojo.user;
import com.yan1less.otakus.service.MessageService;
import com.yan1less.otakus.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class MessageController {

    @Autowired
    private MessageService messageService;



    @RequestMapping("ReceivedMessage")
    public String ToReceiveMessage(HttpServletRequest request,Integer currentPage){
        if(currentPage==null)
            currentPage=1;
        user user = (user)request.getSession().getAttribute("user");

        Page<friend_message> messages = messageService.PrepareUserMessage(user.getUser_id(),currentPage);
        request.setAttribute("messages",messages);
        return "/WEB-INF/back/received_message";
    }
    @RequestMapping("SendMessage")
    public String ToSendMessage(HttpServletRequest request,String friend_id){
        String MessageTarget = messageService.SearchFriendNameByID(friend_id);
        request.setAttribute("MessageTarget",MessageTarget);
        request.setAttribute("MessageTargetID",friend_id);
        return "/WEB-INF/back/send_message";
    }
    @RequestMapping("SubmitMessage")
    public void  SubmitMessage(HttpServletResponse response,String friend_id,String user_id,String details) throws IOException {

        Boolean succeed = messageService.SubmitMessage(user_id,friend_id,details);
        if(succeed)
            response.getWriter().write("{\"succeed\":\"1\"}");
        else
            response.getWriter().write("{\"succeed\":\"0\"}");

    }
    //异步传入后台名字，返回前台id，然后再回调函数中调用SubmitMessage方法
    @RequestMapping("TestFriendName")
    public void TestFriendName(HttpServletResponse response,String FriendName) throws IOException {
        System.out.println(FriendName);
        String MessageTargetID = messageService.SearchFriendIDByName(FriendName);
        if(MessageTargetID!=null){
            response.getWriter().write("{\"FriendID\":\""+MessageTargetID+"\"}");
        }

        else
            response.getWriter().write("{\"FriendID\":\"notfind\"}");
    }
}


