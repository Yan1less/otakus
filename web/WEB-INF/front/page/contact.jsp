<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 89507
  Date: 2018/10/18
  Time: 18:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>联系我们</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/style.css">
    <script src="${pageContext.request.contextPath}/front/js/jquery-1.11.1.min.js"></script>
</head>

<body>
<!--导入页首-->
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
                    <li id="mediaBase"><a href="MediaBase.action">媒体库</a></li>


                    <c:if test="${user!=null}">
                        <li><a href="usermain.action">个人信息</a></li>
                    </c:if>
                    <li id="contact" class="nav-cut"><a href="contact.action">联系我们</a></li>

                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<div class="content">
    <div class="about-banner"><img style="width: 1200px;height: 457px;" src="${pageContext.request.contextPath}/front/upload/aboutme.png"></div>
    <div class="about-box">
        <div class="about"><div class="about-h4">联系我们</div></div>
        <div class="about-btm">

            <div class="ab">
                <div class="about-a">联系方式</div>
                <div class="about-b">邮箱：yan1less@163.com</div>
                <div class="about-b">客服联系/举报电话：110 （周一至周日：12:00-20:30，节假日除外）</div>
                <div class="about-b">商务合作/媒体报道：QQ – 895072956</div>
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
</body>
</html>

