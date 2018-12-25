<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 89507
  Date: 2018/10/7
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>${article.name}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/style.css">
    <script src="${pageContext.request.contextPath}/front/js/jquery-1.11.1.min.js"></script>
</head>

<body>
<!--导入页首-->
<div id="page1"></div>
<script type="text/javascript" >
    $("#page1").load("${pageContext.request.contextPath}/front/page/head-box.jsp");
    window.onload=function () {
        $("#mainPage").removeClass("nav-cut");

        $("#article").addClass("nav-cut");

    }
</script>

<div class="content">

    <div class="wrap">

        <div class="tsm-height"></div>


        <div class="det-a">
            <div class="det-title"><img src="${pageContext.request.contextPath}/front/images/det-c.jpg">${article.name}</div>
            <p>${article.main_information}</p>
        </div>

        <div class="det-b">
            <div class="det-title"><img src="${pageContext.request.contextPath}/front/images/det-c.jpg">在线评论</div>
            <c:if test="${user!=null}">
                <div class="det-b1">
                    <textarea class="det-area" style="font-size: large" id="committextarea"></textarea>

                </div>
            </c:if>
            <c:if test="${user==null}">
            <div class="det-b1">
                <textarea class="det-area" disabled></textarea>
                <div class="det-b2"><a href="login.action">登录</a>发表</div>
            </div>
            </c:if>
            <div class="det-b3">
            <button onclick="testNull()" class="det-btn">发表</button>
            </div>

        </div>
        <script type="text/javascript">

            function testNull() {
                var input =  $("#committextarea").val();
                if(input.trim()==null|| input.trim()=="" || input==null)
                    alert("不能为空");
                else
                    submit_commit();
            }
            function submit_commit() {
                var uri = window.location.href;
                var id = uri.substring(uri.search("=")+1,uri.length);
                var userID = "${user.user_id}";
                var commit = $("#committextarea").val();

                $.post(
                    "${pageContext.request.contextPath}/Commit.action",
                    {"id":id,"commit":commit,"userID":userID},
                    function (data) {


                        if(data.succeed=="succeed"){
                            alert("发表成功");
                            window.location.reload();
                        }
                        else{
                            alert("发表失败，请重新编辑");
                        }
                    },"json"
                );

            }

        </script>
        <div class="skt">
            <div class="skt-title">
                <span class="skt-cut">默认评论</span><em>|</em><span>最新评论</span>
            </div>
            <div class="skt-tab">
                <div class="skt-btm">
                    <ul class="skt-ul">

                        

                        <c:forEach var="comment" items="${comment}">

                            <li>
                                <div class="skt-a1">
                                    <img src="${pageContext.request.contextPath}/front/upload/det-tx.jpg">
                                    <span style="font-size: larger;color: #2f3e44;font-style: italic">${comment.from_username}</span>
                                    <div class="menu">${comment.comment_time}</div>
                                </div>
                                <div class="skt-a2">${comment.comment_details}</div>
                                <div class="skt-a3">
                                    <div class="menu-a">
                                        <a href="javascript:void(0)" onclick="praise('${comment.comment_id}','a_${comment.comment_id}')" id="a_${comment.comment_id}">
                                            <img src="${pageContext.request.contextPath}/front/images/menu-a1.jpg">
                                            <span id="${comment.comment_id}">${comment.praise}</span>
                                        </a>
                                        <span><img src="${pageContext.request.contextPath}/front/images/menu-a2.jpg">0</span></div>
                                </div>
                            </li>

                        </c:forEach>


                    </ul>
                    <div class="skt-more"><a href="">查看更多</a></div>
                </div>

                <div class="skt-btm hide">
                    222
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
function praise(id,btnid) {
    if("${user.username}"==null||"${user.username}"=="")
        alert("请先登录");
    else{
    var praise = $("#" + id).html();

    praise =parseInt(praise+"")+1;
    document.getElementById(id).innerHTML=praise+"";
    $.post(
        "${pageContext.request.contextPath}/commentPraise.action",
        {"comment_id":id},
        function (data) {

        },"json"
    )
    $("#"+btnid).attr("onclick","javascript:void(0);");
    }
}
</script>
}
<!--加载页尾-->
<div id="footer"></div>
<script type="text/javascript">
    $("#footer").load("${pageContext.request.contextPath}/front/page/foot-box.jsp");
</script>


<!--登录注册弹窗-->
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
<script src="${pageContext.request.contextPath}/front/js/Action.js"></script>
<script>
    $(".skt-title span").click(function(){
        $(this).addClass("skt-cut").siblings().removeClass("skt-cut"),
            $(".skt-tab .skt-btm").hide().eq($(".skt-title span").index(this)).show()
    })
</script>
</body>
</html>

