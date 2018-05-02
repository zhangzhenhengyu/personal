<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Head.aspx.cs" Inherits="LazyEating.UI.Web.Admin.Head" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style type="text/css">
.head{ height:60px; margin:0px; padding:20px 0; width:100%; background:#30323A;}
.head .adminLogo{ float:left;  margin-left: 40px;}
.head .adminUser{ float:right; margin-right:30px;}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="head">
	        <div class="adminLogo"><img src="Style/images/logoAdmin.png" alt=""/></div>
            <div class="adminUser">
                <em id="lblAdminName" class="white14" runat="server"></em>
                <a href="../Default.aspx" target="_blank">首页</a>
            </div>
            <div class="clear"></div>
        </div>
    </form>
</body>
</html>
