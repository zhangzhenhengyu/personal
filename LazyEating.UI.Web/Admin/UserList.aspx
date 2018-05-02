<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="LazyEating.UI.Web.Admin.UserList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="Style/TableStyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<form id="form1" runat="server">
    <asp:Label ID="Message" ForeColor="Red" runat="server"/>

    <asp:ListView ID="lvUser" runat="server" 
        DataKeyNames="UserID"
        DataKeys="UserID"
        OnItemDeleting="lvUser_OnItemDeleting" >

        <LayoutTemplate>
          <table width="640px" runat="server" id="tblProducts" class="tblListView">
            <tr id="Tr1" runat="server">
                <th id="Th1" runat="server">用户类别</th>
                <th>用户ID</th>
                <th>昵称</th>
                <th>性别</th>
                <th>地址</th>
                <th>真实姓名</th>
                <th>联系方式</th>
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
                <td><%# Eval("UserType.UserTypeName")%></td>
                <td><%# Eval("UserID")%></td>
                <td><%# Eval("UserName")%></td>
                <td><%# Eval("Sex")%></td>
                <td><%# Eval("Addess")%></td>
                <td><%# Eval("RealName")%></td>
                <td><%# Eval("Phone")%></td>
                <td>
                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"
                    Text="删除" OnClientClick="return confirm('Are you sure?');" />
                    <a href="UserDetail.aspx?userID=<%# Eval("UserID") %>">详细</a>
                </td>
            </tr>
        </ItemTemplate>

    </asp:ListView>

    <div class="dataPager">
    <asp:DataPager runat="server" ID="lvUserDataPager"
        PagedControlID="lvUser" PageSize="10">
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
