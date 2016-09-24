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
<title>我的购物车</title>
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
         
          <h5><span>收货人信息</span></h5>
        <div class="blank"></div>
         
            <script type="text/javascript" src="js/region.js"></script><script type="text/javascript" src="js/shopping_flow.js"></script>            <script type="text/javascript">
              region.isAdmin = false;
                            var consignee_not_null = "收货人姓名不能为空！";
                            var invalid_email = "您输入的邮件地址不是一个合法的邮件地址。";
                            var address_not_null = "收货人的详细地址不能为空！";
                            var tele_not_null = "电话不能为空！";
                            var shipping_not_null = "请您选择配送方式！";
                            var payment_not_null = "请您选择支付方式！";
                            var goodsattr_style = "1";
                            var tele_invaild = "电话号码不有效的号码";
                            var zip_not_num = "邮政编码只能填写数字";
                            var mobile_invaild = "手机号码不是合法号码";
                            
              onload = function() {
                if (!document.all)
                {
                  document.forms['theForm'].reset();
                }
              }
              
            </script>
             <c:forEach var="ccc"  items="${addresslist}"  step="1">
                        <form action="AddressServlet?action=update" method="post" name="theForm" onsubmit="return checkConsignee(this)">
              <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
         <input name="flag" type="hidden" value="${ccc.a_id}" />
                <tr>
                  <td align="right" bgcolor="#ffffff">收货人姓名：</td>
                  <td align="left" bgcolor="#ffffff"><input name="consignee" type="text" class="inputBg" id="consignee_0" value="${ccc.a_name}" />
                  (必填) </td>
                  <td align="right" bgcolor="#ffffff">电子邮件地址：</td>
                  <td align="left" bgcolor="#ffffff"><input name="email" type="text" class="inputBg" id="email_0" value="${ccc.a_mail}" />
                  (必填)</td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#ffffff">详细地址：</td>
                  <td align="left" bgcolor="#ffffff"><input name="address" type="text" class="inputBg" id="address_0" value="${ccc.a_add}" />
                  (必填)</td>
                  <td align="right" bgcolor="#ffffff">邮政编码：</td>
                  <td align="left" bgcolor="#ffffff"><input name="zipcode" type="text" class="inputBg" id="zipcode_0" value="${ccc.a_num}" /></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#ffffff">电话：</td>
                  <td align="left" bgcolor="#ffffff"><input name="tel" type="text" class="inputBg" id="tel_0" value="${ccc.a_tel}" />
                  (必填)</td>
                  <td align="right" bgcolor="#ffffff">手机：</td>
                  <td align="left" bgcolor="#ffffff"><input name="mobile" type="text" class="inputBg" id="mobile_0" value="${ccc.a_phone}" /></td>
                </tr>
            
                <tr>
                  <td align="right" bgcolor="#ffffff">&nbsp;</td>
                  <td colspan="3" align="center" bgcolor="#ffffff">                    <input type="submit" name="submit" class="bnt_blue_1" value="确认修改" />
                    <input name="button" type="button" class="bnt_blue"  onclick="if (confirm('你确认要删除该收货地址吗？'))location.href='AddressServlet?action=delete&aid=${ccc.a_id}'" value="删除" />
                    <input type="hidden" name="act" value="act_edit_address" />
                     
                  </td>
                </tr>
              </table>
              </c:forEach>
            </form>
                        <form action="AddressServlet?action=insert" method="post" name="theForm" onsubmit="return checkConsignee(this)">
              <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">

                <tr>
                  <td align="right" bgcolor="#ffffff">收货人姓名：</td>
                  <td align="left" bgcolor="#ffffff"><input name="consignee" type="text" class="inputBg" id="consignee_1" value="" />
                  (必填) </td>
                  <td align="right" bgcolor="#ffffff">电子邮件地址：</td>
                  <td align="left" bgcolor="#ffffff"><input name="email" type="text" class="inputBg" id="email_1" value="testreg@163.com" />
                  (必填)</td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#ffffff">详细地址：</td>
                  <td align="left" bgcolor="#ffffff"><input name="address" type="text" class="inputBg" id="address_1" value="" />
                  (必填)</td>
                  <td align="right" bgcolor="#ffffff">邮政编码：</td>
                  <td align="left" bgcolor="#ffffff"><input name="zipcode" type="text" class="inputBg" id="zipcode_1" value="" /></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#ffffff">电话：</td>
                  <td align="left" bgcolor="#ffffff"><input name="tel" type="text" class="inputBg" id="tel_1" value="" />
                  (必填)</td>
                  <td align="right" bgcolor="#ffffff">手机：</td>
                  <td align="left" bgcolor="#ffffff"><input name="mobile" type="text" class="inputBg" id="mobile_1" value="" /></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#ffffff">&nbsp;</td>
                  <td colspan="3" align="center" bgcolor="#ffffff">                    <input type="submit" name="submit" class="bnt_blue_2"  value="新增收货地址"/>
                     <input type="hidden" name="act" value="act_edit_address" />
                    <input name="address_id" type="hidden" value="" />
                  </td>
                </tr>
              </table>
            </form>

          

      </div>
     </div>
    </div>
  </div>
  

</div>
<div class="blank"></div>
<%@ include file="footer.jsp" %>
</body>
</html>

