<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="LazyEating.UI.Web.Admin.OrderList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
<link href="Style/TableStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">

    <asp:Label ID="Message" ForeColor="Red" runat="server"/>
    <asp:ListView ID="lvwOrders" runat="server" 
        DataKeyNames="OrderID" DataKeys="OrderID" >

        <LayoutTemplate>
          <table runat="server" id="tblListView" class="tblListView"
             border="0" cellpadding="1" cellspacing="1">
            <tr id="Tr1" runat="server">
                <th id="Th1" runat="server">订单号</th>
                <th>客户ID</th>
                <th>客户姓名</th>
                <th>下单时间</th>
                <th>订单总额</th>
                <th>状态</th>
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
                <td><%# Eval("OrderID")%></td>
                <td><%# Eval("UserID")%></td>
                <td><%# Eval("RealName")%></td>
                <td><%# Eval("DateCreate")%></td>
                <td><%# Eval("Totle")%></td>
                <td><%# Eval("OrderState").ToString()%></td>
                <td>
                    <a href="OrderDetail.aspx?orderID=<%# Eval("OrderID") %>"  target="main">详细</a>
                </td>
            </tr>
        </ItemTemplate>
    </asp:ListView>

    <div class="clear"></div>

    <div class="dataPager">
        <asp:DataPager runat="server" ID="lvwOrderDataPager"
            PagedControlID="lvwOrders" PageSize="10">
            <Fields>
            <asp:NextPreviousPagerField ButtonType="Image"
                ShowFirstPageButton="true"
                ShowNextPageButton="false"
                ShowPreviousPageButton="true" />
            <asp:NumericPagerField ButtonCount="10" />
            <asp:NextPreviousPagerField ButtonType="Image"
                ShowLastPageButton="true"
                ShowNextPageButton="true"
                ShowPreviousPageButton="false" />
            </Fields>
        </asp:DataPager>
    </div>
</form>
</body>
</html>
