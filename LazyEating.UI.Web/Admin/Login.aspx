<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LazyEating.UI.Web.Admin.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="Style/LoginStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" >
    function $$(id) {
        return document.getElementById(id);
    }
    //读取cookies
    function getCookie(name) {
        var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        if (arr = document.cookie.match(reg))
            return unescape(arr[2]);
        else
            return null;
    }
    function CheckCookie() {
        var txt = $$("adminCode");
        if (txt.value.toUpperCase() == getCookie("CheckCode")) {
            txt.setCustomValidity("")
            return false;
        }
        else {
            txt.setCustomValidity("验证码输入错误！")
            return true;
        }
    }
</script>
</head>
<body>
<div class="head">
	<div class="adminLogo"><img src="Style/images/logoAdmin.png" alt="" style="width: 208px; height: 48px; margin-top: 0px"/></div>
    <div class="clear"></div>
</div>
<div class="loginDiv">
	<div class="loginTitle white16"><p>后台管理系统登录</p></div>
    <form method="post">
    <table class="loginMain">
    	<tr height="50px">
        	<td width="90px">用户名：</td>
        	<td colspan="2"><input id="adminName" name="adminName" type="text" class="txt" required /></td>
        </tr>
    	<tr height="50px">
        	<td>密&nbsp;&nbsp;&nbsp;码：</td>
        	<td colspan="2"><input id="adminPassword" name="adminPassword" type="password" class="txt" required /></td>
        </tr>
    	<tr height="50px">
        	<td>验证码：</td>
        	<td width="90px"><input id="adminCode" name="adminCode" type="text" class="txt" onkeyup="CheckCookie();" required  /></td>
            <td><img id="ImgValidator" alt="看不清楚，点击刷新" onclick=" src = src + '?' " src="../UserValidator/NumAndLetCheckCode.aspx"  /></td>
        </tr>
    	<tr>
        	<td colspan="2"><span id="lblInformation" style=" color:Red; font-size:12px;" runat="server"></span></td>
            <td><input id="adminButton" type="submit" value="" /></td>
        </tr>
    </table>
    </form>
</div>

</body>
</html>
