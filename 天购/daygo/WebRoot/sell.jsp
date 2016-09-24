<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="{$keywords}" />
<meta name="Description" content="{$description}" />
<title>卖商品</title>
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="animated_favicon.gif" type="image/gif" />
<link href="css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/user.js"></script>
<script type="text/javascript" src="js/transport.js"></script>
</head>
<body>

<%@ include file="header.jsp" %>
  
  <div class="block box">
<div class="blank"></div>
 <div id="ur_here">
当前位置: <a href=".">首页</a> <code>&gt;</code> 用户中心 
</div>
</div>
<div class="blank"></div>

<div class="block clearfix">

  <div class="AreaL">
    <div class="box">
     <div class="box_1">
      <div class="userCenterBox">
       <div class="userMenu">
<a href="UserCenter.html" class="curs"><img src="css/images/u1.gif"/> 欢迎页</a>
<a href="UserCenter.html?action=info"><img src="css/images/u2.gif"/> 用户信息</a>
<a href="UserCenter.html?action=order"><img src="css/images/u3.gif"/> 我的订单</a>
<a href="UserCenter.html?action=address"><img src="css/images/u4.gif"/> 收货地址</a>
<a href="UserCenter.html?action=comment"><img src="css/images/u11.gif"/> 我的评论</a>
<a href="Sell.html"><img src="css/images/u10.gif"/> 卖商品</a>
<a href="Logout.html" style="background:none; text-align:right; margin-right:10px;"><img src="css/images/bnt_sign.gif"/></a>
</div>
      </div>
     </div>
    </div>
  </div>

  <div class="AreaR">
    <div class="box">
     <div class="box_1">
      <div class="userCenterBox boxCenterList clearfix" style="_height:1%;">

          
          <form action="AddGoods.html" enctype="multipart/form-data" method="post">
          <h5><span>商品详情</span></h5>
          <div class="blank"></div>
          <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
                <tr>
                  <td width="28%" align="right" bgcolor="#FFFFFF">商品名称： </td>
                  <td width="72%" align="left" bgcolor="#FFFFFF"> <input type="text" name="name" class="inputBg"/></td>
                  </tr>
                <tr>
                  <td width="28%" align="right" bgcolor="#FFFFFF">分类：</td>
                  <td width="72%" align="left" bgcolor="#FFFFFF">
                  <input type="text" name="category" class="inputBg"/>
                  </td>
                </tr>
                <tr>
                  <td width="28%" align="right" bgcolor="#FFFFFF">尺寸： </td>
                  <td width="72%" align="left" bgcolor="#FFFFFF"><input name="size" type="text"  class="inputBg" /><span style="color:#FF0000"> 用；隔开</span></td>
                </tr>
        		  <tr>
           <td width="28%" align="right" bgcolor="#FFFFFF" id="extend_field2i">库存：</td>
            <td width="72%" align="left" bgcolor="#FFFFFF">
            <input name="number" type="text" class="inputBg" value=""/>       </td>
        </tr>               
        		                <tr>
           <td width="28%" align="right" bgcolor="#FFFFFF" id="extend_field5i">价格：</td>
            <td width="72%" align="left" bgcolor="#FFFFFF">
            <input name="price" type="text" class="inputBg" value=""/>           </td>
        </tr>
        		                <tr>
          <td width="28%" align="right" bgcolor="#FFFFFF">图片：</td>
          <td width="72%" align="left" bgcolor="#FFFFFF"><input type="file" name="picture" class="inputBg"/><span style="color:#FF0000"> 500*500为佳</span>
          </td>
        </tr>
        <tr>
       <td width="28%" align="right" bgcolor="#FFFFFF" id="passwd_quesetion">商品详情图片：</td>
          <td width="72%" align="left" bgcolor="#FFFFFF">
          <input type="file" name="describe" class="inputBg"/><span style="color:#FF0000"> 宽750为佳</span>
          </td>
        </tr>
        		                <tr>
                  <td colspan="2" align="center" bgcolor="#FFFFFF"><input name="act" type="hidden" value="act_edit_profile" />
                    <input name="submit" type="submit" value="确认修改" class="bnt_blue_1" style="border:none;" />
                  </td>
                </tr>
       </table>
          
          
          </form>
          
          
          
		</div>
	   </div>
	  </div>
	</div>
</div>
<c:if test="${addgood == true}"><script type="text/javascript">alert("添加商品成功！")</script></c:if>
<div class="blank"></div>
<%@ include file="footer.jsp" %>
</body>
</html>

