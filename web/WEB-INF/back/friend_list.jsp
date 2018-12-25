<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 89507
  Date: 2018/10/11
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="utf-8" />

    <title>好友列表</title>



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

<div id="header"></div>
<!--加载top-->
<script type="text/javascript">
    $("#header").load("${pageContext.request.contextPath}/back/top.jsp");
</script>



<div class="main-container" id="main-container">

    <script type="text/javascript">

        try{ace.settings.check('main-container' , 'fixed')}catch(e){}

    </script>



    <div class="main-container-inner">

        <a class="menu-toggler" id="menu-toggler" href="#">

            <span class="menu-text"></span>

        </a>



        <div class="sidebar" id="sidebar">

            <script type="text/javascript">

                try{ace.settings.check('sidebar' , 'fixed')}catch(e){}

            </script>



            <div class="sidebar-shortcuts" id="sidebar-shortcuts">

                <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">

                    <button class="btn btn-success">

                        <i class="icon-signal"></i>

                    </button>



                    <button class="btn btn-info">

                        <i class="icon-pencil"></i>

                    </button>



                    <button class="btn btn-warning">

                        <i class="icon-group"></i>

                    </button>



                    <button class="btn btn-danger">

                        <i class="icon-cogs"></i>

                    </button>

                </div>



                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">

                    <span class="btn btn-success"></span>



                    <span class="btn btn-info"></span>



                    <span class="btn btn-warning"></span>



                    <span class="btn btn-danger"></span>

                </div>

            </div><!-- #sidebar-shortcuts -->



            <!--加载左边-->
            <div id="loadleft">

            </div>
            <script type="text/javascript">
                $("#loadleft").load("${pageContext.request.contextPath}/back/left.jsp");
                window.onload = function(){
                    $("#friend_list").addClass("active");
                }
            </script>



            <div class="sidebar-collapse" id="sidebar-collapse">

                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>

            </div>



            <script type="text/javascript">

                try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}

            </script>

        </div>



        <div class="main-content">

            <div class="breadcrumbs" id="breadcrumbs">

                <script type="text/javascript">

                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}

                </script>



                <ul class="breadcrumb">

                    <li>

                        <i class="icon-home home-icon"></i>

                        <a href="#">Home</a>

                    </li>



                    <li>

                        <a href="#">好友管理</a>

                    </li>



                </ul><!-- .breadcrumb -->



                <div class="nav-search" id="nav-search">

                    <form class="form-search">

								<span class="input-icon">

									<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />

									<i class="icon-search nav-search-icon"></i>

								</span>

                    </form>

                </div><!-- #nav-search -->

            </div>



            <div class="page-content">

                <div class="row">

                    <div class="col-xs-12">

                        <!-- PAGE CONTENT BEGINS -->


                        <div class="page-header">

                            <h1>

                                添加好友



                            </h1>

                        </div>
                        <form action="add_friend.action">
                            <span style="font-size: larger">请输入要添加好友的用户名：&nbsp;</span>
                            <input type="text" id="textinput" >&nbsp;&nbsp;
                            <input type="button" value="查询" onclick="SearchFriend()">

                        </form>
                        <c:if test="${searchfriend!=null}">
                            <span>查询到此用户 &nbsp;&nbsp;&nbsp;${searchfriend.petname}&nbsp;&nbsp;（${searchfriend.username}）,
                                点击进入<a href="${pageContext.request.contextPath}/FriendMain.action?id=${searchfriend.user_id}">他的页面</a>,
                                点击直接<a href="javascript:void(0);" onclick="AddFriend()"> 添加好友</a>

                            </span>
                        </c:if>

                        <br><br><br>
                        <script type="text/javascript">
                            function SearchFriend() {
                                var name = $("#textinput").val();
                                $.post(
                                    "${pageContext.request.contextPath}/SearchFriend.action",
                                    {"name":name},
                                    function (data) {
                                        if(data.succeed == "no")
                                            alert("查询失败，此用户不存在");
                                        window.location.reload();
                                    },"json"
                                );
                            }
                            function AddFriend() {
                                var name = $("#textinput").val();
                                $.post(
                                    "${pageContext.request.contextPath}/AddFriend.action",
                                    {"name":"${searchfriend.user_id}","userid":"${user.user_id}"},
                                    function (data) {
                                        if(data.succeed == "succeed"){
                                            alert("添加好友成功");
                                            window.location.reload();
                                        }
                                        else
                                            alert("添加失败");
                                    },"json"
                                );
                            }

                        </script>
                        <div class="page-header">

                            <h1>

                                好友管理

                                <small>

                                    <i class="icon-double-angle-right"></i>

                                    好友列表

                                </small>

                            </h1>

                        </div><!-- /.page-header -->




                        <div>

                            <table class="table table-striped table-bordered">

                                <thead>

                                <tr>

                                    <th class="center">#</th>

                                    <th>好友名</th>

                                    <th class="hidden-xs">好友昵称</th>

                                    <th class="hidden-480">好友签名</th>

                                    <th>操作</th>

                                </tr>

                                </thead>



                                <tbody>
                                <c:forEach items="${friends.rows}" var="friend" varStatus="vs">
                                    <tr>

                                        <td class="center">${vs.count}</td>
                                        <td>
                                            <a href="javascript:void(0);" onclick="window.location.href='${pageContext.request.contextPath}/FriendMain.action?id=${friend.user_id}'">${friend.username}</a>
                                        </td>
                                        <td class="hidden-xs">
                                            ${friend.petname}
                                        </td>
                                        <td class="hidden-480">${friend.introduce}</td>
                                        <td>
                                            <input type="button" onclick="window.location.href='${pageContext.request.contextPath}/FriendMain.action?id=${friend.user_id}'" value="查看">
                                            <input type="button" onclick="window.location.href='${pageContext.request.contextPath}/SendMessage.action?friend_id=${friend.user_id}'"  value="会话">
                                            <input type="button" onclick="DeleteFriend('${friend.user_id}')" value="删除">
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>

                            </table>
                                    <script type="text/javascript">
                                        function DeleteFriend(id) {
                                            if(confirm("确定要删除好友吗？"))
                                                $.post(
                                                    "${pageContext.request.contextPath}/DeleteFriend.action",
                                                    {"id":id,"userid":"${user.user_id}"},
                                                    function (data) {
                                                        if(data.succeed=="1"){
                                                            alert("成功");
                                                            window.location.reload();
                                                        }

                                                        else
                                                            alert("失败");
                                                    },"json"
                                                );
                                            else
                                                alert("取消了");
                                        }
                                    </script>





                            <div style="text-align: right">
                                <ul class="pagination">
                                    <c:if test="${friends.currentPage!=1}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/friend_list.action?currentPage=${friends.currentPage-1}">
                                                <i class="icon-double-angle-left"></i>
                                            </a>
                                        </li>
                                    </c:if>

                                    <c:if test="${friends.currentPage==1}">
                                        <li class="disabled">
                                            <a href="#">
                                                <i class="icon-double-angle-left"></i>
                                            </a>
                                        </li>
                                    </c:if>

                                    <c:forEach begin="1" end="${friends.totalPage}" var="fenyepage">
                                        <c:if test="${fenyepage == friends.currentPage}">
                                            <li class="active">
                                                <a href="friend_list.action?currentPage=${fenyepage}">${fenyepage}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${fenyepage != friends.currentPage}">
                                            <li>
                                                <a href="friend_list.action?currentPage=${fenyepage}">${fenyepage}</a>
                                            </li>
                                        </c:if>

                                    </c:forEach>
                                    <c:if test="${friends.currentPage==friends.totalPage}">
                                        <li class="disabled">
                                            <a href="javascript:void(0);">
                                                <i class="icon-double-angle-right"></i>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${friends.currentPage!=friends.totalPage}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/friend_list.action?currentPage=${friends.currentPage+1}">
                                                <i class="icon-double-angle-right"></i>
                                            </a>
                                        </li>
                                    </c:if>
                                </ul>
                            </div>

                        </div>









                        <!-- PAGE CONTENT ENDS -->

                    </div><!-- /.col -->

                </div><!-- /.row -->

            </div><!-- /.page-content -->

        </div><!-- /.main-content -->



        <div class="ace-settings-container" id="ace-settings-container">

            <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">

                <i class="icon-cog bigger-150"></i>

            </div>



            <div class="ace-settings-box" id="ace-settings-box">

                <div>

                    <div class="pull-left">

                        <select id="skin-colorpicker" class="hide">

                            <option data-skin="default" value="#438EB9">#438EB9</option>

                            <option data-skin="skin-1" value="#222A2D">#222A2D</option>

                            <option data-skin="skin-2" value="#C6487E">#C6487E</option>

                            <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>

                        </select>

                    </div>

                    <span>&nbsp; Choose Skin</span>

                </div>



                <div>

                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />

                    <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>

                </div>



                <div>

                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />

                    <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>

                </div>



                <div>

                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />

                    <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>

                </div>



                <div>

                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />

                    <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>

                </div>



                <div>

                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />

                    <label class="lbl" for="ace-settings-add-container">

                        Inside

                        <b>.container</b>

                    </label>

                </div>

            </div>

        </div><!-- /#ace-settings-container -->

    </div><!-- /.main-container-inner -->



    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">

        <i class="icon-double-angle-up icon-only bigger-110"></i>

    </a>

</div><!-- /.main-container -->



<!-- basic scripts -->



<!--[if !IE]> -->



<script src="http://www.jq22.com/jquery/jquery-2.1.1.js"></script>



<!-- <![endif]-->



<!--[if IE]>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<![endif]-->



<!--[if !IE]> -->



<script type="text/javascript">

    window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");

</script>



<!-- <![endif]-->



<!--[if IE]>

<script type="text/javascript">

    window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");

</script>

<![endif]-->



<script type="text/javascript">

    if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");

</script>

<script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>

<script src="${pageContext.request.contextPath}/back/assets/js/typeahead-bs2.min.js"></script>



<!-- page specific plugin scripts -->



<!-- ace scripts -->



<script src="${pageContext.request.contextPath}/back/assets/js/ace-elements.min.js"></script>

<script src="${pageContext.request.contextPath}/back/assets/js/ace.min.js"></script>



<!-- inline scripts related to this page -->



</body>

</html>


