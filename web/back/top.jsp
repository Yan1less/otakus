<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 89507
  Date: 2018/9/29
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div class="navbar navbar-default" id="navbar">

    <script type="text/javascript">

        try{ace.settings.check('navbar' , 'fixed')}catch(e){}

    </script>



    <div class="navbar-container" id="navbar-container">

        <div class="navbar-header pull-left">

            <a href="#" class="navbar-brand">

                <small>

                    <i class="icon-leaf"></i>

                    Ace Admin

                </small>

            </a><!-- /.brand -->

        </div><!-- /.navbar-header -->



        <div class="navbar-header pull-right" role="navigation">

            <ul class="nav ace-nav">




                <li class="light-blue">
                    <c:if test="${user!=null}">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">

                        <img class="nav-user-photo" src="${pageContext.request.contextPath}${user.photo==null||user.photo==""?'/back/assets/avatars/user.jpg':user.photo}" alt="null" />

                        <span class="user-info">





                                             <small>Welcome,</small>
                                             ${user.petname}

								</span>



                        <i class="icon-caret-down"></i>

                    </a>
                    </c:if>


                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">

                        <li>

                            <a href="user_editinfo.action">

                                <i class="icon-cog"></i>

                                Settings

                            </a>

                        </li>



                        <li>

                            <a href="usermain.action">

                                <i class="icon-user"></i>

                                Profile

                            </a>

                        </li>



                        <li class="divider"></li>



                        <li>

                            <a href="travellerout.action">

                                <i class="icon-off"></i>

                                Logout

                            </a>

                        </li>

                    </ul>

                </li>

            </ul><!-- /.ace-nav -->

        </div><!-- /.navbar-header -->

    </div><!-- /.container -->

</div>
</body>
</html>
