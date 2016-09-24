<%@ page language="java" import="java.util.*,com.daygo.entity.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- TemplateBeginEditable name="doctitle" -->
<title>物品列表</title>
<!-- TemplateEndEditable --><!-- TemplateBeginEditable name="head" --><!-- TemplateEndEditable -->
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="animated_favicon.gif" type="image/gif" />
<link href="library/style.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<script type="text/javascript" src="js/compare.js"></script>
</head>
<body>
<%@ include file="header2.jsp" %>
  <div class="block box">
<div class="blank"></div>
 <div id="ur_here">
当前位置: 物品列表
</div>
</div>
<div class="blank"></div>

<div class="block clearfix">
 
<%@ include file="inleft.jsp" %>
 

<div class="blank"></div>

</div>
 
  <div class="AreaR">

	 
<div class="box">
 <div class="box_1">
  <h3>
  <span>商品列表</span>
  <form method="get" class="sort" name="listform">
  显示方式：
  <a href="javascript:;" onClick="javascript:display_mode('list')"><img src="css/images/display_mode_list.gif" alt=""></a>
  <a href="javascript:;" onClick="javascript:display_mode('grid')"><img src="css/images/display_mode_grid_act.gif" alt=""></a>
  <a href="javascript:;" onClick="javascript:display_mode('text')"><img src="css/images/display_mode_text.gif" alt=""></a>&nbsp;&nbsp;
     
  <a href="category.php?category=21&display=grid&brand=0&price_min=0&price_max=0&filter_attr=0&page=1&sort=goods_id&order=ASC#goods_list"><img src="css/images/goods_id_DESC.gif" alt="按上架时间排序"></a>
  <a href="category.php?category=21&display=grid&brand=0&price_min=0&price_max=0&filter_attr=0&page=1&sort=shop_price&order=ASC#goods_list"><img src="css/images/shop_price_default.gif" alt="按价格排序"></a>
  <a href="category.php?category=21&display=grid&brand=0&price_min=0&price_max=0&filter_attr=0&page=1&sort=last_update&order=DESC#goods_list"><img src="css/images/last_update_default.gif" alt="按更新时间排序"></a>
  <input type="hidden" name="category" value="21" />
  <input type="hidden" name="display" value="grid" id="display" />
  <input type="hidden" name="brand" value="0" />
  <input type="hidden" name="price_min" value="0" />
  <input type="hidden" name="price_max" value="0" />
  <input type="hidden" name="filter_attr" value="0" />
  <input type="hidden" name="page" value="1" />
  <input type="hidden" name="sort" value="goods_id" />
  <input type="hidden" name="order" value="DESC" />
    </form>
  </h3>
      <form name="compareForm" action="compare.php" method="post" onSubmit="return compareGoods(this);">
            <div class="clearfix goodsBox" style="border:none; padding:11px 0 10px 0px;">
            <c:forEach items="${list}" var="goods" >
             <div class="goodsItem" >
           <a href="Good.html?id=${goods.g_id }"><img src="${goods.g_picture }" alt="${goods.g_name }" class="goodsimg" /></a><br />
           <p><a href="Good.html?id=${goods.g_id}" title="${goods.g_name }">${goods.g_name }</a></p>
                                 
                                                                        促销价：<font class="shop_s">${goods.g_price }元</font><br />
                        			 
        </div>
              </c:forEach>
           
           </div>
        </form>
  
 </div>
</div>
<div class="blank5"></div>
<script type="Text/Javascript" language="JavaScript">
<!--
function selectPage(sel)
{
  sel.form.submit();
}
//-->
</script>
<script type="text/javascript">
window.onload = function()
{
  Compare.init();
  fixpng();
}
var button_compare = '';
var exist = "您已经选择了%s";
var count_limit = "最多只能选择4个商品进行对比";
var goods_type_different = "\"%s\"和已选择商品类型不同无法进行对比";
var compare_no_goods = "您没有选定任何需要比较的商品或者比较的商品数少于 2 个。";
var btn_buy = "购买";
var is_cancel = "取消";
var select_spe = "请选择商品属性";
</script>
<form name="selectPageForm" action="/category.php" method="get">
 <div id="pager" class="pagebar">
  <span class="f_l " style="margin-right:10px;">总计 <b>${count}</b>  个记录</span>
      
      </div>
</form>
<script type="Text/Javascript" language="JavaScript">
<!--
function selectPage(sel)
{
  sel.form.submit();
}
//-->
</script>
  </div>  
  
</div>

<!-- #BeginLibraryItem "/library/page_footer.lbi" --><!-- #EndLibraryItem -->
</body>
</html>

