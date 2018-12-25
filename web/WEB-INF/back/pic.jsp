<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 89507
  Date: 2018/10/16
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <meta charset="utf-8" />

    <title>用户媒体库</title>



    <meta name="viewport" content="width=device-width, initial-scale=1.0" />



    <!-- basic styles -->



    <link href="${pageContext.request.contextPath}/back/assets/css/bootstrap.min.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/font-awesome/3.2.1/css/font-awesome.min.css">



    <!--[if IE 7]>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/font-awesome-ie7.min.css" />

    <![endif]-->



    <!-- page specific plugin styles -->



    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/colorbox.css" />



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



    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <script src="${pageContext.request.contextPath}/back/assets/js/jquery-2.0.3.min.js"></script>

    <!--[if lt IE 9]>

    <script src="${pageContext.request.contextPath}/back/assets/js/html5shiv.js"></script>

    <script src="${pageContext.request.contextPath}/back/assets/js/respond.min.js"></script>

    <![endif]-->



    <style>
        .box{
            background-color: #7c7c7c;
            position: absolute;
            left: 500px;
            top: 250px;
            width:30%;
            margin-top:10%; margin:auto;
            padding:28px;
            height:350px; border:1px #111 solid;
            display:none;            /* 默认对话框隐藏 */
        }
        .box.show{display:block;}
        .box .x{ font-size:18px; text-align:right; display:block;}
        .box input{width:80%; font-size:18px; margin-top:18px;}
    </style>

</head>



<body>
<!--加载top-->
<div id="header"></div>
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

                    $("#media_library").addClass("active");
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

                    <li class="active">媒体库</li>

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

                <div class="page-header">

                    <h1>

                        媒体库

                        <small>

                            <i class="icon-double-angle-right"></i>

                            添加图片

                        </small>

                    </h1>

                </div><!-- /.page-header -->
                <div >
                    <form action="AddPic.action" enctype="multipart/form-data" method="post">
                    <input type="file" placeholder="点击添加图片" name="pictureFile" id="pictureFile"><br/>
                        图片分类：<input type="text" name="pic_class" value="无"><br/><br/>
                        图片名称： <input type="text" name="pic_name" value="无"><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="submit" value="确定">
                    </form>

                </div>



                <div class="page-header">

                    <h1>

                        媒体库

                        <small>

                            <i class="icon-double-angle-right"></i>

                            展示已保存的图片

                        </small>

                    </h1>

                </div><!-- /.page-header -->


                <div class="row">

                    <div class="col-xs-12">

                        <!-- PAGE CONTENT BEGINS -->



                        <div class="row-fluid">

                            <ul class="ace-thumbnails">

                                <li>

                                    <a href="${pageContext.request.contextPath}/back/assets/images/gallery/image-1.jpg" title="Photo Title" data-rel="colorbox">

                                        <img alt="150x150" src="${pageContext.request.contextPath}/back/assets/images/gallery/thumb-1.jpg" />

                                        <div class="tags">

													<span class="label-holder">

														<span class="label label-info">breakfast</span>

													</span>



                                            <span class="label-holder">

														<span class="label label-danger">fruits</span>

													</span>



                                            <span class="label-holder">

														<span class="label label-success">toast</span>

													</span>



                                            <span class="label-holder">

														<span class="label label-warning arrowed-in">diet</span>

													</span>

                                        </div>

                                    </a>



                                    <div class="tools">

                                        <a href="#">

                                            <i class="icon-link"></i>

                                        </a>



                                        <a href="#">

                                            <i class="icon-paper-clip"></i>

                                        </a>



                                        <a href="#">

                                            <i class="icon-pencil"></i>

                                        </a>



                                        <a href="#">

                                            <i class="icon-remove red"></i>

                                        </a>

                                    </div>

                                </li>



                                <li>

                                    <a href="${pageContext.request.contextPath}/back/assets/images/gallery/image-2.jpg" data-rel="colorbox">

                                        <img alt="150x150" src="${pageContext.request.contextPath}/back/assets/images/gallery/thumb-2.jpg" />

                                        <div class="text">

                                            <div class="inner">Sample Caption on Hover</div>

                                        </div>

                                    </a>

                                </li>



                                <li>

                                    <a href="${pageContext.request.contextPath}/back/assets/images/gallery/image-3.jpg" data-rel="colorbox">

                                        <img alt="150x150" src="${pageContext.request.contextPath}/back/assets/images/gallery/thumb-3.jpg" />

                                        <div class="text">

                                            <div class="inner">Sample Caption on Hover</div>

                                        </div>

                                    </a>



                                    <div class="tools tools-bottom">

                                        <a href="#">

                                            <i class="icon-link"></i>

                                        </a>



                                        <a href="#">

                                            <i class="icon-paper-clip"></i>

                                        </a>



                                        <a href="#">

                                            <i class="icon-pencil"></i>

                                        </a>



                                        <a href="#">

                                            <i class="icon-remove red"></i>

                                        </a>

                                    </div>

                                </li>



                                <li>
                                    <a href="${pageContext.request.contextPath}/back/assets/images/gallery/image-4.jpg" data-rel="colorbox">
                                        <img alt="150x150" src="${pageContext.request.contextPath}/back/assets/images/gallery/thumb-4.jpg" />

                                        <div class="tags">
													<span class="label-holder">
														<span class="label label-info arrowed">fountain</span>
													</span>

                                            <span class="label-holder">
                                                <span class="label label-danger">recreation</span>
                                            </span>
                                        </div>
                                    </a>

                                    <div class="tools tools-top">

                                        <a href="#">

                                            <i class="icon-link"></i>

                                        </a>



                                        <a href="#">

                                            <i class="icon-paper-clip"></i>

                                        </a>



                                        <a href="#">

                                            <i class="icon-pencil"></i>

                                        </a>



                                        <a href="#">

                                            <i class="icon-remove red"></i>

                                        </a>

                                    </div>

                                </li>



                                <li>

                                    <div>

                                        <img alt="150x150" src="${pageContext.request.contextPath}/back/assets/images/gallery/thumb-5.jpg" />

                                        <div class="text">

                                            <div class="inner">

                                                <span>Some Title!</span>



                                                <br />

                                                <a href="${pageContext.request.contextPath}/back/assets/images/gallery/image-5.jpg" data-rel="colorbox">

                                                    <i class="icon-zoom-in"></i>

                                                </a>



                                                <a href="#">

                                                    <i class="icon-user"></i>

                                                </a>



                                                <a href="#">

                                                    <i class="icon-share-alt"></i>

                                                </a>

                                            </div>

                                        </div>

                                    </div>

                                </li>



                                <li>

                                    <a href="${pageContext.request.contextPath}/back/assets/images/gallery/image-6.jpg" data-rel="colorbox">

                                        <img alt="150x150" src="${pageContext.request.contextPath}/back/assets/images/gallery/thumb-6.jpg" />

                                    </a>



                                    <div class="tools tools-right">

                                        <a href="#">

                                            <i class="icon-link"></i>

                                        </a>



                                        <a href="#">

                                            <i class="icon-paper-clip"></i>

                                        </a>



                                        <a href="#">

                                            <i class="icon-pencil"></i>

                                        </a>



                                        <a href="#">

                                            <i class="icon-remove red"></i>

                                        </a>

                                    </div>

                                </li>



                                <li>

                                    <a href="${pageContext.request.contextPath}/back/assets/images/gallery/image-1.jpg" data-rel="colorbox">

                                        <img alt="150x150" src="${pageContext.request.contextPath}/back/assets/images/gallery/thumb-1.jpg" />

                                    </a>



                                    <div class="tools">

                                        <a href="#">

                                            <i class="icon-link"></i>

                                        </a>



                                        <a href="#">

                                            <i class="icon-paper-clip"></i>

                                        </a>



                                        <a href="#">

                                            <i class="icon-pencil"></i>

                                        </a>



                                        <a href="#">

                                            <i class="icon-remove red"></i>

                                        </a>

                                    </div>

                                </li>



                                <li>
                                    <a href="${pageContext.request.contextPath}/back/assets/images/gallery/image-2.jpg" data-rel="colorbox">
                                        <img alt="150x150" src="${pageContext.request.contextPath}/back/assets/images/gallery/thumb-2.jpg" />
                                    </a>
                                    <div class="tools tools-top">
                                        <a href="#">
                                            <i class="icon-link"></i>
                                        </a>

                                        <a href="#">
                                            <i class="icon-paper-clip"></i>
                                        </a>

                                        <a href="#">
                                            <i class="icon-pencil"></i>
                                        </a>

                                        <a href="#">
                                            <i class="icon-remove red"></i>
                                        </a>
                                    </div>

                                </li>
                                <c:forEach items="${medias}" var="media">
                                    <li>
                                        <a href="${pageContext.request.contextPath}${media.pic}" data-rel="colorbox">
                                            <img alt="150x150" height="150" width="150" src="${pageContext.request.contextPath}${media.pic}" />

                                            <div class="tags">
													<span class="label-holder">
														<span class="label label-info arrowed">${media.pic_class==null?"未设置":media.pic_class}</span>
													</span>

                                                <span class="label-holder">
                                                <span class="label label-danger">${media.pic_name==null?"未设置":media.pic_name}</span>
                                            </span>
                                            </div>
                                        </a>
                                        <div class="tools tools-top">
                                            <%--上传到网站媒体库--%>
                                            <a href="javascript:void(0);" onclick="UploadMedia('${media.media_id}')">
                                                <i class="icon-link"></i>
                                            </a>

                                            <%--设为头衔--%>
                                            <a href="javascript:void(0);" onclick="SetToHead('${media.media_id}')">
                                                <i class="icon-paper-clip"></i>
                                            </a>

                                            <%--编辑--%>
                                            <a href="javascript:void(0);" onclick="msgbox(1,'${media.pic_class}','${media.pic_name}','${media.media_id}')">
                                                <i class="icon-pencil"></i>
                                            </a>

                                            <%--删除--%>
                                            <a href="DeletePic.action?pic_id=${media.media_id}">
                                                <i class="icon-remove red"></i>
                                            </a>
                                        </div>

                                    </li>
                                </c:forEach>

                            </ul>

                        </div><!-- PAGE CONTENT ENDS -->

                    </div><!-- /.col -->

                </div><!-- /.row -->

            </div><!-- /.page-content -->

        </div><!-- /.main-content -->


        <script type="text/javascript">


            function UploadMedia(pic_id) {
                if(confirm("确定上传？")){
                    $.post(
                        "${pageContext.request.contextPath}/UploadMedia.action",
                        {"pic_id":pic_id},
                        function (data) {
                            if(data.succeed == "1")
                                alert("成功");
                            else if(data.succeed == "0")
                                alert("图片分组不正确，请重新编辑图片分组！");
                            else
                                alert("失败，媒体库中已有该张图片");
                        },"json"
                    );
                }
            }


            function SetToHead(id) {
                if(confirm("要把该图片设为头像吗？")){
                   $.post(
                       "${pageContext.request.contextPath}/SetToHead.action",
                       {"pic_id":id},
                       function (data) {
                           if(data.succeed == "1")
                               alert("设置成功");
                       },"json"
                   );
                }

            }
        </script>
        <div id="inputbox" class="box">
            <a class='x' href=''; onclick="msgbox(0); return false;">关闭</a>
            <h3 style="text-align: center">修改图片信息</h3>
            <form>
                <input type="hidden" id="pic_id" value="">
                <span>图片类型 ： </span><input type="text" id="pic_class" value=""><br>
                <span>图片名称 ： </span><input type="text" id="pic_name" value="">
                <input  type="button" value="确定" style="width: 50px;" onclick="EditPicInfo()">
            </form>
        </div>



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
<script>
    function msgbox(n,pic_class,pic_name,media_id){

        document.getElementById('inputbox').style.display=n?'block':'none';     /* 点击按钮打开/关闭 对话框 */
        $("#pic_id").attr("value",media_id);
        $("#pic_class").attr("value",pic_class);
        $("#pic_name").attr("value",pic_name);
    }
</script>

<script type="text/javascript">
    function EditPicInfo() {
        var pic_id = $("#pic_id").val();
        var pic_class= $("#pic_class").val();
        var pic_name= $("#pic_name").val();
        $.post(
        "${pageContext.request.contextPath}/EditPicInfo.action",
        {"pic_id":pic_id,"pic_class":pic_class,"pic_name":pic_name},
            function (data) {
                if(data.succeed=="1"){
                    alert("修改成功");
                    //msgbox(0);
                    window.location.reload();
            }
                else
                    alert("错误")
            },"json"
        );

    }
</script>


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



<script src="${pageContext.request.contextPath}/back/assets/js/jquery.colorbox-min.js"></script>



<!-- ace scripts -->



<script src="${pageContext.request.contextPath}/back/assets/js/ace-elements.min.js"></script>

<script src="${pageContext.request.contextPath}/back/assets/js/ace.min.js"></script>



<!-- inline scripts related to this page -->



<script type="text/javascript">

    jQuery(function($) {

        var colorbox_params = {

            reposition:true,

            scalePhotos:true,

            scrolling:false,

            previous:'<i class="icon-arrow-left"></i>',

            next:'<i class="icon-arrow-right"></i>',

            close:'&times;',

            current:'{current} of {total}',

            maxWidth:'100%',

            maxHeight:'100%',

            onOpen:function(){

                document.body.style.overflow = 'hidden';

            },

            onClosed:function(){

                document.body.style.overflow = 'auto';

            },

            onComplete:function(){

                $.colorbox.resize();

            }

        };



        $('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);

        $("#cboxLoadingGraphic").append("<i class='icon-spinner orange'></i>");//let's add a custom loading icon



        /**$(window).on('resize.colorbox', function() {

		try {

			//this function has been changed in recent versions of colorbox, so it won't work

			$.fn.colorbox.load();//to redraw the current frame

		} catch(e){}

	});*/

    })

</script>



</body>

</html>

