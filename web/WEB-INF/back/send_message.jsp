<%--
  Created by IntelliJ IDEA.
  User: 89507
  Date: 2018/10/14
  Time: 12:37
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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/jquery-ui-1.10.3.custom.min.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/jquery.gritter.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/select2.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/bootstrap-editable.css" />


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

                    $("#message_manager").addClass("active open");
                    $("#send_message").addClass("active");

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

                        <a href="#">帖子管理</a>

                    </li>

                    <li class="active">发信息</li>

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

                        <div class="page-content">

                            <div class="page-header">

                                <h1>发消息 </h1>

                            </div><!-- /.page-header -->



                            <div class="row">

                                <div class="col-xs-12">

                                    <!-- PAGE CONTENT BEGINS -->


                                    <h4 class="header green clearfix">
                                        消息目标
                                        <small>

                                            <i class="icon-double-angle-right"></i>

                                            可填写用户的邮箱或者用户名

                                        </small>
                                    </h4>
                                    <div style="text-align: center">
                                        <input type="hidden" value="${MessageTargetID}" id="friend_id" >
                                        <input type="text" id="FriendName"  size="60" style="height: 40px" value="${MessageTarget==null?null:MessageTarget}" onblur="TextUser()">
                                    </div>


                                    <h4 class="header green clearfix">

                                        消息内容

                                        <span class="block pull-right">

										<small class="grey middle">Choose style: &nbsp;</small>



										<span class="btn-toolbar inline middle no-margin">

											<span data-toggle="buttons" class="btn-group no-margin">

												<label class="btn btn-sm btn-yellow">

													1

													<input type="radio" value="1" />

												</label>



												<label class="btn btn-sm btn-yellow active">

													2

													<input type="radio" value="2" />

												</label>



												<label class="btn btn-sm btn-yellow">

													3

													<input type="radio" value="3" />

												</label>

											</span>

										</span>

									</span>

                                    </h4>

                                    <div class="wysiwyg-editor" id="editor1"></div>


                                    <div class="hr hr-double dotted"></div>
                                    <div style="text-align: right">
                                        <input type="button" value="提交" onclick="submit_message()">
                                    </div>
                                    <script type="text/javascript">
                                        function TextUser() {
                                            var input = $("#FriendName").val();
                                            $.post(
                                                "${pageContext.request.contextPath}/TestFriendName.action",
                                                {"FriendName":input},
                                                function (data) {
                                                    if(data.FriendID!="notfind"){
                                                        window.location.href="${pageContext.request.contextPath}/SendMessage.action?friend_id="+data.FriendID;

                                                    }
                                                    else
                                                        alert("无法找到该用户");
                                                },"json"
                                            );

                                        }

                                        function submit_message() {
                                            var friend_id = "${MessageTargetID}";
                                            var user_id = "${user.user_id}";
                                            var details =  $("#editor1").html();
                                            $.post(
                                                "${pageContext.request.contextPath}/SubmitMessage.action",
                                                {"friend_id":friend_id,"user_id":user_id,"details":details},
                                                function (data) {
                                                    if(data.succeed=="1"){
                                                        alert("成功");
                                                        window.location.href="${pageContext.request.contextPath}/usermain.action";
                                                    }
                                                    else{
                                                        alert("失败");
                                                    }
                                                },"json"
                                            );
                                        }
                                    </script>







                                    <script type="text/javascript">

                                        var $path_assets = "assets";//this will be used in loading jQuery UI if needed!

                                    </script>



                                    <!-- PAGE CONTENT ENDS -->

                                </div><!-- /.col -->

                            </div><!-- /.row -->

                        </div><!-- /.page-content -->

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


<script src="${pageContext.request.contextPath}/back/assets/js/ace-elements.min.js"></script>

<script src="${pageContext.request.contextPath}/back/assets/js/ace.min.js"></script>


<!--富文本编辑器-->
<script src="${pageContext.request.contextPath}/back/assets/js/jquery-ui-1.10.3.custom.min.js"></script>

<script src="${pageContext.request.contextPath}/back/assets/js/jquery.ui.touch-punch.min.js"></script>

<script src="${pageContext.request.contextPath}/back/assets/js/markdown/markdown.min.js"></script>

<script src="${pageContext.request.contextPath}/back/assets/js/markdown/bootstrap-markdown.min.js"></script>

<script src="${pageContext.request.contextPath}/back/assets/js/jquery.hotkeys.min.js"></script>

<script src="${pageContext.request.contextPath}/back/assets/js/bootstrap-wysiwyg.min.js"></script>

<script src="${pageContext.request.contextPath}/back/assets/js/bootbox.min.js"></script>
<script type="text/javascript">

    jQuery(function($){



        function showErrorAlert (reason, detail) {

            var msg='';

            if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }

            else {

                console.log("error uploading file", reason, detail);

            }

            $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+

                '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');

        }



        //$('#editor1').ace_wysiwyg();//this will create the default editor will all buttons



        //but we want to change a few buttons colors for the third style

        $('#editor1').ace_wysiwyg({

            toolbar:

                [

                    'font',

                    null,

                    'fontSize',

                    null,

                    {name:'bold', className:'btn-info'},

                    {name:'italic', className:'btn-info'},

                    {name:'strikethrough', className:'btn-info'},

                    {name:'underline', className:'btn-info'},

                    null,

                    {name:'insertunorderedlist', className:'btn-success'},

                    {name:'insertorderedlist', className:'btn-success'},

                    {name:'outdent', className:'btn-purple'},

                    {name:'indent', className:'btn-purple'},

                    null,

                    {name:'justifyleft', className:'btn-primary'},

                    {name:'justifycenter', className:'btn-primary'},

                    {name:'justifyright', className:'btn-primary'},

                    {name:'justifyfull', className:'btn-inverse'},

                    null,

                    {name:'createLink', className:'btn-pink'},

                    {name:'unlink', className:'btn-pink'},

                    null,

                    {name:'insertImage', className:'btn-success'},

                    null,

                    'foreColor',

                    null,

                    {name:'undo', className:'btn-grey'},

                    {name:'redo', className:'btn-grey'}

                ],

            'wysiwyg': {

                fileUploadError: showErrorAlert

            }

        }).prev().addClass('wysiwyg-style2');







        $('#editor2').css({'height':'200px'}).ace_wysiwyg({

            toolbar_place: function(toolbar) {

                return $(this).closest('.widget-box').find('.widget-header').prepend(toolbar).children(0).addClass('inline');

            },

            toolbar:

                [

                    'bold',

                    {name:'italic' , title:'Change Title!', icon: 'icon-leaf'},

                    'strikethrough',

                    null,

                    'insertunorderedlist',

                    'insertorderedlist',

                    null,

                    'justifyleft',

                    'justifycenter',

                    'justifyright'

                ],

            speech_button:false

        });





        $('[data-toggle="buttons"] .btn').on('click', function(e){

            var target = $(this).find('input[type=radio]');

            var which = parseInt(target.val());

            var toolbar = $('#editor1').prev().get(0);

            if(which == 1 || which == 2 || which == 3) {

                toolbar.className = toolbar.className.replace(/wysiwyg\-style(1|2)/g , '');

                if(which == 1) $(toolbar).addClass('wysiwyg-style1');

                else if(which == 2) $(toolbar).addClass('wysiwyg-style2');

            }

        });









        //Add Image Resize Functionality to Chrome and Safari

        //webkit browsers don't have image resize functionality when content is editable

        //so let's add something using jQuery UI resizable

        //another option would be opening a dialog for user to enter dimensions.

        if ( typeof jQuery.ui !== 'undefined' && /applewebkit/.test(navigator.userAgent.toLowerCase()) ) {



            var lastResizableImg = null;

            function destroyResizable() {

                if(lastResizableImg == null) return;

                lastResizableImg.resizable( "destroy" );

                lastResizableImg.removeData('resizable');

                lastResizableImg = null;

            }



            var enableImageResize = function() {

                $('.wysiwyg-editor')

                    .on('mousedown', function(e) {

                        var target = $(e.target);

                        if( e.target instanceof HTMLImageElement ) {

                            if( !target.data('resizable') ) {

                                target.resizable({

                                    aspectRatio: e.target.width / e.target.height,

                                });

                                target.data('resizable', true);



                                if( lastResizableImg != null ) {//disable previous resizable image

                                    lastResizableImg.resizable( "destroy" );

                                    lastResizableImg.removeData('resizable');

                                }

                                lastResizableImg = target;

                            }

                        }

                    })

                    .on('click', function(e) {

                        if( lastResizableImg != null && !(e.target instanceof HTMLImageElement) ) {

                            destroyResizable();

                        }

                    })

                    .on('keydown', function() {

                        destroyResizable();

                    });

            }



            enableImageResize();



            /**

             //or we can load the jQuery UI dynamically only if needed

             if (typeof jQuery.ui !== 'undefined') enableImageResize();

             else {//load jQuery UI if not loaded

			$.getScript($path_assets+"/js/jquery-ui-1.10.3.custom.min.js", function(data, textStatus, jqxhr) {

				if('ontouchend' in document) {//also load touch-punch for touch devices

					$.getScript($path_assets+"/js/jquery.ui.touch-punch.min.js", function(data, textStatus, jqxhr) {

						enableImageResize();

					});

				} else	enableImageResize();

			});

		}

             */

        }





    });

</script>
<!-- inline scripts related to this page -->




<!-- inline scripts related to this page -->



</body>

</html>

