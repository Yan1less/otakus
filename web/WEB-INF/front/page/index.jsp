<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>肥宅快乐站</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/font-awesome.min.css">
    <script src="${pageContext.request.contextPath}/front/js/jquery-1.11.1.min.js"></script>
</head>

<body>

<div id="page1"></div>
<script type="text/javascript" >
    $("#page1").load("${pageContext.request.contextPath}/front/page/head-box.jsp");
</script>

<div class="content">
    <div class="idx-banner">
        <div class="fullSlide">
            <div class="box">
                <ul>
                    <li style="background:url(${pageContext.request.contextPath}/front/upload/illust_64502343_20180120_193038.png) no-repeat center center;">
                        <a href="javascript:;"></a></li>
                    <li style="background:url(${pageContext.request.contextPath}/front/upload/illust_65006959_20180512_220623.jpg) no-repeat center center;">
                        <a href="javascript:;"></a></li>
                    <li style="background:url(${pageContext.request.contextPath}/front/upload/illust_67467093_20180315_084559.png) no-repeat center center;">
                        <a href="javascript:;"></a></li>
                </ul>
            </div>
            <div class="hbox">
                <ul></ul>
            </div>
        </div>
    </div>



    <script language="JavaScript">
        function ShowToText(){
            document.form_name.textfield_name3.value=document.form_name.search_type.options[document.form_name.search_type.selectedIndex].text
        }

        function CheckNull() {
            var search_text = $("#search_text").val();
            var search_type = $("#search_type").val();
            if(search_type=="null"){
                alert("请输入选择信息");
                return;
            }

            if(search_text.trim() != "" )
                $("#animate_search_form").submit();
                //alert("xxx");
            else
                alert("请输入查询条件");
        }

    </script>

    <div class="wrap">
        <div class="cont-box" >

           <form action="animate.action" style="text-align: center" id="animate_search_form">
               <input type="text" style="height: 30px;width: 250px" name="search_text" id="search_text" value="${current_text}"/>
               <select name="search_type" onChange="ShowToText();" style="height: 30px;width: 80px;" id="search_type">
                   <option value="null"> </option>
                   <option value="title"  <c:if test="${current_search=='title'}">selected="selected"</c:if> id="title">名字</option>
                   <option value="madefrom" <c:if test="${current_search=='madefrom'}">selected="selected"</c:if> id="madefrom">制作公司</option>
                   <option value="date" <c:if test="${current_search=='date'}">selected="selected"</c:if>  id="date">上架日期</option>
                   <option value="intro" <c:if test="${current_search=='intro'}">selected="selected"</c:if> id="intro">介绍</option>
                   <option value="cv"<c:if test="${current_search=='cv'}">selected="selected"</c:if>  id="cv">声优</option>
                   <option value="tags"<c:if test="${current_search=='tags'}">selected="selected"</c:if>  id="tags">标签</option>
               </select>
               <input type="button" value="搜索" style="height: 30px;width: 40px;" onclick="CheckNull()"/>
               <div style="float: right">
                   <span style="font-size: small;color: #4e4e4e">
                       总共检索到
                       <span style="font-style: oblique;color: #2a6496">${animatePage.totalCount}</span>条数据，共
                       <span style="font-style: oblique;color: #2a6496">${animatePage.totalPage}</span>页
                   </span>
               </div>

               <br>
           </form>

        </div>




        <div class="kg-box">
            <div class="kg-title"></div>
            <div class="kg">
                <c:forEach items="${animatePage.rows}" var="animate">
                    <div class="kg-a fl" style="margin-bottom:10px">
                        <div class="fl" ><img  style="width: 250px;height: 360px;" src="${pageContext.request.contextPath}${animate.img}"></div>
                        <div class="kg-a2 fl"style="width: 550px">
                            <a href="${animate.link}"><div class="kg-a4" style="font-size: 20px">${animate.tittle} </div></a>
                            <div class="kg-a3"><span class="kg-a5">发源地：</span>${animate.place}</div>
                            <div class="kg-a3"><span class="kg-a5">放送日期：</span>${animate.date}</div>
                            <div class="kg-a3"><span class="kg-a5">标签：</span>${animate.tag} </div>
                            <div class="kg-a3"><span class="kg-a5">声优：</span>${animate.characterVoice}</div>
                            <div class="kg-a3"><span class="kg-a5">制作：</span>${animate.madeFrom} </div>
                            <div class="kg-a3"><span class="kg-a5">看点：</span>${animate.watchPoint} </div>
                            <div class="kg-a3"><span class="kg-a5">简介：</span>${animate.introduce} </div>
                            <div class="kg-t"><img src="${pageContext.request.contextPath}/front/images/kg-t.png"></div>
                        </div>

                    </div>

                </c:forEach>


            </div>

            <br>
            <div style="text-align: right">
                <ul class="pagination">

                    <c:if test="${animatePage.currentPage!=1}">
                        <li>
                            <a href="${pageContext.request.contextPath}/animate.action?currentPage=${animatePage.currentPage-1}&search_type=${current_search}&search_text=${current_text}">
                                <i class="icon-double-angle-left"></i>
                            </a>
                        </li>
                    </c:if>

                    <c:if test="${animatePage.currentPage==1}">
                        <li class="disabled">
                            <a href="#">
                                <i class="icon-double-angle-left"></i>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${animatePage.currentPage<5}">
                        <c:forEach begin="1" end="5" var="fenyepage">

                            <c:if test="${fenyepage == animatePage.currentPage}">
                                <li class="active">
                                    <a href="animate.action?currentPage=${fenyepage}&search_type=${current_search}&search_text=${current_text}">${fenyepage}</a>
                                </li>
                            </c:if>
                            <c:if test="${fenyepage != animatePage.currentPage}">
                                <li>
                                    <a href="animate.action?currentPage=${fenyepage}&search_type=${current_search}&search_text=${current_text}">${fenyepage}</a>
                                </li>
                            </c:if>

                        </c:forEach>
                    </c:if>
                    <c:if test="${animatePage.currentPage>=5}">
                        <c:forEach begin="${animatePage.currentPage-3}" end="${animatePage.currentPage+3>=animatePage.totalPage?animatePage.totalPage:animatePage.currentPage+3}" var="fenyepage">

                            <c:if test="${fenyepage == animatePage.currentPage}">
                                <li class="active">
                                    <a href="animate.action?currentPage=${fenyepage}&search_type=${current_search}&search_text=${current_text}">${fenyepage}</a>
                                </li>
                            </c:if>
                            <c:if test="${fenyepage != animatePage.currentPage}">
                                <li>
                                    <a href="animate.action?currentPage=${fenyepage}&search_type=${current_search}&search_text=${current_text}">${fenyepage}</a>
                                </li>
                            </c:if>

                        </c:forEach>
                    </c:if>




                    <c:if test="${animatePage.currentPage==animatePage.totalPage}">
                        <li class="disabled">
                            <a href="javascript:void(0);">
                                <i class="icon-double-angle-right"></i>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${animatePage.currentPage!=animatePage.totalPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/animate.action?currentPage=${animatePage.currentPage+1}&search_type=${current_search}&search_text=${current_text}">
                                <i class="icon-double-angle-right"></i>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </div>

        </div>



        <%--<div class="idx-btm"><a href=""><img src="${pageContext.request.contextPath}/front/upload/act-f.jpg"></a></div>--%>
    </div><!--wrap-->
</div>



<!--加载页尾-->
<div id="footer"></div>
<script type="text/javascript">
    $("#footer").load("${pageContext.request.contextPath}/front/page/foot-box.jsp");
</script>


<div class="mask"></div>
<div class="login">
    <div class="login-title">
        <div class="login-a">登录</div>
        <div class="login-b"></div>
        <div class="login-c close">x</div>
    </div>
    <div class="login-btm">
        <div class="login-d"><input type="text" class="login-text" placeholder="注册时填写的邮箱"></div>
        <div class="login-d"><input type="password" class="login-pas" placeholder="密码"></div>
        <div class="login-d"><input type="button" class="login-btn" placeholder="登录"></div>
        <div class="login-f">
            <a href="">忘记密码</a>
            <span>还没有焦点账号?><a href="javascript:;" class="reg-href">点击注册</a></span>
        </div>
    </div>
</div>

<div class="reg">
    <div class="login-title">
        <div class="login-a">注册</div>
        <div class="login-b"></div>
        <div class="login-c close">x</div>
    </div>
    <div class="login-btm">
        <div class="login-d"><input type="text" class="login-text" placeholder="邮箱/手机号"></div>
        <div class="login-d"><input type="password" class="login-pas" placeholder="密码"></div>
        <div class="login-d"><input type="button" class="login-btn" placeholder="注册"></div>
        <div class="login-f">
            <a href="">忘记密码</a>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/front/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script src="${pageContext.request.contextPath}/front/js/Action.js"></script>

<script type="text/javascript">
    // $(function(){
    //     var nav=$(".header"); //得到导航对象
    //     var win=$(window); //得到窗口对象
    //     var sc=$(document);//得到document文档对象。
    //     win.scroll(function(){
    //         if(sc.scrollTop()>=580){
    //             nav.addClass("head-cut");
    //             $(".head-cut").fadeIn(500);
    //         }else{
    //             nav.removeClass("head-cut");
    //             $(".head-cut").fadeOut(500);
    //         }
    //     })
    // })
</script>
<script type="text/javascript">
    $(function ($) {
        $(".fullSlide").slide({
            titCell: ".hbox ul",
            mainCell: ".box ul",
            effect: "fold",
            mouseOverStop:false,
            autoPlay: true,
            autoPage: true,
            trigger: "click",
            startFun: function (i) {
                var curLi = jQuery(".fullSlide .bd li").eq(i);
                if (!!curLi.attr("_src")) {
                    curLi.css("background-image", curLi.attr("_src")).removeAttr("_src")
                }
            }
        });

    });

</script>
</body>
</html>

