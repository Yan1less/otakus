<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 89507
  Date: 2018/10/18
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>图库</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/style.css">
    <script src="${pageContext.request.contextPath}/front/js/jquery-1.11.1.min.js"></script>
</head>

<body>
<%--页首--%>
<div class="header">
    <div class="head wrap">
        <div class="logo fl"><a href=""><img  style="height: 80px;width: 80px" src="${pageContext.request.contextPath}/front/images/mainLogo.png"></a></div>
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
                    <li  id="mainPage"><a href="animate.action">首页</a></li>
                    <li id="article" ><a href="article.action">文章</a></li>
                    <%--<li><a href="community.html">社区</a></li>--%>
                    <li id="mediaBase" class="nav-cut"><a href="MediaBase.action">媒体库</a></li>


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


<div class="content">
    <div class="wrap">
        <div class="tsm-height"></div>
        <div class="course-banner"><img  style="width: 995px;height: 316px" src="${pageContext.request.contextPath}/front/upload/picmains.png"></div>

        <br/><br/>
        <div class="cou-b">
            <div class="cou-b-title">
                <div class="cou-b1"><img src="${pageContext.request.contextPath}/front/images/cou-b1.jpg">分类信息</div>

            </div>

            <div class="cou-a">
                <ul>
                    <c:forEach items="${mediaClass}" var="media">
                        <li><div class="cou-a1"><img  style="width: 320px;height: 200px" src="${pageContext.request.contextPath}/MediaPic/${media.extra}">
                            <div class="cou-inside"><div class="cou-href"><a href="${pageContext.request.contextPath}/Pictures.action?pic_class=${media.pic_class}">查看</a></div></div>
                        </div>
                            <div class="act-a2">${media.pic_class}</div>
                        </li>
                    </c:forEach>



                </ul>
            </div>








        </div>
    </div>
</div>

    <!--加载页尾-->
    <div id="footer"></div>
    <script type="text/javascript">
        $("#footer").load("${pageContext.request.contextPath}/front/page/foot-box.jsp");
    </script>


    <!--登录注册弹窗-->



    <script src="${pageContext.request.contextPath}/front/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/front/js/Action.js"></script>
    <script>
        $(".cou-a1").hover(function(){
            $(this).find(".cou-inside").stop(true,true).animate({top:0},500);
        },function(){
            $(this).find(".cou-inside").stop(true,true).animate({top:201},500);
        });
    </script>
    <script>
        $(".sort").click(function(){
            $(this).toggleClass("sort-cut")
        })
    </script>
    <script>
        $(".page a").click(function(){
            $(this).addClass("page-cut").siblings().removeClass("page-cut")

        })
    </script>

    <script>
        $(".dropdown").bind({
            click: function () {
                $(this).find(".droplist").stop().slideDown();
            },
            mouseleave: function () {
                $(this).find(".droplist").hide();
            }
        });
        $(".dropdown .droplist li").click(function () {
            $(this).parents(".dropdown").children("span").text($(this).text());
            $(this).parents(".droplist").hide().attr("data-value", $(this).attr("data-id"));
        });
    </script>

</body>
</html>

