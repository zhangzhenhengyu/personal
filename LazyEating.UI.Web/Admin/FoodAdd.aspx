<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FoodAdd.aspx.cs" Inherits="LazyEating.UI.Web.Admin.FoodAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="Style/TableStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    //图片上传预览    IE是用了滤镜。
    function previewImage(file) {
        var MAXWIDTH = 260;
        var MAXHEIGHT = 180;
        var div = document.getElementById('preview');
        if (file.files && file.files[0]) {
            div.style.display = "block";
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.onload = function () {
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width = rect.width;
                img.height = rect.height;
                //img.style.marginLeft = rect.left+'px';
                img.style.marginTop = rect.top + 'px';
            }
            var reader = new FileReader();
            reader.onload = function (evt) { img.src = evt.target.result; }
            reader.readAsDataURL(file.files[0]);
        }
        else //兼容IE
        {
            var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
            div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
        }
    }
    function clacImgZoomParam(maxWidth, maxHeight, width, height) {
        var param = { top: 0, left: 0, width: width, height: height };
        if (width > maxWidth || height > maxHeight) {
            rateWidth = width / maxWidth;
            rateHeight = height / maxHeight;

            if (rateWidth > rateHeight) {
                param.width = maxWidth;
                param.height = Math.round(height / rateWidth);
            } else {
                param.width = Math.round(width / rateHeight);
                param.height = maxHeight;
            }
        }

        param.left = Math.round((maxWidth - param.width) / 2);
        param.top = Math.round((maxHeight - param.height) / 2);
        return param;
    }
</script> 
<style type="text/css">
    #preview { overflow:hidden; display:none;}
    #imghead { filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);}
</style>
</head>
<body>
<form id="formAddFood" name="formAddFood" runat="server" method="post">
<table class="tblDetail" border="0"  cellpadding="0" cellspacing="0">
    <tr>
        <th>菜品类别：</th>
        <td>
            <asp:DropDownList ID="ddlFoodType" runat="server" CssClass="ddlInput">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <th>菜单名：</th>
        <td>
            <input id="txtFoodName" name="txtFoodName" type="text" class="inputText" runat="server" />
        </td>
    </tr>
    <tr>
        <th>单价：</th>
        <td>
            <input id="txtPrice" name="txtPrice" type="text" class="inputText" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
    </tr>
    <tr>
        <th>图片：</th>
        <td>
            <div><input id="fileImg" name="fileImg" onchange="previewImage(this)" type="file" runat="server" /></div>
            <div id="preview">
                <img id="imghead" width="100" height="100" border="0" src="" alt="" runat="server"/>
            </div> 
        </td>
    </tr>
    <tr>
        <th>描述：</th>
        <td>
            <textarea id="txtDescribe" name="txtDescribe" rows="5" cols="40" ></textarea>
        </td>
    </tr>
    <tr>
        <th></th>
        <td>
            <input type="submit" value="添加" />
        </td>
    </tr>
</table>
</form>
</body>
</html>
