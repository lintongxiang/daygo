<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="{$keywords}" />
<meta name="Description" content="{$description}" />
<title>用户中心</title>
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
<a href="UserCenter.html?action=order_list"><img src="css/images/u3.gif"/> 我的订单</a>
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

          <font class="f5"><b class="f4_b" style="font-size: 33px;font-style: italic;">${user.u_name}</b> 欢迎您回到 天购商城！</font><br />
          <div class="blank"></div>
          您的上一次登录时间: ${user.u_lasttime} <br />
      &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp上一次登录ip:&nbsp ${user.u_lastip }<br />
          <div class="blank5"></div>
          <div class="blank"></div>
		</div>
	   </div>
	  </div>
	</div>
</div>
<div class="blank"></div>
<%@ include file="footer.jsp" %>
</body>
</html>