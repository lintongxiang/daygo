<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8">
<meta name="Keywords" content="{$keywords}" />
<meta name="Description" content="{$description}" />
<title>${goods.g_name}</title>
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="animated_favicon.gif" type="image/gif" />
<link href="library/style.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<!--{* 包含脚本文件 *}
{insert_scripts files='common.js'}-->
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/action.js"></script>
<script type="text/javascript" src="js/mzp-packed-me.js"></script>
<script type="text/javascript">
function $id(element) {
  return document.getElementById(element);
}
//切屏--是按钮，_v是内容平台，_h是内容库
function reg(str){
  var bt=$id(str+"_b").getElementsByTagName("h2");
  for(var i=0;i<bt.length;i++){
    bt[i].subj=str;
    bt[i].pai=i;
    bt[i].style.cursor="pointer";
    bt[i].onclick=function(){
      $id(this.subj+"_v").innerHTML=$id(this.subj+"_h").getElementsByTagName("blockquote")[this.pai].innerHTML;
      for(var j=0;j<$id(this.subj+"_b").getElementsByTagName("h2").length;j++){
        var _bt=$id(this.subj+"_b").getElementsByTagName("h2")[j];
        var ison=j==this.pai;
        _bt.className=(ison?"":"h2bg");
      }
    }
  }
  $id(str+"_h").className="none";
  $id(str+"_v").innerHTML=$id(str+"_h").getElementsByTagName("blockquote")[0].innerHTML;
}

</script>

</head>
<body>
<%@ include file="header2.jsp" %>
<div class="block box">
<div class="blank"></div>
 <div id="ur_here">
当前位置: 当前的位置    
</div>
</div>
<div class="blank"></div>

<div class="block">
  
  <%@ include file="inleft.jsp" %>

</div>
 </div>
  <div class="AreaR">
   
   <div id="goodsInfo" class="clearfix">
    
     
     <div class="imgInfo">
     <a href="${goods.g_picture }" id="zoom1" class="MagicZoom MagicThumb" title="${goods.g_name} ">
      <img src="${goods.g_picture }" alt="${goods.g_name} " width="320px;" height="320px"/>
     </a>
     <div class="blank5"></div>
    <div style="text-align:center; position:relative; width:100%;">
               <a href="javascript:;" onclick="window.open('gallery.php?id=141'); return false;"><img alt="zoom" src="css/images/zoom.gif" /></a>
            <a href="goods.php?id=136"><img style="position: absolute;right:0;"  alt="next" src="css/images/down.gif" /></a>
            </div>
      
 
         <div class="blank"></div>
           
      <div class="picture" id="imglist">              
              
     <%--    <a  href="${goods.g_picture }"
    		rel="zoom1" 
       	 	rev="${goods.g_picture }"
      	  	title="">
     		<img src="${goods.g_picture }" alt="${goods.g_name} " class="autobg" />
        </a>   --%>
                         
</div>
 
<script type="text/javascript">
	mypicBg();
</script>     
         
     </div>
     
     <div class="textInfo">
     <form action="ShoppingCart.html?action=add&id=${goods.g_id }" method="post" name="ECS_FORMBUY" id="ECS_FORMBUY" >
	  <h1 class="clearfix" >
      ${goods.g_name}      </h1> 
 
        
	   
	  
	  <ul class="ul2 clearfix">
        <li class="clearfix" style="width:100%">
      		 <dd>
       <strong>本店售价：</strong><font class="shop" id="ECS_SHOPPRICE">${goods.g_price}</font> 
	          <font class="market">${goods.g_price+15}</font> 
              </dd>
       </li>
       <li class="clearfix">
       <dd>
       <strong>商品货号：</strong>${goods.g_id}      
       </dd>
       </li> 
                      <li class="clearfix">
       <dd>
      
                  <strong>商品库存：</strong>
                  ${goods.g_number}             
       </dd>
       </li>  
                    <li class="clearfix">
       <dd>
      
       <strong>商品种类：</strong><a href="Search.html?category=${goods.g_category }" >${goods.g_category}</a>
    
       </dd>
     
        
	  </ul>
	  
	  
	  <ul>
     
  <li class="clearfix">
       <br/>
       <br/>
      </li>

         </ul>
         <ul class="bnt_ul">
     
            <li class="padd loop">
      <strong>尺寸：</strong>
        
             <select name="size" onchange="changePrice()" >
             <c:forTokens items="${goods.g_size }" var="size" delims=";">
                                               <option label="${size }" value="${size }">${size }</option>
                                               </c:forTokens>
                                                  </select>
                        <input type="hidden" name="spec_list" value="0" />
                                                </li>
          
       
      
           <li class="clearfix">
       <dd>
       <strong>购买数量：</strong>
       
       
        <input name="number" type="text" id="number" value="1" size="4" onblur="changePrice()" style="border:1px solid #ccc; "/> <strong>商品总价：</strong><font id="ECS_GOODS_AMOUNT" class="f1"></font>
       </dd>
       </li>
      
      <li class="padd">
      <a href="javascript:void(0)" onclick="document.getElementById('ECS_FORMBUY').submit();"><img src="css/images/goumai2.gif" /></a>
     
      </li>
     
      </ul>
      </form>
     </div>
   </div>
   <div class="blank"></div>
   
   
     <div class="box">
 
      <div style="padding:0 0px;">
        <div id="com_b" class="history clearfix">
        <h2>商品描述</h2>
      </div>    <div class="box_1">
      <div id="com_v" class="  " style="padding:6px;"></div>
      <div id="com_h">
       <blockquote>
        ${goods.g_describe }
             </blockquote> 
     
    <script type="text/javascript">
     reg("com");
    </script></div></div></div>
  <div class="blank"></div>
  <div id="ECS_COMMENT"> <div class="box">
     <div class="box_1">
      <h3><span class="text">用户评论</span>(共<font class="f1">${list.size()}</font>条评论)</h3>
      <div class="boxCenterList clearfix" style="height:1%;">
      
      <c:forEach items="${list}" var="var">
     
       <ul class="comments">
           <li class="word">
      		  <font class="f2">${var.u_id}</font> <font class="f3">${var.c_time}</font><br />
       		  <img src="css/images/stars${var.c_rank}.gif" alt="" />
      		  <p>${var.c_context}</p>
			</li>
       </ul>
      </c:forEach>
      
      </div>
      </div>
     </div>

    <div class="blank5"></div>
</div>
</div>
  

</div>

<%@  include file="footer.jsp" %>
 
</body>
</html>

