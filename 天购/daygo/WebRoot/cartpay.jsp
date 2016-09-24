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
<title>购物车</title>
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="animated_favicon.gif" type="image/gif" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src=js/common.js"></script>
<script type="text/javascript" src="js/shopping_flow.js"></script></head>

<body>
<%@ include file="header2.jsp" %>


  <div class="block box">
<div class="blank"></div>
 <div id="ur_here">
当前位置: <a href=".">首页</a> <code>&gt;</code> 购物流程 
</div>
</div>
<div class="blank"></div>

 
<div class="block table">
 
  <script type="text/javascript" src="js/showdiv.js"></script>
  <script type="text/javascript">
  var user_name_empty = "请输入您的用户名！";
      var email_address_empty = "请输入您的电子邮件地址！";
      var email_address_error = "您输入的电子邮件地址格式不正确！";
      var new_password_empty = "请输入您的新密码！";
      var confirm_password_empty = "请输入您的确认密码！";
      var both_password_error = "您两次输入的密码不一致！";
      var show_div_text = "请点击更新购物车按钮";
      var show_div_exit = "关闭";

  </script>
  <div class="flowBox">
    
    <div class="userCenterBox boxCenterList clearfix" style="_height:1%;">
         
              <h6><span>订单状态</span></h6>
        <div class="blank"></div>
         <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
        <tr>
          <td width="15%" align="right" bgcolor="#ffffff">订单号：</td>
          <td align="left" bgcolor="#ffffff">${order.o_id }            				
					</td>
        </tr> 
                
              </table>
        <div class="blank"></div>
        <h5><span>商品列表</span>
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
         <h6><span>收货地址</span></h6>
         	<c:forEach items="${alist }" var="li">
         <div class="blank"></div>
         <h5><span>收货人：${li.a_name }&nbsp;&nbsp;联系方式：${li.a_tel }&nbsp;&nbsp;收货地址：${li.a_add }&nbsp;&nbsp;邮政编码：${li.a_num }</span><input name="radio" value="${li.a_id }" type="radio" />
         </h5>
         </c:forEach>
        <table width="99%" align="center" border="0" cellpadding="5" cellspacing="0" bgcolor="#dddddd">
          <tr>
            <td bgcolor="#ffffff"><a href="./"><img src="css/images/continue.gif" alt="continue" /></a></td>
            <td bgcolor="#ffffff" align="right"><a href="Pay.html?id=${order.o_id }" ><img src="css/images/checkout.gif" alt="checkout" /></a></td>
          </tr>
        </table>
       
       <script type="text/javascript" src="js/transport.js"></script>


</div>
    <div class="blank"></div>
  
</div>

<%@ include file="footer.jsp" %>
</body>
</html>

