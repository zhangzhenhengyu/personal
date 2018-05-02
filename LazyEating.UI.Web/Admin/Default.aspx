<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LazyEating.UI.Web.Admin.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<frameset rows="100,*"  frameborder="NO" border="0" framespacing="0" id="boxFrame" name="boxFrame">
    <frame src="Head.aspx" noresize="noresize" 
        frameborder="NO" name="topFrame" scrolling="no" marginwidth="0" 
        marginheight="0" target="_blank" />
    <frameset cols="190,*" id="mainFrame" name="mainFrame">
        <frame src="Menu.aspx" name="leftFrame" 
            noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" 
            scrolling="no" target="main" />
        <!--right.html-->
        <frame src="MainIndex.aspx" id="main" name="main" 
            marginwidth="0" marginheight="0" frameborder="no" 
            scrolling="auto" target="_self" />
    </frameset>
</frameset>
<noframes>
<body>

</body>
</html>
