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
<title>我的评论</title>
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
         
           
                    <h5><span>我的评论</span></h5>
          <div class="blank"></div>
                              <div id="ECS_COMMENT"> <div class="box">
     <div class="box_1">
      <h3>(共<font class="f1">${list.size()}</font>条评论)</h3>
      <div class="boxCenterList clearfix" style="height:1%;">
      
      <c:forEach items="${list}" var="var">
   	  <c:if test="${var.u_id==u_id}">
       <ul class="comments">
           <li class="word">
      		  <font class="f2">${var.u_id}</font> <font class="f3">${var.c_time}</font><br />
       		  <img src="css/images/stars${var.c_rank}.gif" alt="" />
      		  <p>${var.c_context}</p>
			</li>
       </ul>
      </c:if>
      </c:forEach>
      </div>
      
      </div>
     </div>                     
        <div class="blank5"></div>

          


      </div>
     </div>
    </div>
  </div>

</div>
<div class="blank"></div>
<%@ include file="footer.jsp" %>
</body>
</html>

