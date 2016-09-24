<%@ page language="java" import="java.util.*,java.net.*" pageEncoding="UTF-8"%>
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
<title>登录</title>
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="animated_favicon.gif" type="image/gif" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/user.js"></script>
<script type="text/javascript" src="js/transport.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="block block1">
   <div class="block box">
<div class="blank"></div>
 <div id="ur_here">
当前位置: <a href=".">首页</a> <code>&gt;</code> 用户中心 
</div>
</div>
<div class="blank"></div>
>



<c:if test="${action eq 'login'}" >

<%
response.setCharacterEncoding("utf-8");
request.setCharacterEncoding("utf-8");
	String username = "";
	String password = "";
	Cookie[] cookies = request.getCookies();
	if(cookies!=null&&cookies.length>0){
		for(Cookie c:cookies){
			if(c.getName().equals("username")){
				username = URLDecoder.decode(c.getValue(),"utf-8");
			}
			
			if(c.getName().equals("password")){
				password = URLDecoder.decode(c.getValue(),"utf-8");
			}
		}
	}

%>
<div class="usBox clearfix">
  <div class="usBox_1 f_l">
    <div class="login_tab">
    <ul>
        <li class="active"><a href="Login.html?action=login">用户登录</a></li>
        <li ><a href="Login.html?action=reg">用户注册</a></li>
    </ul>
    </div>
    
   <form name="formLogin" action="Login.html" method="post" onSubmit="return userLogin()">
        <table width="100%" border="0" align="left" cellpadding="3" cellspacing="5">
          <tr>
            <td width="25%" align="right">用户名</td>
            <td width="65%"><input name="username" type="text" size="25" class="inputBg" value="<%=username %>"/></td>
          </tr>
          <tr>
            <td align="right" >密码</td>
            <td>
            <input name="password" type="password" size="15" value="<%=password %>" class="inputBg"/>            </td>
          </tr>
          <!-- 判断是否启用验证码{if $enabled_captcha} -->
          <tr>
          <td></td>
          	<td>请输入验证码:</td>
          
          </tr>
          <tr > 
          <td></td>
            <td ><img id="r" alt="random" src="randomcode.jpg" onclick="changeR(this)" style="cursor: pointer;"/>
            <input type="text" name="captcha" style="height:20px;width:80px;font-size:large;" id="123" onblur="is_captcha(this.value);"/><br />
            <a style="color: blue">看不清，换一张</a> </td>
	

          </tr>
          <tr><td><input type="hidden" name="captcha_back" value="${captcha }"/></td></tr>
          
          <!--{/if}-->
          <tr>
            <td> </td>
            <td><input type="checkbox" name="remember"  checked="checked" />记住密码</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td align="left">
            <input type="hidden" name="act" value="act_login" />
            <input type="hidden" name="back_act" value="{$back_act}" />
            <input type="submit" name="submit" value="" class="us_Submit" />            </td>
          </tr>
	  <tr><td></td><td><a href="Login.html?action=gpswname" class="f3">密码问题找回密码</a></td></tr>
      </table>
      <input name="action" value="tlogin" type="hidden"/>
    </form>
   
    <div class="blank"></div>
  </div>
  
  <div class="usTxt">
 <a href="http://bbs.ecmoban.com" title="ecshop模板堂论坛 ecshop资源下载第一站" target="_blank"><img alt="ecshop模板堂论坛 ecshop资源下载第一站" src="css/images/ecmoban.jpg" /></a>
   </div>
</div>
<!--{/if}-->
<!--#登录界面 end-->
</c:if>


<c:if test="${action eq 'reg' }">
<!--*会员注册界面 start-->
    <!--{if $action eq 'register'}-->
    <!-- {if $shop_reg_closed eq 1} -->
    <!-- {else} -->
    <script type="text/javascript" src="js/utils.js"></script>
<div class="usBox">
   <div class="usBox_1 f_l">
    <div class="login_tab">
    <ul>
        <li  ><a href="Login.html?action=login">用户登录</a></li>
        <li class="active"><a href="Login.html?action=reg">用户注册</a></li>
    </ul>
    </div>
    <form action="Login.html" method="post" name="formUser" onsubmit="return register()">
      <table width="100%"  border="0" align="left" cellpadding="5" cellspacing="3">
        <tr>
          <td width="25%" align="right">用户名</td>
          <td width="65%">
          <input name="username" type="text" size="25" id="username" onblur="is_registered(this.value);" class="inputBg"/>
            <span id="username_notice" style="color:#FF0000"> *</span>
          </td>
        </tr>
        <tr>
          <td align="right">email</td>
          <td>
          <input name="email" type="text" size="25" id="email" onblur="checkEmail(this.value);"  class="inputBg"/>
            <span id="email_notice" style="color:#FF0000"> *</span>
          </td>
        </tr>
        <tr>
          <td align="right">密码</td>
          <td>
          <input name="password" type="password" id="password1" onblur="check_password(this.value);" onkeyup="checkIntensity(this.value)" class="inputBg" style="width:179px;" />
            <span style="color:#FF0000" id="password_notice"> *</span>
          </td>
        </tr>
        <tr>
          <td align="right">密码强度</td>
          <td>
            <table width="145" border="0" cellspacing="0" cellpadding="1">
              <tr align="center">
                <td width="33%" id="pwd_lower">弱</td>
                <td width="33%" id="pwd_middle">中</td>
                <td width="33%" id="pwd_high">强</td>

              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td align="right">确认密码</td>
          <td>
          <input name="confirm_password" type="password" id="conform_password" onblur="check_conform_password(this.value);"  class="inputBg" style="width:179px;"/>
            <span style="color:#FF0000" id="conform_password_notice"> *</span>
          </td>
        </tr>
     
         
		 <tr>
         
          <td align="right" id="extend_field5i">手机          </td>
          <td><input name="extend_field5" type="text" size="25" class="inputBg" /><span style="color:#FF0000"> *</span>          </td>
        </tr>

        <tr>
          <td align="right">密码提示问题</td>
          <td>
          <select name='sel_question'>
	  <option value='0'>请选择密码提示问题</option>
	  <option value="friend_birthday">我最好朋友的生日？</option><option value="old_address">我儿时居住地的地址？</option><option value="motto">我的座右铭是？</option><option value="favorite_movie">我最喜爱的电影？</option><option value="favorite_song">我最喜爱的歌曲？</option><option value="favorite_food">我最喜爱的食物？</option><option value="interest">我最大的爱好？</option><option value="favorite_novel">我最喜欢的小说？</option><option value="favorite_equipe">我最喜欢的运动队？</option>	  </select>
          </td>
        </tr>
        <tr>
         <td align="right" id="passwd_quesetion">密码问题答案</td>
          <td>
	  <input name="passwd_answer" type="text" size="25" class="inputBg" maxlengt='20'/><span style="color:#FF0000"> *</span>          </td>
        </tr>
		  <tr>
          <td></td>
          	<td>请输入验证码:</td>
          
          </tr>
          <tr > 
          <td></td>
            <td ><img id="r" alt="random" src="randomcode.jpg" onclick="changeR(this)" style="cursor: pointer;"/>
            <input type="text" name="captcha" style="height:20px;width:80px;font-size:large;" onblur="is_captcha(this.value);"/><br />
            <a style="color: blue">看不清，换一张</a> </td>
	

          </tr>
              <tr>
          <td>&nbsp;</td>
          <td><label>
            <input name="agreement" type="checkbox" value="1" checked="checked" />
            我已看过并接受《<a href="#" style="color:blue" onClick="alert('并没有用户协议')">用户协议</a>》</label></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="left">
          <input name="act" type="hidden" value="act_register" />
          <input type="hidden" name="back_act" value="" />
          <input name="Submit" type="submit" value="" class="us_Submit_reg"/>
          </td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
                 <tr>
                    <td bgcolor="#ffffff" colspan="2" align="center"><a href="Login.html?action=gpswname" class="f6">密码问题找回密码</a> </td>
                  </tr>

      </table>
            <input name="action" value="tregister" type="hidden"/>
      
    </form>
  <div class="blank"></div>
  </div>

  <div class="usTxt">
   <a href="http://bbs.ecmoban.com" title="ecshop模板堂论坛 ecshop资源下载第一站" target="_blank"><img alt="ecshop模板堂论坛 ecshop资源下载第一站" src="css/images/ecmoban.jpg" /></a>   
   </div>
</div>
<!--{/if}-->
<!--{/if}-->
<!--#会员注册界面 end-->
</c:if>


<c:if test="${action eq 'gpswname' }">
<!--*通过问题找回密码的确认找回账号界面 -->
    <!--{if $action eq 'qpassword_name'} -->
<div class="usBox">
  <div class="usBox_2 clearfix">
    <form action="" method="post">
        <br />
        <table width="70%" border="0" align="center">
          <tr>
            <td colspan="2" align="center"><strong>请输入您注册的用户名以取得您的密码提示问题。</strong></td>
          </tr>
          <tr>
            <td width="29%" align="right">用户名</td>
            <td width="61%"><input name="user_name" type="text" size="30" class="inputBg" /></td>
          </tr>
          <tr>
            <td></td>
            <td><input type="hidden" name="act" value="get_passwd_question" />
              <input type="submit" name="submit" value="提 交" class="bnt_blue" style="border:none;" />
              <input name="button" type="button" onclick="history.back()" value="返回上一页" style="border:none;" class="bnt_blue_1" />
	    </td>
          </tr>
        </table>
        <br />
      </form>
  </div>
</div>
<!--{/if}-->
</c:if>

</div>
<div class="blank"></div>
<%@ include file="footer.jsp" %>
<c:if test="${fail == 1}"><script type="text/javascript">alert("用户名或密码错误！");</script></c:if>
<c:if test="${fail == 2}"><script type="text/javascript">alert("验证码错误！");</script></c:if>
<c:if test="${registersuccess == true}"><script type="text/javascript">alert("注册成功！");</script></c:if>
</body>
<script type="text/javascript">
var captcha_empty = "- 验证码不能为空";
var process_request = "正在处理您的请求...";
var username_empty = "- 用户名不能为空。";
var username_shorter = "- 用户名长度不能少于 3 个字符。";
var username_invalid = "- 用户名只能是由字母数字以及下划线组成。";
var password_empty = "- 登录密码不能为空。";
var password_shorter = "- 登录密码不能少于 6 个字符。";
var confirm_password_invalid = "- 两次输入密码不一致";
var email_empty = "- Email 为空";
var email_invalid = "- Email 不是合法的地址";
var agreement = "- 您没有接受协议";
var msn_invalid = "- msn地址不是一个有效的邮件地址";
var qq_invalid = "- QQ号码不是一个有效的号码";
var home_phone_invalid = "- 家庭电话不是一个有效号码";
var office_phone_invalid = "- 办公电话不是一个有效号码";
var mobile_phone_invalid = "- 手机号码不是一个有效号码";
var msg_un_blank = "* 用户名不能为空";
var msg_un_length = "* 用户名最长不得超过7个汉字";
var msg_un_format = "* 用户名含有非法字符";
var msg_un_registered = "* 用户名已经存在,请重新输入";
var msg_can_rg = "* 可以注册";
var msg_email_blank = "* 邮件地址不能为空";
var msg_email_registered = "* 邮箱已存在,请重新输入";
var msg_email_format = "* 邮件地址不合法";
var msg_blank = "不能为空";
var no_select_question = "- 您没有完成密码提示问题的操作";
var passwd_balnk = "- 密码中不能包含空格";
var username_exist = "用户名 %s 已经存在";
</script>

</html>

