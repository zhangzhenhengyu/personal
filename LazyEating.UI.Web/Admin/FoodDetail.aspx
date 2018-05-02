<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FoodDetail.aspx.cs" Inherits="LazyEating.UI.Web.Admin.FoodDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="Style/TableStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table class="tblDetail" border="0"  cellpadding="0" cellspacing="0">
    <tr>
        <th>菜品编号：</th>
        <td><%=food.FoodID %></td>
    </tr>
    <tr>
        <th>菜品名称：</th>
        <td><%=food.FoodName %></td>
    </tr>
    <tr>
        <th>菜系类别：</th>
        <td><%=food.FoodType.FoodTypeName %></td>
    </tr>
    <tr>
        <th>图片：</th>
        <td><img alt="" src="<%="../"+food.PicUrl %>" /></td>
    </tr>
    <tr>
        <th>销量：</th>
        <td><%=food.SalesVolume %></td>
    </tr>
    <tr>
        <th>价格：</th>
        <td><%=food.Price %></td>
    </tr>
    <tr>
        <th>上市时间：</th>
        <td><%=food.AddDate %></td>
    </tr>
    <tr>
        <th>描述：</th>
        <td><%=food.Describe %></td>
    </tr>


</table>
</body>
</html>
