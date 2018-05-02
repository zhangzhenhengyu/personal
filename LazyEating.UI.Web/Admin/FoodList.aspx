<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FoodList.aspx.cs" Inherits="LazyEating.UI.Web.Admin.FoodList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="Style/TableStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>

<form id="form1" runat="server">

    <asp:Label ID="Message" ForeColor="Red" runat="server"/>
    <asp:ListView ID="lvFood" runat="server" 
        DataKeyNames="FoodID" DataKeys="FoodID"
        OnItemDeleting="lvFood_OnItemDeleting" >

        <LayoutTemplate>
          <table runat="server" id="tblListView" class="tblListView"
             border="0" cellpadding="1" cellspacing="1" >
            <tr id="Tr1" runat="server">
                <th id="Th1" runat="server">菜系类别</th>
                <th>菜单ID</th>
                <th>菜单名</th>
                <th>单价</th>
                <th>销量</th>
                <th>上市时间</th>
                <th>操作</th>
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
                <td><%# Eval("FoodType.FoodTypeName")%></td>
                <td><%# Eval("FoodID")%></td>
                <td><%# Eval("FoodName")%></td>
                <td><%# Eval("Price")%></td>
                <td><%# Eval("SalesVolume")%></td>
                <td><%# Eval("AddDate")%></td>
                <td>
                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"
                    Text="删除" OnClientClick="return confirm('是否要删除?');" />
                    <a href="FoodDetail.aspx?foodID=<%# Eval("FoodID") %>" target="main">详细</a>
                    <a href="FoodEdit.aspx?foodID=<%# Eval("FoodID") %>" target="main">编辑</a>
                </td>
            </tr>
        </ItemTemplate>
    </asp:ListView>

    <div class="clear"></div>

    <div class="dataPager">
        <asp:DataPager runat="server" ID="lvFoodDataPager"
            PagedControlID="lvFood" PageSize="10">
            <Fields>
            <asp:NextPreviousPagerField ButtonType="Image"
                ShowFirstPageButton="true"
                ShowNextPageButton="false"
                ShowPreviousPageButton="true"
                FirstPageImageUrl="~/images/first.gif" />
            <asp:NumericPagerField ButtonCount="10" />
            <asp:NextPreviousPagerField ButtonType="Image"
                ShowLastPageButton="true"
                ShowNextPageButton="true"
                ShowPreviousPageButton="false"
                LastPageImageUrl="~/images/last.gif" />
            </Fields>
        </asp:DataPager>
    </div>

</form>
</body>
</html>
