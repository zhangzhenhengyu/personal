<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Foods.aspx.cs" Inherits="LazyEating.UI.Web.Foods" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/class.css" rel="stylesheet" type="text/css" />

<style type="text/css">
.dingdan
{
    float:right;
	padding:20px 10px;
	margin-top:10px;
	width:278px;
	background-color:#ffdd00;
}
.dingdan_div
{
	padding:10px;
	border:1px red solid;
}

.dingdan_div ul li
{
	list-style:none;
	line-height:25px;
	border-bottom:1px blue solid;
}
.dingdan_div span
{
	float:right;
}
.dingdan_div ul li span
{
	float:right;
}
.countAdd
{
	border:0px;
	background-color:#666666;
	border-radius:5px;
	color:#ffffff;
}
.countAdd:hover
{
	color:#000000;
}
.btnCreateOrder
{
	border:0px;
	background-color:red;
	font-weight:bold;
	height:30px;
	border-radius:5px;
	color:#ffffff;
}
.dingdan_div ul,.dingdan_div h2
{
	padding:0;
	margin:0;
}
.name,.price {
        color:black;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
<%@ OutputCache Duration="60" VaryByParam="none" %><!--页面缓存-->
<div id="menu">
	<ul>
		<a href="Foods.aspx?id=1" target="goodFrame"><li id="goods1">主食</li></a>
		<a href="Foods.aspx?id=2" target="goodFrame"><li id="goods2">热菜系列</li></a>
		<a href="Foods.aspx?id=3" target="goodFrame"><li id="goods3">经典凉拌</li></a>
		<a href="Foods.aspx?id=4" target="goodFrame"><li id="goods4">海鲜盛宴</li></a>
		<a href="Foods.aspx?id=5" target="goodFrame"><li id="goods5">传统烧烤</li></a>
		<a href="Foods.aspx?id=6" target="goodFrame"><li id="goods6">餐后甜点</li></a>
	</ul>
</div>
<div class="goods goods<%=id %>" runat="server">
    <div id="groupaaa" runat="server"></div>
    <asp:ListView ID="lvwFoods" runat="server" 
        OnItemCommand="lvwFoods_OnItemCommand" DataKeyNames="FoodID" >
        
        <LayoutTemplate>
            <div runat="server" id="itemPlaceholder" ></div>
        </LayoutTemplate>
        <ItemTemplate>
        	<div class="pruduct" runat="server">
                <div style=" height:150px;" runat="server">
		        <img src="<%# Eval("PicUrl")%>" width="223" height="150" border="0" alt="">
                </div>
		        <div class="goods_text" runat="server">
			        <div class="name" runat="server"><%# Eval("FoodName")%></div>
			        <div class="price" runat="server">￥<%# Eval("Price")%></div>
                    <asp:LinkButton runat="server" CssClass="butnAdd"
                        ID="btnAddToCart" 
                        Text="加入订单"
                        Color="white"
                        CommandName="AddToList" 
                        CommandArgument="aaa" />
		        </div>
	        </div>    
        </ItemTemplate>
    </asp:ListView>
</div>  

<div class="dingdan">
    <div id="Div1" runat="server"></div>
	<div class="dingdan_div"><h2>我的购物车</h2></div>
	<div class="dingdan_div">

    <ul>
    <asp:ListView ID="lvwCart" runat="server"
        OnItemCommand="lvwCart_OnItemCommand" DataKeyNames="FoodID" DataKeys="FoodID">

        <LayoutTemplate>
            <div runat="server" id="itemPlaceholder" ></div>
        </LayoutTemplate>
        
<%--        <GroupTemplate>
          <div runat="server" id="groupPlaceholder"></div>
        </GroupTemplate> --%>

        <ItemTemplate>
			<li>
			<p><%# Eval("FoodName")%></p>
			     ￥<%# Eval("UnitPrice")%><span><asp:LinkButton ID="LinkButton1" runat="server"  Text="-" CssClass="butnAdd"
                    CommandName="CountSub" CommandArgument="bbb" />
                 &nbsp;<%# Eval("Count")%>&nbsp;
                 <asp:LinkButton ID="LinkButton2" runat="server" Text="+"  CssClass="butnAdd"
                    CommandName="CountAdd" CommandArgument="ddd" /> 
            </span>
			<div class="clear"></div>
			</li>
        </ItemTemplate>
    </asp:ListView>
    </ul>
	</div>
	<div class="dingdan_div">
		小计<span>￥<%=CartTotle %></span><br/>
		外送费<span>￥0.00</span><br/>
	</div>
    <div class="dingdan_div" >
        <asp:Button ID="btnCreatOrder" runat="server" Text="立即下单" 
            CssClass="btnCreateOrder" onclick="btnCreatOrder_Click" />
        <span>总计<span style="color:#f00;">￥<%=CartTotle %></span></span>
    </div>

</div>

</asp:Content>
