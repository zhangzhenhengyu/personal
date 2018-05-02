<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FoodType.aspx.cs" Inherits="LazyEating.UI.Web.Admin.FoodType" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="Style/TableStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label ID="Message" ForeColor="Red" runat="server"/>
    <asp:ListView ID="lvFoodType" runat="server" 
        DataKeyNames="FoodTypeID" DataKeys="FoodTypeID" >

        <LayoutTemplate>
          <table runat="server" id="tblListView" class="tblListView"
             border="0" cellpadding="1" cellspacing="1" >
                <tr id="Tr1" runat="server">
                    <th>菜系类别ID</th>
                    <th>菜系类别</th>
                </tr>
            <tr runat="server" id="groupPlaceholder" />
          </table>
        </LayoutTemplate>

        <GroupTemplate>
          <tr runat="server" id="ProductsRow">
            <td runat="server" id="itemPlaceholder" />
          </tr>          
        </GroupTemplate>        

        <ItemTemplate>
            <tr>
                <td><%# Eval("FoodTypeID")%></td>
                <td><%# Eval("FoodTypeName")%></td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
    </form>
</body>
</html>
