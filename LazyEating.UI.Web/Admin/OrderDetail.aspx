<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderDetail.aspx.cs" Inherits="LazyEating.UI.Web.Admin.OrderDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="Style/TableStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
<div class="OrderDetail">
    <div class="OrderDetailTitle" ><h3>订单详细<span>(<%=order.OrderStateString %>)</span></h3></div>
	<div class="BasicInformation">
        <h3>收货人信息</h3>
        <p>收 货 人：<%=order.RealName %></p>
        <p>地    址：<%=order.Address %></p>
        <p>手机号码：<%=order.Phone %></p>
    </div>
    <div class="BasicInformation">
        <h3>支付及配送方式</h3>
        <p>支付方式：在线支付</p>
        <p>运    费：￥10.00</p>
        <p>送货日期：工作日、双休日与假日均可送货</p>
    </div>

    <div class="GoodsDetail">   
        <asp:ListView ID="lvwGoodsDetail" runat="server" 
            DataKeyNames="OrderID" DataKeys="OrderID" >

            <LayoutTemplate>
              <table border="0" cellpadding="1" cellspacing="1">
                <tr>
                    <th>商品编号</th>
                    <th>商品名称</th>
                    <th width="200px">图片</th>
                    <th>单价</th>
                    <th>数量</th>
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
            	    <td><%# Eval("FoodID") %></td>
            	    <td><%# Eval("Food.FoodName") %></td>
            	    <td><img alt="" src="<%# Eval("Food.PicUrl") %>" /></td>
            	    <td>￥ <%# Eval("UnitPrice")%></td>
            	    <td><%# Eval("Quatity")%></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>

        <asp:Label ID="Message" ForeColor="Red" runat="server"/>
    <div class="OrderTotal">
    	<div>
        	<p>商品总额：￥<%=order.Totle %></p>
        	<p>运费：￥10.00</p>
        </div>
        <h3>总计：<span>￥<%=order.Totle+10 %></span></h3>
    </div>
</div>
</form>
</body>
</html>
