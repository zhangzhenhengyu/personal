<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FoodEdit.aspx.cs" Inherits="LazyEating.UI.Web.Admin.FoodEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="Style/TableStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>

<form id="Form1" method="post" runat="server">
<table class="tblDetail" border="0"  cellpadding="0" cellspacing="0">
    <tr>
        <th>菜系类别：</th>
        <td>
            <asp:DropDownList ID="ddlFoodType" runat="server" Width="150px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <th>菜单名：</th>
        <td>
            <asp:TextBox ID="txtFoodName" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <th>图片：</th>
        <td><img alt="" width="120px" height="120px" src="<%="../"+food.PicUrl %>" /></td>
    </tr>
    <tr>
        <th>价格：</th>
        <td>
            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <th>销量：</th>
        <td>
            <asp:TextBox ID="txtSalesVolume" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <th>添加日期：</th>
        <td>
            <asp:TextBox ID="txtAddData" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <th>描述：</th>
        <td>
            <asp:TextBox ID="txtDescribe" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <th></th>
        <td>
            <asp:Button ID="btnSave" runat="server" Text="保存修改" onclick="btnSave_Click" />
        </td>
    </tr>
</table>

</form>
</body>
</html>
