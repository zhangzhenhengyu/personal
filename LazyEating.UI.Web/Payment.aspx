<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="LazyEating.UI.Web.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
<link href="Css/Order.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
<div style="width:1000px; margin:0 auto;">
    <div id="contenter">
        <h1>模拟支付平台</h1>	
        <div class="content">            
        	<h3>订单编号：<%=order.OrderID %>  应支付：￥<%=order.Totle %></h3>
        	<div class="payment">
            	<h2>单击确认支付，则模拟支付成功！</h2>
            	<div><asp:Button ID="btnPayment" runat="server" Text="确认支付" CssClass="btnPay" 
                        onclick="btnPayment_Click" /></div>
                <p><asp:Label ID="Message" ForeColor="Red" runat="server"/></p>
            </div>

        </div>
    </div>
</div>
</asp:Content>
