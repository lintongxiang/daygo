<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>订单列表</title>
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

   <h5><span>我的订单</span></h5>
       <div class="blank"></div>
       <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
          <tr align="center">
            <td bgcolor="#ffffff">订单号</td>
            <td bgcolor="#ffffff">下单时间</td>
            <td bgcolor="#ffffff">订单总金额</td>
            <td bgcolor="#ffffff">订单状态</td>
            <td bgcolor="#ffffff">操作</td>
          </tr>
          <c:forEach items="${list }" var="li">
                    <tr>
            <td align="center" bgcolor="#ffffff"><a href="UserCenter.html?action=orderdetail&o_id=${li.o_id }" class="f6">${li.o_id }</a></td>
            <td align="center" bgcolor="#ffffff">${li.o_time }</td>
            <td align="right" bgcolor="#ffffff">${li.o_totalprice }元</td>
            <td align="center" bgcolor="#ffffff">
            <c:choose>
            	<c:when test="${li.o_status==1}">未付款</c:when>
            	<c:when test="${li.o_status==2 }">已付款</c:when>
            	<c:when test="${li.o_status==3 }">已收货</c:when>
            	<c:when test="${li.o_status==4 }">已取消</c:when>
            </c:choose>
            </td>
            <c:choose>
            	<c:when test="${li.o_status==1}">
            	<td align="center" bgcolor="#ffffff">
            	<font class="f6"><a href="Pay.html?action=orderpay&id=${li.o_id }" onclick="if (!confirm('您确认要付款吗?')) return false;" target="_blank">付款</a></font>&nbsp;&nbsp;
            	<font class="f6"><a href="UserCenter.html?action=deleteorder&o_id=${li.o_id }" onclick="if (!confirm('您确认要取消该订单吗？取消后此订单将视为无效订单')) return false;">取消订单</a></font>
            	</td>
            	</c:when>
            	<c:when test="${li.o_status==2 }">
            	<td align="center" bgcolor="#ffffff"><font class="f6"><a href="UserCenter.html?action=take&o_id=${li.o_id }" onclick="if (!confirm('您确认要收货吗?')) return false;">确认收货</a></font></td>
            	</c:when>
            	<c:when test="${li.o_status==3 }">
            	<%-- <td align="center" bgcolor="#ffffff"><font class="f6"><a href="UserCenter.html?action=deleteorder&o_id=${li.o_id }" onclick="if (!confirm('您确认要取消该订单吗？取消后此订单将视为无效订单')) return false;">取消订单</a></font></td> --%>
            	</c:when>
            	<c:when test="${li.o_status==4 }">
            	</c:when>
            </c:choose>
          </tr>
                    </c:forEach>
                    </table>
        <div class="blank5"></div>


 <div id="pager" class="pagebar">
  <span class="f_l " style="margin-right:10px;">总计 <b>${list.size() }</b>  个记录</span>
      
      </div>
  
      </div>
     </div>
    </div>
  </div>
  
</div>
<div class="blank"></div>
<%@ include file="footer.jsp" %>
</body>
</html>

