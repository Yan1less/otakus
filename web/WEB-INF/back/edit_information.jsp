<%--
  Created by IntelliJ IDEA.
  User: 89507
  Date: 2018/9/30
  Time: 23:20
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
                    $("#maincontrol").addClass("active");
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





                    <li class="active">编辑个人信息</li>

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



                <div class="page-content">

                    <div class="page-header">

                        <h1>

                            编辑

                            <small>

                                <i class="icon-double-angle-right"></i>

                                在此处可修改个人信息

                            </small>

                        </h1>

                    </div><!-- /.page-header -->

                    <div class="row">

                        <div class="col-xs-12">

                            <!-- PAGE CONTENT BEGINS -->





                            <form class="form-horizontal" role="form" id="myform" action="submit_info.action">
                                <input type="hidden" name="user_id"  value="${user.user_id}">
                                <div class="form-group">

                                    <label class="col-sm-3 control-label no-padding-right" for="usernameinput"> 用户名 </label>



                                    <div class="col-sm-9">

                                        <input type="text" name="username" id="usernameinput" onblur="TestUsername()" value="${user.username==null?"尚未填写":user.username}" class="col-xs-10 col-sm-5" />
                                        &nbsp;<span id="usernamespan"> </span>

                                    </div>

                                </div>

                                <div class="form-group">

                                    <label class="col-sm-3 control-label no-padding-right" for="passwordinput"> 密码 </label>



                                    <div class="col-sm-9">

                                        <input type="text" name="password" id="passwordinput" onblur="TestPassword()" value="${user.password==null?"尚未填写":user.password}" class="col-xs-10 col-sm-5" />
                                        &nbsp;<span id="passwordspan"> </span>

                                    </div>

                                </div>

                                <div class="form-group">

                                    <label class="col-sm-3 control-label no-padding-right" for="petinput">昵称  </label>



                                    <div class="col-sm-9">

                                        <input type="text" name="petname" id="petinput" onblur="TestAddress()" value="${user.petname==null?"尚未填写":user.petname}" class="col-xs-10 col-sm-5" />
                                        &nbsp;<span id="petspan"> </span>

                                    </div>

                                </div>

                                <div class="form-group">

                                    <label class="col-sm-3 control-label no-padding-right" for="telinput">手机号  </label>



                                    <div class="col-sm-9">

                                        <input type="text" name="telephone" id="telinput" onblur="TestTelephone()" value="${user.telephone==null?"尚未填写":user.telephone}" class="col-xs-10 col-sm-5" />
                                        &nbsp;<span id="telspan"> </span>

                                    </div>

                                </div>

                                <div class="form-group">

                                    <label class="col-sm-3 control-label no-padding-right" for="addressinput">地址  </label>



                                    <div class="col-sm-9">

                                        <input type="text" name="address" id="addressinput"  onblur="TestAddress()" value="${user.address==null?"尚未填写":user.address}" class="col-xs-10 col-sm-5" />
                                        &nbsp;<span id="addressspan"> </span>

                                    </div>

                                </div>

                                <div class="form-group">

                                    <label class="col-sm-3 control-label no-padding-right" for="emailinput"> 邮箱 </label>



                                    <div class="col-sm-9">

                                        <input type="text" name="email" id="emailinput" value="${user.email==null?"尚未填写":user.email}" class="col-xs-10 col-sm-5" onblur="TestEmail()" />
                                        &nbsp;<span id="emailspan"> </span>

                                    </div>

                                </div>

                                <div class="form-group">

                                    <label class="col-sm-3 control-label no-padding-right" for="introinput"> 个人介绍 </label>



                                    <div class="col-sm-9">

                                        <input type="text" name="introduce" id="introinput" value="${user.introduce==null?"尚未填写":user.introduce}" class="col-xs-10 col-sm-5" onblur="TestIntro()" />
                                        &nbsp;<span id="introspan"> </span>

                                    </div>

                                </div>
                            </form>



                            <div class="clearfix form-actions">

                                <div class="col-md-offset-3 col-md-9">

                                    <button class="btn btn-info" type="button" onclick="return Testall()">

                                        <i class="icon-ok bigger-110"></i>

                                        Submit

                                    </button>



                                    &nbsp; &nbsp; &nbsp;

                                    <button class="btn" type="reset">

                                        <i class="icon-undo bigger-110"></i>

                                        Reset

                                    </button>

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
    <script type="text/javascript">
        function TestEmail() {
            var reg =  /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
            var input = $("#emailinput").val();
            if(input.value == ""){ //输入不能为空
                alert("输入不能为空!");
                return false;
            }else if(!reg.test(input)){ //正则验证不通过，格式不对
                $("#emailspan").css({"color":"red"});
                $("#emailspan").text("  错误");
                //alert("验证不通过!");
                return false;
            }else{
                $("#emailspan").css({"color":"green"})
                $("#emailspan").text("  正确");
                // alert("通过！");
                return true;
            }


        }
        function TestUsername() {
            //var ph = $("#usernameinput").attr("placeholder");
            var input = $.trim($("#usernameinput").val());
            var motoinput = $("#usernameinput").val();
            if(motoinput!=input ){
                $("#usernamespan").css({"color":"red"});
                $("#usernamespan").text("  输入不能带有空格");
                return false
            }
            if(input=="" ){ //输入不能为空

                $("#usernamespan").css({"color":"red"});
                $("#usernamespan").text("  输入不能为空");
                return false;
            }
            else{
                $("#usernamespan").css({"color":"green"})
                $("#usernamespan").text("  正确");
                // alert("通过！");
                return true;
            }
        }

        function TestPassword() {
            var input = $.trim($("#passwordinput").val());
            var motoinput = $("#passwordinput").val();
            if(motoinput!=input){
                $("#passwordspan").css({"color":"red"});
                $("#passwordspan").text("  输入不能带有空格");
                return false
            }
            if(input==""){ //输入不能为空

                $("#passwordspan").css({"color":"red"});
                $("#passwordspan").text("  输入不能为空");
                return false;
            }
            else{
                $("#passwordspan").css({"color":"green"})
                $("#passwordspan").text("  正确");
                // alert("通过！");
                return true;
            }
        }

        function TestIntro() {
            var input = $.trim($("#introinput").val());
            var motoinput = $("#introinput").val();
            if(motoinput!=input){
                $("#introspan").css({"color":"red"});
                $("#introspan").text("  输入不能带有空格");
                return false
            }
            if(input==""){ //输入不能为空

                $("#introspan").css({"color":"red"});
                $("#introspan").text("  输入不能为空");
                return false;
            }
            else{
                $("#introspan").css({"color":"green"})
                $("#introspan").text("  正确");
                // alert("通过！");
                return true;
            }
        }

        function TestAddress() {
            var input = $.trim($("#addressinput").val());
            var motoinput = $("#addressinput").val();
            if(motoinput!=input){
                $("#addressspan").css({"color":"red"});
                $("#addressspan").text("  输入不能带有空格");
                return false
            }
            if(input==""){ //输入不能为空

                $("#addressspan").css({"color":"red"});
                $("#addressspan").text("  输入不能为空");
                return false;
            }
            else{
                $("#addressspan").css({"color":"green"})
                $("#addressspan").text("  正确");
                // alert("通过！");
                return true;
            }
        }
        function TestTelephone() {
            var reg =  /^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
            var input = $("#telinput").val();
            if(input.value == ""){ //输入不能为空
                alert("输入不能为空!");
                return false;
            }else if(!reg.test(input)){ //正则验证不通过，格式不对
                $("#telspan").css({"color":"red"});
                $("#telspan").text("  错误");
                //alert("验证不通过!");
                return false;
            }else{
                $("#telspan").css({"color":"green"})
                $("#telspan").text("  正确");
                // alert("通过！");
                return true;
            }
        }

        function Testall() {
            if(TestEmail() && TestAddress() &&TestTelephone() && TestUsername()){
                alert("yes,可以提交到后台");
                $("#myform").submit();
            }


            else
                alert("no，请重新修改");
        }
    </script>

</div>
</body>

</html>


