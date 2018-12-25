<%--
  Created by IntelliJ IDEA.
  User: 89507
  Date: 2018/9/27
  Time: 18:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户注册</title>
    <link rel="stylesheet" type="${pageContext.request.contextPath}/login/text/css" href="css/normalize.css" />
    <link rel="stylesheet" type="${pageContext.request.contextPath}/login/text/css" href="css/demo.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/login/js/vendor/jgrowl/css/jquery.jgrowl.min.css">
    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login/css/component.css" />
    <!--[if IE]>
    <script src="${pageContext.request.contextPath}/login/js/html5.js"></script>
    <![endif]-->
    <style>
        input::-webkit-input-placeholder{
            color:rgba(0, 0, 0, 0.726);
        }
        input::-moz-placeholder{   /* Mozilla Firefox 19+ */
            color:rgba(0, 0, 0, 0.726);
        }
        input:-moz-placeholder{    /* Mozilla Firefox 4 to 18 */
            color:rgba(0, 0, 0, 0.726);
        }
        input:-ms-input-placeholder{  /* Internet Explorer 10-11 */
            color:rgba(0, 0, 0, 0.726);
        }
    </style>
</head>
<body>
<div class="container demo-1">
    <div class="content">
        <div id="large-header" class="large-header">
            <canvas id="demo-canvas"></canvas>
            <div class="logo_box">
                <h3>用户注册</h3>
                <!--//登陆成功跳到后台列表-->
                <form action="${pageContext.request.contextPath}/register.action" name="f" method="post" id="myform" >

                    <div class="input_outer">
                        <span class="u_user" ></span>
                        <input id="ID" onblur="Testuser()" name="username" class="text" style="color: #000000 !important" type="text" placeholder="请输入账户">
                        <p style="float: right; overflow: visible" id="userspan"> </p>
                    </div>

                    <div class="input_outer">
                        <span class="us_uer" ></span>
                        <input id="PASSWORD" onblur="Testpas()" name="password" class="text" style="color: #000000 !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码">
                        <p style="float: right; overflow: visible" id="passspan"> </p>
                    </div>
                    <div class="input_outer">
                        <span class="us_uer"></span>
                        <input id="telinput" onblur="TestTelephone()" name="telephone" class="text" style="color: #000000 !important; position:absolute; z-index:100;"value="" type="text" placeholder="请输入手机">
                        <p style="float: right; overflow: visible"  id="telspan"> </p>
                    </div>
                    <div class="input_outer">
                        <span class="us_uer" ></span>
                        <input id="emailinput" name="email" class="text" onblur="TestEmail()" style="color: #000000 !important; position:absolute; z-index:100;"value="" type="text" placeholder="请输入邮箱">
                        <p style="float: right; overflow: visible" id="emailspan"> </p>
                    </div>
                    <div class="input_outer">
                        <span class="us_uer" ></span>
                        <input id="addressinput" onblur="TestAddress()" name="address" class="text" style="color: #000000 !important; position:absolute; z-index:100;"value="" type="text" placeholder="请输入地址">
                        <p style="float: right; overflow: visible" id="addressspan"> </p>
                    </div>
                    <div id="SUBMIT" class="mb2"><a class="act-but submit"   onclick="return Testall()" style="color: #FFFFFF">提交</a></div>
                </form>

            </div>
        </div>
    </div>
</div><!-- /container -->
<script src="${pageContext.request.contextPath}/login/js/TweenLite.min.js"></script>
<script src="${pageContext.request.contextPath}/login/js/EasePack.min.js"></script>
<script src="${pageContext.request.contextPath}/login/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/login/js/rAF.js"></script>
<script src="${pageContext.request.contextPath}/login/js/demo-1.js"></script>
<script src="${pageContext.request.contextPath}/login/js/vendor/jgrowl/jquery.jgrowl.min.js"></script>
<script src="${pageContext.request.contextPath}/login/js/Longin.js"></script>
<div style="text-align:center;">
</div>
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
        var input = $.trim($("#usernameinput").val());
        var motoinput = $("#usernameinput").val();
        if(motoinput!=input){
            $("#usernamespan").css({"color":"red"});
            $("#usernamespan").text("  非法输入");
            return false
        }
        if(input==""){ //输入不能为空

            $("#usernamespan").css({"color":"red"});
            $("#usernamespan").text("  非法输入");
            return false;
        }
        else{
            $("#usernamespan").css({"color":"green"})
            $("#usernamespan").text("  正确");
            // alert("通过！");
            return true;
        }
    }
    function TestAddress() {
        var input = $.trim($("#addressinput").val());
        var motoinput = $("#addressinput").val();
        if(motoinput!=input){
            $("#addressspan").css({"color":"red"});
            $("#addressspan").text("  非法输入");
            return false
        }
        if(input==""){ //输入不能为空

            $("#addressspan").css({"color":"red"});
            $("#addressspan").text("  非法输入");
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
            alert("非法输入!");
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
    function Testuser() {
        var input = $.trim($("#ID").val());
        var motoinput = $("#ID").val();
        if(motoinput!=input){
            $("#userspan").css({"color":"red"});
            $("#userspan").text("错误");
            return false
        }
        if(input==""){ //输入不能为空

            $("#userspan").css({"color":"red"});
            $("#userspan").text("错误");
            return false;
        }
        else{
            $("#userspan").css({"color":"green"})
            $("#userspan").text("  正确");
            // alert("通过！");
            return true;
        }
    }
    function Testpas() {
        var input = $.trim($("#PASSWORD").val());
        var motoinput = $("#PASSWORD").val();
        if(motoinput!=input){
            $("#passspan").css({"color":"red"});
            $("#passspan").text("  非法输入");
            return false
        }
        if(input==""){ //输入不能为空

            $("#passspan").css({"color":"red"});
            $("#passspan").text("  非法输入");
            return false;
        }
        else{
            $("#passspan").css({"color":"green"})
            $("#passspan").text("  正确");
            // alert("通过！");
            return true;
        }
    }
    function Testall() {
        if(TestEmail() && TestAddress() &&TestTelephone()  && Testuser() && Testpas()){
            alert("yes,可以提交到后台");
            $("#myform").submit();
        }


        else
            alert("no，请重新修改");
    }
</script>
</body>
</html>