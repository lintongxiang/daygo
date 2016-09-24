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
<title>用户信息</title>
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
                          <script type="text/javascript">
                      var email_empty = "请输入您的电子邮件地址！";
                      var email_error = "您输入的电子邮件地址格式不正确！";
                      var old_password_empty = "请输入您的原密码！";
                      var new_password_empty = "请输入您的新密码！";
                      var confirm_password_empty = "请输入您的确认密码！";
                      var both_password_error = "您现两次输入的密码不一致！";
                      var msg_blank = "不能为空";
                      var no_select_question = "- 您没有完成密码提示问题的操作";
                  </script>
      <h5><span>个人资料</span></h5>
      <div class="blank"></div>
     <form name="formEdit" action="UserCginfoServlet?action=changeinfo" method="post" onSubmit="return userEdit()">
      <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
          <c:if test="${msg!=null}">
           <tr>
                  <td width="28%" align="right" bgcolor="#FFFFFF">提示信息： </td>
                  <td width="72%" align="left" bgcolor="#FFFFFF"><%=request.getAttribute("msg")%></td>
                </tr>
</c:if>
                <tr>
                  <td width="28%" align="right" bgcolor="#FFFFFF">性　别： </td>
                  <td width="72%" align="left" bgcolor="#FFFFFF">
                  <c:if test="${user.u_sex==0}">
                  <input type="radio" name="sex" value="2"  />
                    保密&nbsp;&nbsp;
                    <input type="radio" name="sex" value="0" checked="checked" />
                    男&nbsp;&nbsp;
                    <input type="radio" name="sex" value="1"  />
                  女&nbsp;&nbsp; </c:if>
                  <c:if test="${user.u_sex==1}">
                  <input type="radio" name="sex" value="2"  />
                    保密&nbsp;&nbsp;
                    <input type="radio" name="sex" value="0"  />
                    男&nbsp;&nbsp;
                    <input type="radio" name="sex" value="1"  checked="checked"/>
                  女&nbsp;&nbsp; </c:if>
                   <c:if test="${user.u_sex==2}">
                  <input type="radio" name="sex" value="2" checked="checked" />
                    保密&nbsp;&nbsp;
                    <input type="radio" name="sex" value="0"  />
                    男&nbsp;&nbsp;
                    <input type="radio" name="sex" value="1"  />
                  女&nbsp;&nbsp; </c:if>
                  
                  </td>
                </tr>
                <tr>
                  <td width="28%" align="right" bgcolor="#FFFFFF">电子邮件地址： </td>
                  <td width="72%" align="left" bgcolor="#FFFFFF"><input name="email" type="text" value="${user.u_mail}" size="25" class="inputBg" /><span style="color:#FF0000"> *</span></td>
                </tr>        
        		                <tr>
           <td width="28%" align="right" bgcolor="#FFFFFF" id="extend_field5i">手机：</td>
            <td width="72%" align="left" bgcolor="#FFFFFF">
            <input name="extend_field5" type="text" class="inputBg" value="${user.u_tel}"/><span style="color:#FF0000"> *</span>            </td>
        </tr>
        		                <tr>
          <td width="28%" align="right" bgcolor="#FFFFFF">密码提示问题：</td>
          <td width="72%" align="left" bgcolor="#FFFFFF">
          <select name='sel_question'>
          <option value='0' >请选择密码提示问题</option>
          <option value="friend_birthday">我最好朋友的生日？</option><option value="old_address">我儿时居住地的地址？</option><option value="motto">我的座右铭是？</option><option value="favorite_movie">我最喜爱的电影？</option><option value="favorite_song">我最喜爱的歌曲？</option><option value="favorite_food">我最喜爱的食物？</option><option value="interest">我最大的爱好？</option><option value="favorite_novel">我最喜欢的小说？</option><option value="favorite_equipe">我最喜欢的运动队？</option>          </select>
          </td>
        </tr>
        <tr>
       <td width="28%" align="right" bgcolor="#FFFFFF" id="passwd_quesetion">密码问题答案：</td>
          <td width="72%" align="left" bgcolor="#FFFFFF">
          <input name="passwd_answer" type="text" size="25" class="inputBg" maxlengt='20' value="${user.u_answer}"/><span style="color:#FF0000"> *</span>          </td>
        </tr>
        		                <tr>
                  <td colspan="2" align="center" bgcolor="#FFFFFF"><input name="act" type="hidden" value="act_edit_profile" />
                    <input name="submit" type="submit" value="确认修改" class="bnt_blue_1" style="border:none;" />
                  </td>
                </tr>
       </table>
    </form>
     <form name="formPassword" action="UserCginfoServlet?action=changepwd" method="post" onSubmit="return editPassword()" >
     <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
        <tr>
          <td width="28%" align="right" bgcolor="#FFFFFF">原密码：</td>
          <td width="76%" align="left" bgcolor="#FFFFFF"><input name="old_password" type="password" size="25"  class="inputBg" /></td>
        </tr>
        <tr>
          <td width="28%" align="right" bgcolor="#FFFFFF">新密码：</td>
          <td align="left" bgcolor="#FFFFFF"><input name="new_password" type="password" size="25"  class="inputBg" placeholder="请输入不少于8位的密码"/></td>
        </tr>
        <tr>
          <td width="28%" align="right" bgcolor="#FFFFFF">确认密码：</td>
          <td align="left" bgcolor="#FFFFFF"><input name="comfirm_password" type="password" size="25"  class="inputBg" placeholder="请再次输入不少于8位的密码" /></td>
        </tr>
        <tr>
          <td colspan="2" align="center" bgcolor="#FFFFFF"><input name="act" type="hidden" value="act_edit_password" />
            <input name="submit" type="submit" class="bnt_blue_1" style="border:none;" value="确认修改" />
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