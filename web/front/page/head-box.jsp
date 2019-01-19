<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 89507
  Date: 2018/10/3
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/style.css">

</head>
<body>
<div class="header">
    <div class="head wrap">
        <div class="logo fl">
            <c:if test="${user!=null&&user.extra=='admin'}">
                <a href="javascript:void(0);" onclick="myFunction()">
            </c:if>

                    <c:if test="${user==null}">
                        <a href="">
                    </c:if>

                <img  style="height: 80px;width: 80px" src="${pageContext.request.contextPath}/front/images/mainLogo.png">
            </a>
        </div>
        <div class="head-right fr">
            <div class="head-a fr">
                <c:if test="${user==null}">
                    <div class="head-a3 fl"><a href="adminLogin.action"><span style="color: white;">管理员</span></a></div>
                    <div class="head-a3 fl"><a href="login.action"><span style="color: white;">登录</span></a></div>
                    <div class="head-a4 fl"><a href="logon.action"><span style="color: white;">注册</span></a></div>
                </c:if>
                <c:if test="${user!=null}">
                    <div class="head-a1 fl"><a href=""><img src="${pageContext.request.contextPath}${user.photo}" style="width: 15px;height: 15px"></a></div>
                    <a href="usermain.action"><span style="color: white;font-size: larger">欢迎你，${user.petname}</span></a>

                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="travellerout.action" style="color: #b1bac1;font-size: larger" >退出</a>



                </c:if>
            </div>

            <div class="clearfix"></div>
            <div class="nav fr">
                <ul>
                    <li class="nav-cut" id="mainPage"><a href="animate.action">首页</a></li>
                    <li id="article" ><a href="article.action">文章</a></li>
                    <%--<li><a href="community.html">社区</a></li>--%>
                    <li id="mediaBase"><a href="MediaBase.action">媒体库</a></li>


                    <c:if test="${user!=null}">
                        <li><a href="usermain.action">个人信息</a></li>
                    </c:if>
                    <li id="contact"><a href="contact.action">联系我们</a></li>

                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<script>
    function myFunction(){
        var x;
        var years=prompt("请输入需要添加动漫的生产年份，如：201810","201810");
        if (years!=null && years!=""){
            $.post(
                "${pageContext.request.contextPath}/addNewAnimate.action",
                {"years":years},
                function (data) {
                    if(data.kekka=="succeed")
                        alert("成功添加");
                    else if(data.kekka=="error")
                        alert("日期输入有误");
                    else
                        alert("未返回");
                },
                "json"
            );
        }
    }
</script>
</body>
</html>
