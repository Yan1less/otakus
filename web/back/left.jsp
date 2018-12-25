<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 89507
  Date: 2018/9/30
  Time: 23:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8" />

    <title>空白页 - Bootstrap后台管理系统模版Ace下载</title>



    <meta name="viewport" content="width=device-width, initial-scale=1.0" />



    <!-- basic styles -->



    <link href="${pageContext.request.contextPath}/back/assets/css/bootstrap.min.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/font-awesome/3.2.1/css/font-awesome.min.css">



    <!--[if IE 7]>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/font-awesome-ie7.min.css" />

    <![endif]-->



    <!-- page specific plugin styles -->



    <!-- fonts -->







    <!-- ace styles -->



    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace.min.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace-rtl.min.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace-skins.min.css" />



    <!--[if lte IE 8]>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace-ie.min.css" />

    <![endif]-->



    <!-- inline styles related to this page -->



    <!-- ace settings handler -->



    <script src="${pageContext.request.contextPath}/back/assets/js/ace-extra.min.js"></script>

    <script src="${pageContext.request.contextPath}/back/assets/js/jquery-2.0.3.min.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->



    <!--[if lt IE 9]>

    <script src="${pageContext.request.contextPath}/back/assets/js/html5shiv.js"></script>

    <script src="${pageContext.request.contextPath}/back/assets/js/respond.min.js"></script>

    <![endif]-->

</head>
<body>
<ul class="nav nav-list">

    <li id="maincontrol">

        <a href="animate.action">

            <i class="icon-dashboard"></i>

            <span class="menu-text"> 返回主页面 </span>

        </a>

    </li>





    <li id="myprofile">

        <a href="usermain.action">

            <i class="icon-desktop"></i>

            <span class="menu-text"> 个人信息 </span>

        </a>

    </li>

    <li id="invitation_manager">

        <a href="#" class="dropdown-toggle">

            <i class="icon-list"></i>

            <span class="menu-text"> 帖子管理 </span>



            <b class="arrow icon-angle-down"></b>

        </a>



        <ul class="submenu" >

            <li id="edit_invitation">

                <a href="my_article.action">

                    <i class="icon-double-angle-right"></i>

                    我的帖子

                </a>

            </li>


            <li id="my_commit">

                <a href="my_commit.action">

                    <i class="icon-double-angle-right"></i>

                    我的评论

                </a>

            </li>


            <li id="send_invitation">

                <a href="send_invitation.action">

                    <i class="icon-double-angle-right"></i>

                    发帖

                </a>

            </li>

        </ul>

    </li>

    <li id="friend_list">

        <a href="friend_list.action">

            <i class="icon-edit"></i>

            <span class="menu-text"> 好友管理 </span>

        </a>

    </li>



    <li id="message_manager">

        <a href="#" class="dropdown-toggle">

            <i class="icon-list-alt"></i>

            <span > 信息管理 </span>



            <b class="arrow icon-angle-down"></b>

        </a>



        <ul class="submenu" >

            <li id="receive_message">

                <a href="ReceivedMessage.action">

                    <i class="icon-double-angle-right"></i>

                    收信息

                </a>

            </li>


            <li id="send_message">

                <a href="SendMessage.action">

                    <i class="icon-double-angle-right"></i>

                    发信息

                </a>

            </li>




        </ul>

    </li>

    <li id="media_library">

        <a href="UserMedia.action">

            <i class="icon-picture"></i>

            <span class="menu-text"> 媒体库 </span>

        </a>

    </li>




    <li id="other_page">

        <a href="FriendMain.action">

            <i class="icon-file-alt"></i>

            <span class="menu-text"> 其他页面 </span>

        </a>

    </li>
    <c:if test="${user.extra=='admin'}">
        <li id="InfoManager">

            <a href="InfoManager.action">

                <i class="icon-file-alt"></i>

                <span class="menu-text"> 帖子管理 </span>

            </a>

        </li>

        <li id="user_manager" >

            <a href="UserManager.action">

                <i class="icon-file-alt"></i>

                <span class="menu-text"> 用户管理 </span>

            </a>

        </li>
    </c:if>





</ul><!-- /.nav-list -->
</body>
</html>
