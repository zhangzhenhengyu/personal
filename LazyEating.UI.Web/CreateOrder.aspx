<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="CreateOrder.aspx.cs" Inherits="LazyEating.UI.Web.CreateOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
<link href="Css/Order.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/JavaScript">
    //改变图片大小
    function resizepic(thispic) {
        if (thispic.height > 80) thispic.height = 80;
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">

<div class="clear"></div>

<div style="width:1000px; margin:0 auto;">  
  <div id="contenter">
    <h1>复核并确认订单信息</h1>	
	<div class="content">

    <!-------------------------------------------------------------->
    <div class="OrderDetail">
	    <div class="BasicInformation">
            <h3>收货人信息</h3>
            <p>真实姓名：<asp:TextBox ID="txtRealName" CssClass="inputTxt" runat="server"></asp:TextBox></p>
            <p>联系电话：<asp:TextBox ID="txtPhone" CssClass="inputTxt" runat="server"></asp:TextBox></p>
            <p>送货地址：<asp:TextBox ID="txtAddress" CssClass="inputTxt" runat="server" Width="400px"></asp:TextBox></p>
        </div>
        <div class="BasicInformation">
            <h3>支付及配送方式</h3>
            <p>支付方式：在线支付</p>
            <p>运    费：￥0.00</p>
            <p>送货日期：工作日、双休日与假日均可送货</p>
        </div>
    <!-------------------------------------------------------------------------->
        <div class="GoodsDetail">
            <asp:Label ID="Message" ForeColor="Red" runat="server"/>
            <asp:ListView ID="lvwCarts" runat="server" 
                DataKeyNames="FoodID" DataKeys="FoodID"
                OnItemCommand="lvwCarts_OnItemCommand" >

                <LayoutTemplate>
                  <table border=0 cellpadding=1 cellspacing=1>
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
            	        <td><%#Eval("FoodID") %></td>
            	        <td><%#Eval("Food.FoodName") %></td>
            	        <td><img alt="" src="<%#Eval("Food.PicUrl") %>" onload="javascript:resizepic(this)" /></td>
            	        <td>￥ <%#Eval("UnitPrice")%></td>
            	        <td>
                             <asp:LinkButton ID="LinkButton1" runat="server"  Text="-" CssClass="butnAdd"
                                CommandName="CountSub" CommandArgument="bbb" />
                             &nbsp;<%# Eval("Count")%>&nbsp;
                             <asp:LinkButton ID="LinkButton2" runat="server" Text="+"  CssClass="butnAdd"
                                CommandName="CountAdd" CommandArgument="ddd" />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <!-------------------------------------------------------------------------->
        <div class="OrderTotal">
    	    <div>
        	    <p>商品总额：￥<%=loginUser.GetCartTotle %></p>
        	    <p>运费：￥0.00</p>
            </div>
            <h3>总计：<span>￥<%=loginUser.GetCartTotle %></span></h3>
            <asp:Button ID="btnCreateOrder" runat="server" Text="立即下单" CssClass="btnPay"  
                style="float:right;" onclick="btnCreateOrder_Click"/>
        </div>
        <div class="clear"></div>
        <div />	
        <!------------------------------------------------------------->
      </div>
    </div>
</div>
</div>

</asp:Content>
