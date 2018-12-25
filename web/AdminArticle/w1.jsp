<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 严瑞华
  Date: 2018/6/4
  Time: 23:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="baidu-site-verification" content="CtYt4injW1" />
    <meta name="360-site-verification" content="a75dcb147688915b4cc7cfaa71e996a2" />
    <meta name="keywords" content="个人博客" />
    <meta name="keywords" content="博客搭建" />
    <meta name="keywords" content="博客网站" />
    <link rel="shortcut icon" href="images/logo.png">
    <meta charset="utf-8">
    <meta charset="gb2312">
    <title>${adminArticle.title}</title>
    <meta name="keywords" content="谈同个人博客♠★♠一个前端设计的热血青年" />
    <meta name="description" content="谈同个人博客♠★♠一个前端设计的热血青年" />
    <link href="${pageContext.request.contextPath}/AdminArticle/css/base.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/AdminArticle/css/main.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/AdminArticle/js/modernizr.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/AdminArticle/js/jquery.js"></script>
</head>
<body>
<div id="wrapper">

    <div class="container">
        <div class="con_content">
            <div class="about_box">
                <h2 class="nh1"><span>您现在的位置是：<a href="${pageContext.request.contextPath}/article.action" >网站首页</a>><a href="#" >${adminArticle.title}</a></span><b>${adminArticle.title}</b></h2>
                <div class="f_box">
                    <p class="a_title">${adminArticle.title}</p>
                    <p class="p_title"></p>
                    <p class="box_p"><span>发布时间：${adminArticle.time}</span><span>编辑：yan1less</span><span>点击：${adminArticle.watched}</span></p>
                    <!-- 可用于内容模板 -->
                </div>
                <ul class="about_content">
                    ${adminArticle.content}
                        <br/>




                </ul>

                <!-- 可用于内容模板 -->

                <!-- container代码 结束 -->
                <div class="shang_a">
                    <div class="one"></div>
                    <div class="two"><img src="${pageContext.request.contextPath}/AdminArticle/images/weixin.png" alt="" width="200" height="200"></div>

                </div>
                <script src="${pageContext.request.contextPath}/AdminArticle/js/shang.js"></script>
            </div>
        </div>
        <%--<div class="blank"></div>--%>
    </div>
    <!-- container代码 结束 -->
</div>
</body>
</html>
