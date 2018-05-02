<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="LazyEating.UI.Web.Register1" %>

<!DOCTYPE html>

<html>
<head>
    <title></title>
    <link href="css/head.css" rel="stylesheet" type="text/css" />
    <link href="css/Register.css" rel="stylesheet" type="text/css" />
</head>
<body style=" width:997px; margin:0px auto; height: 958px;">
<div class="header">
    <div class="logo"><a href="Default.aspx"><img src="Css/images/index_logo390_78.png" alt="" /></a></div>
     <div class="loginUser">
	</div>
	<div class="nav">
    	<div class="check"><a href="Foods.aspx">浏览菜单</a></div>
        <div class="check"><a href="#">开始订餐</a></div>
	</div>
</div>	

<div id="main">
    
<script type="text/javascript" language="javascript">
    function $$(id) {
        return document.getElementById(id);
    }
    function setErrorInfo() {
        var Pass1 = $$("txtPassword");
        var Pass2 = $$("txtPassword2");
        if (Pass1.value == Pass2.value) {
            Pass2.setCustomValidity("")
            return false;
            /*$$("tishi").innerHTML="<font color='green'>两次密码相同</font>";
            $$("submit").disabled=false;*/
        }
        else {
            Pass2.setCustomValidity("两次密码不同！")
            return true;
            /*$$("tishi").innerHTML="<font color='red'>两次密码不相同</font>";
            $$("submit").disabled=true;*/
        }
    }
</script>
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
        var txt = $$("txtCode");
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
	<div class="main">
		<h1>注册</h1><br/>		
		<div class="stept"><span>1.注册信息</span>2.激活账户3.提交地址信息</div><br/>
		<div class="content">
			
			<div class="content_left">
				<form method="post" runat="server">
                <table>
                    <tr>
                        <td colspan="3"><h4 style=" text-align:left">请提供您的详细信息</h4></td>
                    </tr>
                    <tr>
                        <td class="td1">真实姓名：</td>
                        <td colspan="2" class="td23">
                            <input id="txtRealName" name="txtRealName" type="text" runat="server" required />
                            <asp:RequiredFieldValidator ID="rfvRealName" runat="server" 
                                ControlToValidate="txtRealName" ErrorMessage="请输入真实姓名"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">用户昵称：</td>
                        <td colspan="2" class="td23">
                            <input id="txtUserName" name="txtUserName" type="text" runat="server" required />
                            <asp:RequiredFieldValidator ID="rfvUserName" runat="server" 
                                ControlToValidate="txtUserName" ErrorMessage="请输入昵称"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">联系电话：</td>
                        <td colspan="2" class="td23">
                            <input id="txtPhone" name="txtPhone" type="text" runat="server" required />
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                                ControlToValidate="txtPhone" ErrorMessage="请输入联系电话"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">送货地址：</td>
                        <td colspan="2" class="td23">
                            <textarea id="txtAddress" name="txtAddress" rows="3" cols="22" runat="server" required ></textarea>
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                                ControlToValidate="txtAddress" ErrorMessage="请输入送货地址"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="auto-style1"><h4 style=" text-align:left">密码中限6-16位字符</h4></td>
                    </tr>
                    <tr>
                        <td class="td1">密码：</td>
                        <td colspan="2" class="td23">
                            <input id="txtPassword" name="txtPassword" type="password" pattern ="^[a-zA-Z]\w{5,7}$" maxlength="16" runat="server" required />
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                ControlToValidate="txtPassword" ErrorMessage="请输入密码"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">确认密码：</td>
                        <td colspan="2" class="td23">
                            <input id="txtPassword2" name="txtPassword2" type="Password" onKeyUp="setErrorInfo()" runat="server" required />
                            <asp:RequiredFieldValidator ID="rfvPassword2" runat="server" 
                                ControlToValidate="txtPassword2" ErrorMessage="请输入密码"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">验证码：</td>
                        <td  class="td2">
                            <input id="txtCode" name="code" type="text" onKeyUp="CheckCookie();" required  />
                        </td>
                        <td class="td3">
                            <img id="ImgValidator" height="32px" width="72px" alt="看不清楚，点击刷新" onclick=" src = src + '?' " src="UserValidator/NumAndLetCheckCode.aspx"  />
                        </td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="Message" ForeColor="Red" runat="server"/></td>
                        <td><input id="butn" type="submit" value="注册"></td>
                        <td></td>
                    </tr>
                </table>
				</form>
			</div>
			<div class="content_right">
				<img src="images/person.bmp" alt="" />
			</div>
		</div>
	</div>




</div>
<div class="clear"></div>
<style type="text/css">
.footer{ font-size:14px; margin:10px 0px; }
.footer span{ float:right; }
.footer a{ text-decoration:none; color:#000000; }
.footer a:hover{ color:red; }
    .auto-style1 {
        height: 34px;
    }
</style>
<div class="footer">
    <a href="#">网站条款</a>&nbsp;|&nbsp;
    <a href="#">订餐须知</a>&nbsp;|&nbsp;
    <a href="#">隐私条款</a>&nbsp;|&nbsp;
    <a href="#">常见问题解答</a>
	<span>COPYRIGHT &copy; 我的餐厅版权所有</span>
</div>

</body>
</html>
