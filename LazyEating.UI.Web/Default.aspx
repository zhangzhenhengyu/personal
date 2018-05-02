<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LazyEating.UI.Web.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="server">
<link href="css/index.css" rel="stylesheet" type="text/css" />
    <link href="css/nav.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.nav.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
<div class="contenter">
<div class="main" style="margin:0px auto;">
	<%--<div class="main_top"><img src="images/index1.jpg" width="1000" height="396" border="0" alt=""></div>--%>
        <!-- 代码 开始 -->
    <div id="inner">
        <div class="hot-event">
            <div class="switch-nav">
            	<a href="#" onclick="return false;" class="prev">
                	<i class="ico i-prev"></i><span class="hide-clip">上一个</span></a>
                <a href="#" onclick="return false;" class="next">
                	<i class="ico i-next"></i><span class="hide-clip">下一个</span></a>
            </div>
            
            <div class="event-item" style="display: block;">
                <a target="_blank" href="" class="banner">
                    <img src="images/landing_1672.jpg" class="photo" style="width: 1000px; height: 396px;" alt="测试用图片" />
                </a>
            </div>
            <div class="event-item" style="display: none;">
                <a target="_blank" href="" class="banner">
                    <img src="images/landing_1673.jpg" class="photo" style="width: 1000px; height: 396px;" alt="测试用图片" />
                </a>
            </div>
            <div class="event-item" style="display: none;">
                <a target="_blank" href="" class="banner">
                    <img src="images/landing_1674.jpg" class="photo" style="width: 1000px; height: 394px;" alt="测试用图片" />
                </a>
            </div>
            <div class="event-item" style="display: none;">
                <a target="_blank" href="" class="banner">
                    <img src="images/landing_1675.jpg" class="photo" style="width: 1000px; height: 396px;" alt="测试用图片" />
                </a>
            </div>
            <div class="event-item" style="display: none;">
                <a target="_blank" href="" class="banner">
                    <img src="images/index1.jpg" class="photo" style="width: 1000px; height: 396px;" alt="测试用图片" />
                </a>
            </div>
            <div class="switch-tab">
                <a href="#" onclick="return false;" class="current">1</a>
                <a href="#" onclick="return false;">2</a>
                <a href="#" onclick="return false;">3</a>
                <a href="#" onclick="return false;">4</a>
                <a href="#" onclick="return false;">4</a>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('#inner').nav({ t: 3000, a: 1500 });
    </script>
    <!-- 代码 结束 -->
	<div class="main_botm"><img src="css/images/home1.jpg" width="246" height="160" border="0" alt=""></div>
	<div class="main_botm"><img src="css/images/home2.jpg" width="246" height="160" border="0" alt=""></div>
	<div class="main_botm"><img src="css/images/home3.jpg" width="246" height="160" border="0" alt=""></div>
	<div class="main_botm"><img src="css/images/home4.jpg" width="249" height="160" border="0" alt=""></div>			
</div>
</div>
</asp:Content>
