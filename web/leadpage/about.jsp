
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>

    <%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
    <meta name="description" content="cmsmasters website template" />
    <meta name="keywords" content="html, css, template" />
    <link rel="shortcut icon" href="images/favicon.png" type="image/png" />
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="css/styles/prettyPhoto.css" type="text/css" media="screen" />
    <link id="gFontName" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Cuprum:regular,italic,bold,bolditalic" type="text/css" />
    <!--[if lt IE 9]>
    <link rel="stylesheet" href="css/styles/ie.css" type="text/css" />
    <![endif]-->
    <title>关于yan1less主权</title>
    <!-- Shared on MafiaShare.net  --><!-- Shared on MafiaShare.net  --></head>
<body class="standard simple">
<script type="text/javascript"> if (window.jQuery == undefined) document.write( unescape('%3Cscript src="js/jquery-1.6.4.min.js" type="text/javascript"%3E%3C/script%3E') ); </script>
<script src="js/jquery.prettyPhoto.js" type="text/javascript"></script>
<script src="js/script.js" type="text/javascript"></script>
<script type="text/javascript">
    jQuery(document).ready(function(){
        if (jQuery.browser.msie && jQuery.browser.version < 9){
            var $windowWidth = jQuery(window).width()+17;
            var $windowHeight = jQuery(window).height()+17;
        } else {
            var $windowWidth = window.innerWidth;
            var $windowHeight = window.innerHeight;
        }

        var $image = jQuery('.bgImage img');
        var img = new Image();

        img.src = jQuery($image).attr('src');

        var intervalId = setInterval(function(){
            if (img.complete){
                var $imgWidth = img.width;
                var $imgHeight = img.height;
                var $widthFactor = parseFloat($imgWidth/$windowWidth);
                var $heightFactor = parseFloat($imgHeight/$windowHeight);

                if ($widthFactor < $heightFactor){
                    jQuery($image).css({width:$windowWidth+'px', height:parseInt($imgHeight/$widthFactor)+'px', top:'-'+parseInt((parseInt($imgHeight/$widthFactor)-$windowHeight)/2)+'px', left:0});
                } else {
                    jQuery($image).css({width:parseInt($imgWidth/$heightFactor)+'px', height:$windowHeight+'px', top:0, left:'-'+parseInt((parseInt($imgWidth/$heightFactor)-$windowWidth)/2)+'px'});
                }

                clearInterval(intervalId);
                LoadImageStart();
            }
        }, 50);

        function LoadImageStart(){
            $image.parent().fadeIn(500, function(){
                jQuery(this).css({display:'block'});
            });
        }

        jQuery(window).resize(function(){
            if (jQuery.browser.msie && jQuery.browser.version < 9){
                var $windowWidth = jQuery(window).width()+17;
                var $windowHeight = jQuery(window).height();
            } else {
                var $windowWidth = window.innerWidth;
                var $windowHeight = window.innerHeight;
            }

            var $imgWidth = img.width;
            var $imgHeight = img.height;
            var $widthFactor = parseFloat($imgWidth/$windowWidth);
            var $heightFactor = parseFloat($imgHeight/$windowHeight);

            if ($widthFactor < $heightFactor){
                jQuery($image).css({width:$windowWidth+'px', height:parseInt($imgHeight/$widthFactor)+'px', top:'-'+parseInt((parseInt($imgHeight/$widthFactor)-$windowHeight)/2)+'px', left:0});
            } else {
                jQuery($image).css({width:parseInt($imgWidth/$heightFactor)+'px', height:$windowHeight+'px', top:0, left:'-'+parseInt((parseInt($imgWidth/$heightFactor)-$windowWidth)/2)+'px'});
            }
        });
    });
</script>

<!-- _________________________ Start Background Image __________________________ -->
<div class="bgImage">
    <img src="images/subpage_bg.jpg" alt="" />
</div>
<!-- _________________________ Finish Background Image __________________________ -->


<!-- _________________________ Start Page ___________________________ -->
<div id="page">

    <!-- _________________________ Start Header _________________________ -->
    <div class="header_wrap">
        <div id="header">
            <div class="header_inner">
                <a class="logo" title="Pacifico" href="index.jsp">
                    <img alt="Pacifico" src="images/logo.png" />

                </a>

                <!-- _________________________ Start Navigation _____________________ -->
                <div class="navigation_wrap">
                    <ul id="navigation">
                        <li><a href="/"><span></span></a></li>
                        <li><a href="${pageContext.request.contextPath}/leadpage/about.jsp">关于<span>about</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/animate.action?currentPage=1">进入萌站<span>GO moe</span></a>

                        </li>
                        <li><a href="MediaBase.action">萌图床<span>pic moe</span></a>

                        </li>
                        <li><a href="http://blog.yoomeili.cn">博客<span>blog</span></a>

                        </li>
                        <li><a href="http://wpa.qq.com/msgrd?v=3&uin=1427460400&site=qq&menu=yes">联系笨站长<span>love me</span></a></li>
                    </ul>
                </div>
            </div>
            <div class="header_arrow_wrap">
                <a href="#" class="header_arrow"><span>&nbsp;</span></a>
            </div>
            <!-- _________________________ Finish Navigation ____________________ -->

        </div>
    </div>
    <!-- _________________________ Finish Header ________________________ -->


    <!-- _________________________ Start Middle _________________________ -->
    <div id="middle">
        <div id="home">
            <h2 class="home">关于萌站</h2>
        </div>
        <div class="middle_content">
            <div class="entry">
                <p><img src="images/img_8.jpg" alt="" /></p>
                <h3>关于萌站</h3>
                <p>本站建立与2018年8月，目标是让<span style="color: red">お宅たちに幸せ</span>！本站包含：2012年至今的季番，精美的图库，论坛系统<P>萌站站长：yan1less   QQ：895072956</p>
                <a href="${pageContext.request.contextPath}/animate.action?currentPage=1" class="button btn_1">进入萌站</a>
                <a href="http://wpa.qq.com/msgrd?v=3&uin=1427460400&site=qq&menu=yes" class="button btn_1">联系我</a>
                <audio autoplay="autoplay"><source src="/mengzhan.mp3" type="audio/mpeg" /></audio>

                <div class="cl"></div>
                <br />
            </div>
        </div>
        <div class="cl"></div>

        <!-- _________

        <!-- _________________________ Start Footer _________________________ -->
        <div id="footer">
            <p>Pacifico &copy; 2018 by 萌站</p>
        </div>
        <!-- _________________________ Finish Footer ________________________ -->

    </div>
    <!-- _________________________ Finish Middle ________________________ -->

    <div class="cl"></div>
</div>
<!-- _________________________ Finish Page __________________________ -->

</body>
</html>
