<%--
  Created by IntelliJ IDEA.
  User: 89507
  Date: 2018/10/7
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<script type="text/javascript">
    window.onload=function (ev) {
        //跳转到用户首页面
        <c:if test="${LogInSucceed!=null}">
        window.location.href="animate.action";
        </c:if>
        <c:if test="${LogInDefeat!=null}">
        window.location.href="login.action";
        </c:if>
    }
</script>
</body>
</html>

