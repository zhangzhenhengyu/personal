<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebLogin.aspx.cs" Inherits="LazyEating.UI.Web.WebLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
    *{margin: 0;padding: 0;}
    a{color: black;text-decoration: none;font-size: 14px;}
    a:hover{text-decoration: underline}
    #href{float: right;margin-right: 20px;}
    #bg{background:rgba(0,0,0,0.5);/*背景颜色半透明opacity:0.5*/
    width:100%;height: 100%;position: fixed;left: 0;top: 0;display: none}
    #login{width: 600px;height: 350px;background: white;position: fixed;display: none}
    #login #title{color: white;background: #ff9933;width: 100%;height: 50px;line-height: 50px;font-size: 24px;}
    #login #title .close{font-size: 24px;color: white;float: right;margin-right: 15px;text-decoration: none}
    #login p{margin-top: 35px;margin-left: 120px;}
    #login form p input{width:260px;height:35px;border:1px solid #dddddd;font-size: 18px;}
    #login form p .text,.psw{background: rgba(250,255,189,1);}
    #login form p .sub{margin-left: 65px;background-color:lawngreen}
</style>
</head>
<body>
    <div id="href"><a class="dl" href="javascript:">登录</a>&nbsp;<a href="javascript:">注册</a></div><!--作为按钮,用js禁止，使点击不跳转也不刷新-->
<div id="bg">
<div id="login">
<div id="title" style="text-align:center" >用户登录<a class="close" href="javascript:">×</a></div>
<form action="javascript:" target="" runat="server">
<p>用户名：<input id="uname" name="user" type="text" class="text" maxlength="26" /></p>
<p>密&nbsp;&nbsp;&nbsp;码：<input id="upass" name="pwd" type="password" class="psw" maxlength="16"/></p>
<p><input type="submit" class="sub" value="登 陆" runat="server" onclick="fnLogin()"/></p>
</form>
</div>
</div>
<script src="Scripts/jquery-3.2.1.js"></script>
<script>
    playauto();//playauto()函数控制弹出框居中显示
    function playauto() {
        var _width = $(window).width();//获取浏览器窗口宽度
        var _height = $(window).height();//获取高度
        $(" #login").css({ left: _width / 2 - 300, top: _height / 2 - 175 });//使弹出框居中
    }
    function fnLogin() {
        var oUname = document.getElementById("uname")
        var oUpass = document.getElementById("upass")
        if (LazyEating.Repository.UserRepository.CheckLogin(oUname.value, oUpass.value, 1)) {
            //Session["adminName"] = adminName;
            window.alert(oUname.value)
        }
        
    }
    //动态改变浏览器窗口时执行
    $(window).resize(function () {
        playauto();//浏览器窗口大小改变，则重新执行playauto()函数，使弹出框居中
    });
    $(".dl").click(function () {//点击超链接按钮显示bg、login样式
        playauto();//再次点击登陆按钮时，弹出框仍然处于居中位置
        $("#bg").show();
        $("#login").show();
    })
    $(".close").click(function () {//点击弹出框上的X按钮隐藏bg、login样式，即关闭弹出框
        $("#bg").hide();
        $("#login").hide();
    });
    $("#login").mousedown(function (e) {
        var x = e.clientX;//鼠标按下的X坐标
        var y = e.clientY;//鼠标按下的Y坐标
        var left = left = ("#login").offset().left;//登陆框距离左边位置
        var top = top = ("#login").offset().top;//登陆框距离顶部位置
        var l = x - $left;//点击的坐标点距离弹出框左边的距离
        var t = y - $top;//点击的坐标点距离弹出框上边的距离
        $(document).mousemove(function (e) {
            var nx = e.clientX;
            var ny = e.clientY;
            var n_left = nx - l;//动态得到弹出框距离浏览器左边距离
            var n_top = ny - t;//动态得到弹出框距离浏览器上边距离
            $(" #login").css({ left: n_left, top: n_top });
        });
        $(document).mouseup(function () {
            $(document).unbind("mousemove");//解除鼠标移动事件
            $(document).unbind("mouseup");
        })
    })
</script>
</body>
</html>
