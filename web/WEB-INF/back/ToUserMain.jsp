<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 89507
  Date: 2018/10/1
  Time: 0:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

        <script type="text/javascript">
            window.onload=function (ev) {
                //跳转到用户首页面
                <c:if test="${UserEditInfoSucceed!=null}">
                    window.location.href="usermain.action";
                </c:if>
                <c:if test="${UserEditInfoDefeat!=null}">
                window.location.href="user_editinfo.action";
                </c:if>
            }
        </script>
</body>
</html>
