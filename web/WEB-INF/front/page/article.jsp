<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 89507
  Date: 2018/10/3
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>肥宅快乐帖</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/style.css">
    <script src="${pageContext.request.contextPath}/front/js/jquery-1.11.1.min.js"></script>
</head>

<body>
<!--导入页首-->
<div id="page1"></div>
<script type="text/javascript" >
    $("#page1").load("${pageContext.request.contextPath}/front/page/head-box.jsp");
    window.onload=function () {
        $("#mainPage").removeClass("nav-cut");
        $("#article").addClass("nav-cut");

    }
</script>

<div class="content">
    <div class="wrap">
        <div class="art-height"></div>
        <div class="art-box">
            <div class="art-b">
                <c:forEach items="${admin_articles}" var="admin_articles" varStatus="status">
                    <a href="${pageContext.request.contextPath}/adminArticle.action?id=${admin_articles.id}" target="_blank"><div class="art-b1
                    <c:if test="${status.index%2==0}">
                    fl mr-30
                    </c:if>
                      <c:if test="${status.index%2==1}">
                    fr
                    </c:if>
                    "><img   src="${pageContext.request.contextPath}/AdminArticle/images/${admin_articles.pic}">
                        <div class="art-inside">${admin_articles.title}</div>
                    </div></a>
                </c:forEach>


            </div>
            <div class="art-c">
                <div class="art-fl fl">
                    <div class="ru-title art-title">
                        <div class="cou-b1"><img src="${pageContext.request.contextPath}/front/images/cou-b1.jpg">推荐帖子</div>

                        <div class="ru-a2">
                            <%--<div class="dropdown">--%>
                                <%--<span>默认</span>--%>
                                <%--<ul data-value="" class="droplist">--%>
                                    <%--<li data-id="1">全部</li>--%>
                                    <%--<li data-id="2">服饰</li>--%>
                                    <%--<li data-id="3">最新</li>--%>
                                    <%--<li data-id="4">提问</li>--%>
                                    <%--<li data-id="5">约会技巧</li>--%>
                                    <%--<li data-id="6">热门文章</li>--%>
                                <%--</ul>--%>
                            <%--</div>--%>
                        </div>
                    </div>
                    <div class="tjk">
                        <ul class="art-ul">
                            <c:forEach items="${articles}" var="article">
                                <a href="ArticleDetail.action?id=${article.information_id}"><li><div class="art-list">
                                    <div class="art-d fl"><img src="${pageContext.request.contextPath}/${article.pics}"></div>
                                    <div class="art-e fl">
                                        <div class="col-b1">${article.name}</div>
                                        <div class="col-b2">${article.from_username}<span>${article.create_time}</span></div>
                                        <div class="col-b3">${article.main_information}</div>
                                    </div>
                                    <div class="art-f">
                                        <span><img src="${pageContext.request.contextPath}/front/images/col-c1.jpg">${article.total_commit}</span>
                                        <span><img src="${pageContext.request.contextPath}/front/images/col-c2.jpg">${article.total_visited}</span>
                                        <em><img src="${pageContext.request.contextPath}/front/images/col-c3.jpg"></em>
                                        <em><img src="${pageContext.request.contextPath}/front/images/col-c4.jpg"></em>
                                        <em><img src="${pageContext.request.contextPath}/front/images/col-c5.jpg"></em>
                                    </div>
                                </div>
                                    <div class="art-g"></div>
                                </li>
                                </a>
                            </c:forEach>

                        </ul>
                    </div>
                    <%--<div class="more"><a href="">查看更多>></a></div>--%>

                </div>

                <div class="art-fr fr">
                    <div class="post-y art-gg">
                        <div class="post-y1"><img src="${pageContext.request.contextPath}/front/images/cou-b1.jpg">LOL新闻</div>
                        <c:forEach items="${news}" var="news">
                            <ul>
                                <a href="https://www.Dorothylyly.cn/details?tableName=lolNews&id=${news.id}"><li>
                                    <div class="post-y2"><img  style="height: 139px;width: 248px" src="${news.littlePicture}"></div>
                                    <div class="post-y3">${news.title}</div>

                                </li></a>
                            </ul>
                        </c:forEach>

                    </div>
                    <div class="fish"><a href=""><img  style="height: 124px" src="${pageContext.request.contextPath}/front/upload/S81130-235456.jpg">
                        <img style="height: 124px" src="${pageContext.request.contextPath}/front/upload/S81130-235500.jpg" ></a></div>
                </div>
            </div><!--art-c-->

        </div>
    </div>
</div>

<!--加载页尾-->
<div id="footer"></div>
<script type="text/javascript">
    $("#footer").load("foot-box.html");
</script>


<!--登录注册弹窗-->
<div class="mask"></div>
<div class="login">
    <div class="login-title">
        <div class="login-a">登录</div>
        <div class="login-b"></div>
        <div class="login-c close">x</div>
    </div>
    <div class="login-btm">
        <div class="login-d"><input type="text" class="login-text" placeholder="注册时填写的邮箱"></div>
        <div class="login-d"><input type="password" class="login-pas" placeholder="密码"></div>
        <div class="login-d"><input type="button" class="login-btn" placeholder="登录"></div>
        <div class="login-f">
            <a href="">忘记密码</a>
            <span>还没有焦点账号?><a href="javascript:;" class="reg-href">点击注册</a></span>
        </div>
    </div>
</div>

<div class="reg">
    <div class="login-title">
        <div class="login-a">注册</div>
        <div class="login-b"></div>
        <div class="login-c close">x</div>
    </div>
    <div class="login-btm">
        <div class="login-d"><input type="text" class="login-text" placeholder="邮箱/手机号"></div>
        <div class="login-d"><input type="password" class="login-pas" placeholder="密码"></div>
        <div class="login-d"><input type="button" class="login-btn" placeholder="注册"></div>
        <div class="login-f">
            <a href="">忘记密码</a>
        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/front/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/front/js/Action.js"></script>
<script>
    $(".sort").click(function(){
        $(this).toggleClass("sort-cut")
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


