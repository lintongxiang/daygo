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
<title>{$page_title}</title>
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
         
              <h5><span>订单状态</span></h5>
        <div class="blank"></div>
         <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
        <tr>
          <td width="15%" align="right" bgcolor="#ffffff">订单号：</td>
          <td align="left" bgcolor="#ffffff">${order.o_id }            				
					</td>
        </tr>
        <tr>
          <td align="right" bgcolor="#ffffff">订单状态：</td>
          <td align="left" bgcolor="#ffffff"> 
          <c:choose>
            	<c:when test="${order.o_status==1}">未付款</c:when>
            	<c:when test="${order.o_status==2 }">已付款</c:when>
            	<c:when test="${order.o_status==3 }">已收货</c:when>
            	<c:when test="${order.o_status==4 }">已取消</c:when>
            </c:choose></td>
        </tr>
        <tr>
                
              </table>
        <div class="blank"></div>
        <h5><span>商品列表</span>
                <a href="javascript:;" onclick="returnToCart(65)" class="f6">放回购物车</a>
                </h5>
        <div class="blank"></div>
         <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
          <tr>
            <th width="23%" align="center" bgcolor="#ffffff">商品名称</th>
            <th width="29%" align="center" bgcolor="#ffffff">属性</th>
            <!--<th>市场价格：</th>-->
            <th width="26%" align="center" bgcolor="#ffffff">商品价格</th>
            <th width="9%" align="center" bgcolor="#ffffff">购买数量</th>
            <th width="20%" align="center" bgcolor="#ffffff">小计</th>
          </tr>
          <c:forEach items="${list }" var="li">
                    <tr>
            <td bgcolor="#ffffff">
                              <a href="Good.html?id=${li.g_id }" target="_blank" class="f6">${li.g_name }</a>
                                            </td>
            <td align="left" bgcolor="#ffffff">尺寸:${li.g_size } <br />
</td>
            <!--<td align="right">309.59元</td>-->
            <td align="right" bgcolor="#ffffff">${li.g_price }元</td>
            <td align="center" bgcolor="#ffffff">${li.g_number }</td>
            <td align="right" bgcolor="#ffffff">${li.g_price*li.g_number }元</td>
          </tr>
          </c:forEach>
                    <tr>
            <td colspan="8" bgcolor="#ffffff" align="right">
            商品总价: ${order.o_totalprice }元            </td>
          </tr>
        </table>
         <div class="blank"></div>
        <h5><span>费用总计</span></h5>
        <div class="blank"></div>
         <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
          <tr>
            <td align="right" bgcolor="#ffffff">
                商品总价: ${order.o_totalprice }元     
          </tr>
          <tr>
            <td align="right" bgcolor="#ffffff">
                                                                </td>
          </tr>
          <tr>
            <td align="right" bgcolor="#ffffff">应付款金额: ${order.o_totalprice }元            </td>
          </tr>
                    </table>
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

