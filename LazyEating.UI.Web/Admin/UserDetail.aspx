<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDetail.aspx.cs" Inherits="LazyEating.UI.Web.Admin.UserDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="Style/TableStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="Form1" runat="server">
<div class="divTblDetail" >
    <table class="tblDetail" border="0"  cellpadding="0" cellspacing="0">
        <tr>
            <th class="td1">用户类型：</th>
            <td class="td2">
                <%=user.UserType.UserTypeName %>
            </td>
        </tr>
        <tr>
            <th class="td1">昵称：</th>
            <td class="td2">
                <%=user.UserName %>
            </td>
        </tr>
        <tr>
            <th class="td1">真实姓名：</th>
            <td class="td2">
                <%=user.RealName %>
            </td>
        </tr>
        <tr>
            <th class="td1">性别：</th>
            <td class="td2">
                <%=user.Sex %>
            </td>
        </tr>
        <tr>
            <th class="td1">电话：</th>
            <td class="td2">
                <%=user.Phone %>
            </td>
        </tr>
        <tr>
            <th class="td1">详细地址：</th>
            <td class="td2">
                <%=user.Addess %>
            </td>
        </tr>
    </table>
</div>


</form>
</body>
</html>
