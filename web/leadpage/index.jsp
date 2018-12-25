<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="description" content="cmsmasters website template" />
    <meta name="keywords" content="html, css, template" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/leadpage/images/favicon.png" type="image/png" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/leadpage/css/style.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/leadpage/css/styles/prettyPhoto.css" type="text/css" media="screen" />
    <link id="gFontName" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Cuprum:regular,italic,bold,bolditalic" type="text/css" />
    <!--[if lt IE 9]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/leadpage/css/styles/ie.css" type="text/css" />
    <![endif]-->
    <title>肥宅快乐站</title>
    <!-- Shared on MafiaShare.net  --><!-- Shared on MafiaShare.net  --></head>
<body class="standard simple">
<script type="text/javascript"> if (window.jQuery == undefined) document.write( unescape('%3Cscript src="${pageContext.request.contextPath}/leadpage/js/jquery-1.6.4.min.js" type="text/javascript"%3E%3C/script%3E') ); </script>
<script src="${pageContext.request.contextPath}/leadpage/js/jquery.prettyPhoto.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/leadpage/js/script.js" type="text/javascript"></script>
<script type="text/javascript">
    jQuery(document).ready(function(){
        if (jQuery.browser.msie && jQuery.browser.version < 9){
            var $windowWidth = jQuery(window).width()+17;
            var $windowHeight = jQuery(window).height()+17;
        } else {
            var $windowWidth = window.innerWidth;
            var $windowHeight = window.innerHeight;
        }

        jQuery('body').append('<div id="preloaderMotion" />');
        jQuery('a.header_arrow').addClass('hidden');

        var $slider = '#sliderMotion';
        var $preloader = '#preloaderMotion';
        var $images = jQuery($slider+' li img');
        var $max = $images.length;

        $images.each(function(){
            var img = new Image();

            img.src = jQuery(this).attr('src');

            var intervalId = setInterval(function(){
                if (img.complete){
                    clearInterval(intervalId);

                    $max--;

                    jQuery($preloader).append('<img id="nMotion'+$max+'" src="'+img.src+'" width="60" height="35" alt="" />');
                    jQuery($preloader).find('img#nMotion'+$max).animate({opacity:1}, 500);

                    if ($max == 0){
                        LoadImageStart(jQuery($slider));
                        jQuery($preloader).fadeOut(500, function(){
                            jQuery(this).css({display:'none'});
                            showHideContent();
                        });
                    }
                }
            }, 50);
        });

        function LoadImageStart(slider){
            slider.cmsmsMotionSlider({
                sliderWidth:$windowWidth,
                sliderHeight:$windowHeight,
                pauseOnHover:false,
                showPause:false
            });

            jQuery('a[rel="prettyPhoto[bgSlider]"]').prettyPhoto({animationSpeed:'normal', deeplinking:false, social_tools:false});
        }

        jQuery(window).resize(function(){
            if (jQuery.browser.msie && jQuery.browser.version < 9){
                var $windowWidth = jQuery(window).width()+17;
                var $windowHeight = jQuery(window).height();
            } else {
                var $windowWidth = window.innerWidth;
                var $windowHeight = window.innerHeight;
            }

            jQuery('.cmsmsMotionSliderContainer, .cmsmsMotionSlides, .cmsmsMotionSlides canvas, .cmsmsMotionSlides img, .cmsmsMotionSlides iframe').css({width:$windowWidth+'px', height:$windowHeight+'px'});
            jQuery('.cmsmsMotionControl').css({height:$windowHeight+'px'});
            jQuery('.cmsmsMotionNavigation').css({height:parseInt($windowHeight - 195)+'px'});
        });
    });
</script>

<!-- _________________________ Start Slider __________________________ -->
<ul id="sliderMotion">
    <li data-thumb="${pageContext.request.contextPath}/leadpage/images/slider/thumbs/img1.jpg" data-start="top left" data-finish="bottom right" data-zoom="out" data-animation="10">
        <img src="${pageContext.request.contextPath}/leadpage/images/slider/img1.jpg" alt="Banner Image 1" />
        <div class="cmsmsSlideCaption" data-top="50">
            <h2>萌豚快乐站</h2>
            <p>本站建立与2018年8月，目标是让<span style="color: red">お宅たちに幸せ</span>！本站包含：2012年至今的季番，精美的图库，论坛系统</p>
            <a href="${pageContext.request.contextPath}/animate.action" class="button btn_1">点击进入本站</a>
        </div>
    </li>
    <li data-thumb="${pageContext.request.contextPath}/leadpage/images/slider/thumbs/img2.jpg" data-start="bottom center" data-finish="center center" data-zoom="in" data-animation="15">
        <a class="video autostop hd" href="http://www.youtube.com/watch?v=-PAjEHhz2mw"></a><img src="${pageContext.request.contextPath}/leadpage/images/slider/img2.jpg" alt="Banner Image 2" />

    </li>
    <li data-thumb="${pageContext.request.contextPath}/leadpage/images/slider/thumbs/img3.jpg" data-start="bottom right" data-finish="bottom left" data-zoom="out">
        <img src="${pageContext.request.contextPath}/leadpage/images/slider/img3.jpg" alt="Banner Image 3" />


    </li>
    <li data-thumb="${pageContext.request.contextPath}/leadpage/images/slider/thumbs/img4.jpg" data-start="center center" data-finish="center center" data-zoom="in">
        <a class="video autostop hd" href="http://vimeo.com/19625497"><img src="${pageContext.request.contextPath}/leadpage/images/slider/img4.jpg" alt="Banner Image 4" /></a>


    </li>
    <li data-thumb="${pageContext.request.contextPath}/leadpage/images/slider/thumbs/img5.jpg" data-start="center left" data-finish="top right" data-zoom="out" data-animation="15">
        <img src="${pageContext.request.contextPath}/leadpage/images/slider/img5.jpg" alt="Banner Image 5" />

    </li>
</ul>
<!-- _________________________ Finish Slider __________________________ -->


<!-- _________________________ Start Page ___________________________ -->
<div id="page" class="hideContent">

    <!-- _________________________ Start Header _________________________ -->
    <div class="header_wrap">
        <div id="header">
            <div class="header_inner">
                <a class="logo" title="Pacifico" href="index.jsp">
                    <img alt="Pacifico" src="${pageContext.request.contextPath}/leadpage/images/logo.png" />

                    <audio autoplay="autoplay"><source src="${pageContext.request.contextPath}/leadpage/mengzhan.mp3" type="audio/mpeg" /></audio>

                </a>

                <!-- _________________________ Start Navigation _____________________ -->
                <div class="navigation_wrap">
                    <ul id="navigation">
                        <br>
                        <br>
                        <li><a href="${pageContext.request.contextPath}/leadpage/about.jsp">关于<span>about</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/animate.action?currentPage=1">进入本站<span>GO moe</span></a>

                        </li>
                        <li><a href="MediaBase.action">图床<span>pic moe</span></a>

                        </li>
                        <li><a href="http://www.yan1less.com/blog">博客<span>blog</span></a>

                        </li>
                        <li><a href="${pageContext.request.contextPath}/contact.action">联系笨站长<span>love me</span></a></li>
                    </ul>
                </div>
                <!-- _________________________ Finish Navigation ____________________ -->

            </div>
            <div class="header_arrow_wrap">
                <a href="#" class="header_arrow"><span>&nbsp;</span></a>
            </div>
        </div>
    </div>
    <!-- _________________________ Finish Header ________________________ -->

</div>
<!-- _________________________ Finish Page __________________________ -->

</body>
</html>
