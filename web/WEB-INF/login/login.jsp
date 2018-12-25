<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 严瑞华
  Date: 2018/6/8
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login/css/demo.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/login/js/vendor/jgrowl/css/jquery.jgrowl.min.css">
    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login/css/component.css" />
    <!--[if IE]>
    <script src="${pageContext.request.contextPath}/login/js/html5.js"></script>
    <![endif]-->
    <style>
        input::-webkit-input-placeholder{
            color:rgba(0, 0, 0, 0.726);
        }
        input::-moz-placeholder{   /* Mozilla Firefox 19+ */
            color:rgba(0, 0, 0, 0.726);
        }
        input:-moz-placeholder{    /* Mozilla Firefox 4 to 18 */
            color:rgba(0, 0, 0, 0.726);
        }
        input:-ms-input-placeholder{  /* Internet Explorer 10-11 */
            color:rgba(0, 0, 0, 0.726);
        }
    </style>
</head>
<body>
<div class="container demo-1">
    <div class="content">
        <div id="large-header" class="large-header">
            <canvas id="demo-canvas"></canvas>
            <div class="logo_box">
                <h3>MARS HELP</h3>
                <c:if test="${error==null}">

                </c:if>
                <c:if test="${error!=null}"></c:if>
                <h2 style="color: red;font-size: smaller;text-align: center"> ${error}</h2>
                <!--//登陆成功跳到后台列表-->
                <form action="${pageContext.request.contextPath}/mylogin.action" name="f" method="post">
                    <div class="input_outer">
                        <span class="u_user"></span>
                        <input id="ID" name="logname" class="text" style="color: #000000 !important" type="text" placeholder="请输入账户">
                    </div>
                    <div class="input_outer">
                        <span class="us_uer"></span>
                        <input id="PASSWORD" name="logpass" class="text" style="color: #000000 !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码">
                    </div>
                    <div id="LOGIN" class="mb2">

                           <input type="submit" value="登录" class="act-but submit" onclick="return MyTest()" style="color: #FFFFFF">

                    </div>
                </form>
            </div>
        </div>
    </div>
</div><!-- /container -->
<script src="${pageContext.request.contextPath}/login/js/TweenLite.min.js"></script>
<script src="${pageContext.request.contextPath}/login/js/EasePack.min.js"></script>
<script src="${pageContext.request.contextPath}/login/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/login/js/rAF.js"></script>
<script src="${pageContext.request.contextPath}/login/js/demo-1.js"></script>
<script src="${pageContext.request.contextPath}/login/js/vendor/jgrowl/jquery.jgrowl.min.js"></script>
<script src="${pageContext.request.contextPath}/login/js/Longin.js"></script>
<script type="text/javascript">
    function MyTest() {
        var ID = $.trim($("#ID").val());
        var PASSWORD = $.trim($("#PASSWORD").val());
        if(ID!=""  &&PASSWORD!="")
        {
            alert("可以提交到后台");
            $("#myform").submit();
            return true;
        }
        else{
            alert("输入为空，请重新输入");
            return false;
        }


    }
</script>
<div style="text-align:center;">
</div>
</body>
</html>
