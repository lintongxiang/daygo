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
<title>首页</title>
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="animated_favicon.gif" type="image/gif" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="alternate" type="application/rss+xml" title="RSS|天猫商城 - Powered by ECShop" href="feed.php" />

<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</head>
<body class="index_page">

<%@ include file="header.jsp" %>

<div class="block clearfix">
<div class="AreaL">
 
 <%@ include file="showleft.jsp" %>

<div style=" width:990px;float:right; "> 
<style type="text/css"> 
.container, .container *{margin:0; padding:0;}

.container{width:990px; height:410px; overflow:hidden;position:relative;}

.slider{position:absolute;}
.slider li{ list-style:none;display:inline;}
.slider img{ width:994px; height:410px; display:block;}

.slider2{width:2000px;}
.slider2 li{float:left;}

.num{ position:absolute; right:5px; bottom:5px;}
.num li{
	float: left;
	color: #d71437;
	text-align: center;
	line-height: 16px;
	width: 16px;
	height: 16px;
	font-family: Arial;
	font-size: 12px;
	cursor: pointer;
	overflow: hidden;
	margin: 3px 1px;
	border: 1px solid #d71437;
	background-color: #fff;
}
.num li.on{
	color: #fff;
	line-height: 21px;
	width: 21px;
	height: 21px;
	font-size: 16px;
	margin: 0 1px;
	border: 0;
	background-color: #d71437;
	font-weight: bold;
}
</style>
<div class="container" id="idTransformView">
  <ul class="slider" id="idSlider">
  <!--{foreach from=$flash name=no item=flash}-->
    <li><a href="Good.html?id=1" target="_blank"><img src="data/afficheimg/20140826mzpygk.jpg"/></a></li>
     <li><a href="Good.html?id=1" target="_blank"><img src="data/afficheimg/20140923htbinf.jpg"/></a></li>
      <li><a href="Good.html?id=1" target="_blank"><img src="data/afficheimg/20150619hwtllw.jpg"/></a></li>
    <!--{/foreach}-->

  </ul>
  <ul class="num" id="idNum">
 
    
     <!--{foreach from=$flash name=no item=flash}-->
         <li>1</li> 
         <li>2</li> 
         <li>3</li> 
    <!--{/foreach}-->
    
  </ul>
</div>

<script type="text/javascript">
var $ = function (id) {
	return "string" == typeof id ? document.getElementById(id) : id;
};

var Class = {
  create: function() {
	return function() {
	  this.initialize.apply(this, arguments);
	}
  }
}

Object.extend = function(destination, source) {
	for (var property in source) {
		destination[property] = source[property];
	}
	return destination;
}

var TransformView = Class.create();
TransformView.prototype = {
  //容器对象,滑动对象,切换参数,切换数量
  initialize: function(container, slider, parameter, count, options) {
	if(parameter <= 0 || count <= 0) return;
	var oContainer = $(container), oSlider = $(slider), oThis = this;

	this.Index = 0;//当前索引
	
	this._timer = null;//定时器
	this._slider = oSlider;//滑动对象
	this._parameter = parameter;//切换参数
	this._count = count || 0;//切换数量
	this._target = 0;//目标参数
	
	this.SetOptions(options);
	
	this.Up = !!this.options.Up;
	this.Step = Math.abs(this.options.Step);
	this.Time = Math.abs(this.options.Time);
	this.Auto = !!this.options.Auto;
	this.Pause = Math.abs(this.options.Pause);
	this.onStart = this.options.onStart;
	this.onFinish = this.options.onFinish;
	
	oContainer.style.overflow = "hidden";
	oContainer.style.position = "relative";
	
	oSlider.style.position = "absolute";
	oSlider.style.top = oSlider.style.left = 0;
  },
  //设置默认属性
  SetOptions: function(options) {
	this.options = {//默认值
		Up:			true,//是否向上(否则向左)
		Step:		5,//滑动变化率
		Time:		10,//滑动延时
		Auto:		true,//是否自动转换
		Pause:		2000,//停顿时间(Auto为true时有效)
		onStart:	function(){},//开始转换时执行
		onFinish:	function(){}//完成转换时执行
	};
	Object.extend(this.options, options || {});
  },
  //开始切换设置
  Start: function() {
	if(this.Index < 0){
		this.Index = this._count - 1;
	} else if (this.Index >= this._count){ this.Index = 0; }
	
	this._target = -1 * this._parameter * this.Index;
	this.onStart();
	this.Move();
  },
  //移动
  Move: function() {
	clearTimeout(this._timer);
	var oThis = this, style = this.Up ? "top" : "left", iNow = parseInt(this._slider.style[style]) || 0, iStep = this.GetStep(this._target, iNow);
	
	if (iStep != 0) {
		this._slider.style[style] = (iNow + iStep) + "px";
		this._timer = setTimeout(function(){ oThis.Move(); }, this.Time);
	} else {
		this._slider.style[style] = this._target + "px";
		this.onFinish();
		if (this.Auto) { this._timer = setTimeout(function(){ oThis.Index++; oThis.Start(); }, this.Pause); }
	}
  },
  //获取步长
  GetStep: function(iTarget, iNow) {
	var iStep = (iTarget - iNow) / this.Step;
	if (iStep == 0) return 0;
	if (Math.abs(iStep) < 1) return (iStep > 0 ? 1 : -1);
	return iStep;
  },
  //停止
  Stop: function(iTarget, iNow) {
	clearTimeout(this._timer);
	this._slider.style[this.Up ? "top" : "left"] = this._target + "px";
  }
};

window.onload=function(){
	function Each(list, fun){
		for (var i = 0, len = list.length; i < len; i++) { fun(list[i], i); }
	};
	
	var objs = $("idNum").getElementsByTagName("li");
	
	var tv = new TransformView("idTransformView", "idSlider", 410, 5, {
		onStart : function(){ Each(objs, function(o, i){ o.className = tv.Index == i ? "on" : ""; }) }//按钮样式
	});
	
	tv.Start();
	
	Each(objs, function(o, i){
		o.onmouseover = function(){
			o.className = "on";
			tv.Auto = false;
			tv.Index = i;
			tv.Start();
		}
		o.onmouseout = function(){
			o.className = "";
			tv.Auto = true;
			tv.Start();
		}
	})
	
	////////////////////////test2
	
	var objs2 = $("idNum2").getElementsByTagName("li");
	
	var tv2 = new TransformView("idTransformView2", "idSlider2", 990, 5, {
		onStart: function(){ Each(objs2, function(o, i){ o.className = tv2.Index == i ? "on" : ""; }) },//按钮样式
		Up: false
	});
	
	tv2.Start();
	
	Each(objs2, function(o, i){
		o.onmouseover = function(){
			o.className = "on";
			tv2.Auto = false;
			tv2.Index = i;
			tv2.Start();
		}
		o.onmouseout = function(){
			o.className = "";
			tv2.Auto = true;
			tv2.Start();
		}
	})
	
	$("idStop").onclick = function(){ tv2.Auto = false; tv2.Stop(); }
	$("idStart").onclick = function(){ tv2.Auto = true; tv2.Start(); }
	$("idNext").onclick = function(){ tv2.Index++; tv2.Start(); }
	$("idPre").onclick = function(){ tv2.Index--;tv2.Start(); }
	$("idFast").onclick = function(){ if(--tv2.Step <= 0){tv2.Step = 1;} }
	$("idSlow").onclick = function(){ if(++tv2.Step >= 10){tv2.Step = 10;} }
	$("idReduce").onclick = function(){ tv2.Pause-=1000; if(tv2.Pause <= 0){tv2.Pause = 0;} }
	$("idAdd").onclick = function(){ tv2.Pause+=1000; if(tv2.Pause >= 5000){tv2.Pause = 5000;} }
	
	$("idReset").onclick = function(){
		tv2.Step = Math.abs(tv2.options.Step);
		tv2.Time = Math.abs(tv2.options.Time);
		tv2.Auto = !!tv2.options.Auto;
		tv2.Pause = Math.abs(tv2.options.Pause);
	}
	
}
</script>
 
 
 
 
 
 <div class="blank5"></div>
<div class="blank"></div>
<!--    addddddddddeend-->
</div>
 
  
    <div class="blank"></div> 
 
  
  <div class="goodsBox_1">


<div class="xm-box">
<h4 class="title"><span>新品上架</span> <a class="more" href="Search.html?">更多</a></h4>
<div class="blank"></div>
<div id="show_new_area" class="clearfix">
   <div class="goodsItem">
       
           <a href="Good.html?id=1"><img src="images/201408/thumb_img/140_thumb_G_1409076056693.jpg" alt="衬衫粉红大布娃娃2014秋新 白色拼蕾丝立体蝴蝶结长袖衬衫 女" class="goodsimg" /></a><br />
           <p class="f1"><a href="Good.html?id=1" title="衬衫粉红大布娃娃2014秋新 白色拼蕾丝立体蝴蝶结长袖衬衫 女">衬衫粉红大布娃娃2014秋新 白色拼蕾丝立体蝴蝶结长袖衬衫 女</a></p>
           
           
 市场价：<font class="market">336元</font> <br/>
      
           本店价：<font class="f1">
                     430元                     </font>      
		    
        </div>
    <div class="goodsItem">
       
           <a href="Good.html?id=7"><img src="images/201408/thumb_img/141_thumb_G_1409076369744.jpg" alt="女米白色韩版春装新款条纹镂空开衫针织衫MQ3160" class="goodsimg" /></a><br />
           <p class="f1"><a href="Good.html?id=7" title="女米白色韩版春装新款条纹镂空开衫针织衫MQ3160">女米白色韩版春装新款条纹镂空开衫针织衫MQ3160</a></p>
           
           
 市场价：<font class="market">309元</font> <br/>
      
           本店价：<font class="f1">
                     200元                     </font>      
		    
        </div>
    <div class="goodsItem">
       
           <a href="Good.html?id=6"><img src="images/201408/thumb_img/139_thumb_G_1409076470871.jpg" alt="棉立方2014秋新款韩版大码中长款白色宽松欧根纱上衣棉t恤女长袖" class="goodsimg" /></a><br />
           <p class="f1"><a href="Good.html?id=6" title="棉立方2014秋新款韩版大码中长款白色宽松欧根纱上衣棉t恤女长袖">棉立方2014秋新款韩版大码中长款白色宽松欧根纱上衣棉t恤女长袖</a></p>
           
           
 市场价：<font class="market">144元</font> <br/>
      
           本店价：<font class="f1">
                     110元                     </font>      
		    
        </div>
    <div class="goodsItem">
       
           <a href="Good.html?id=5"><img src="images/201408/thumb_img/138_thumb_G_1409076277153.jpg" alt="女式黑色韩版拉链纽扣口袋装饰拼接工艺千鸟格短外套OU3045" class="goodsimg" /></a><br />
           <p class="f1"><a href="Good.html?id=5" title="女式黑色韩版拉链纽扣口袋装饰拼接工艺千鸟格短外套OU3045">女式黑色韩版拉链纽扣口袋装饰拼接工艺千鸟格短外套OU3045</a></p>
           
           
 市场价：<font class="market">381元</font> <br/>
      
           本店价：<font class="f1">
                     351元                     </font>      
		    
        </div>
    <div class="goodsItem">
       
           <a href="Good.html?id=4"><img src="images/201408/thumb_img/137_thumb_G_1409076145687.jpg" alt="天猫独家发售预售呛口小辣椒糖果色甜美系带长袖薄衬衫女6114009C" class="goodsimg" /></a><br />
           <p class="f1"><a href="Good.html?id=4" title="天猫独家发售预售呛口小辣椒糖果色甜美系带长袖薄衬衫女6114009C">天猫独家发售预售呛口小辣椒糖果色甜美系带长袖薄衬衫女6114009C</a></p>
           
           
 市场价：<font class="market">237元</font> <br/>
      
           本店价：<font class="f1">
                     190元                     </font>      
		    
        </div>
   
    </div>
</div>
<div class="blank"></div>
  <div class="xm-box">
<h4 class="title"><span>热卖商品</span> <a class="more" href="Search.html?">更多</a></h4>
<div class="blank"></div>
<div id="show_hot_area" class="clearfix">
      <div class="goodsItem">
       
           <a href="Good.html?id=2"><img src="images/201312/thumb_img/134_thumb_G_1386627874181.jpg" alt="女式两色通勤韩版两件套条纹长袖T恤TK3303" class="goodsimg" /></a><br />
           <p class="f1"><a href="Good.html?id=2" title="女式两色通勤韩版两件套条纹长袖T恤TK3303">女式两色通勤韩版两件套条纹长袖T恤TK3303</a></p>
           
           
 市场价：<font class="market">201元</font> <br/>
      
           本店价：<font class="f1">
                     220元                     </font>      
		    
        </div>
    <div class="goodsItem">
       
           <a href="Good.html?id=1"><img src="images/201408/thumb_img/140_thumb_G_1409076056693.jpg" alt="衬衫粉红大布娃娃2014秋新 白色拼蕾丝立体蝴蝶结长袖衬衫 女" class="goodsimg" /></a><br />
           <p class="f1"><a href="Good.html?id=1" title="衬衫粉红大布娃娃2014秋新 白色拼蕾丝立体蝴蝶结长袖衬衫 女">衬衫粉红大布娃娃2014秋新 白色拼蕾丝立体蝴蝶结长袖衬衫 女</a></p>
           
           
 市场价：<font class="market">336元</font> <br/>
      
           本店价：<font class="f1">
                     430元                     </font>      
		    
        </div>
    <div class="goodsItem">
       
           <a href="Good.html?id=7"><img src="images/201408/thumb_img/141_thumb_G_1409076369744.jpg" alt="女米白色韩版春装新款条纹镂空开衫针织衫MQ3160" class="goodsimg" /></a><br />
           <p class="f1"><a href="Good.html?id=7" title="女米白色韩版春装新款条纹镂空开衫针织衫MQ3160">女米白色韩版春装新款条纹镂空开衫针织衫MQ3160</a></p>
           
           
 市场价：<font class="market">309元</font> <br/>
      
           本店价：<font class="f1">
                     200元                     </font>      
		    
        </div>
    <div class="goodsItem">
       
           <a href="Good.html?id=5"><img src="images/201408/thumb_img/138_thumb_G_1409076277153.jpg" alt="女式黑色韩版拉链纽扣口袋装饰拼接工艺千鸟格短外套OU3045" class="goodsimg" /></a><br />
           <p class="f1"><a href="Good.html?id=5" title="女式黑色韩版拉链纽扣口袋装饰拼接工艺千鸟格短外套OU3045">女式黑色韩版拉链纽扣口袋装饰拼接工艺千鸟格短外套OU3045</a></p>
           
           
 市场价：<font class="market">381元</font> <br/>
      
           本店价：<font class="f1">
                     351元                     </font>      
		    
        </div>
    <div class="goodsItem">
       
           <a href="Good.html?id=3"><img src="images/201408/thumb_img/136_thumb_G_1409076772989.jpg" alt="花噜噜2014秋装新款女装修身西服中长款单扣长袖小西装蕾丝外套潮" class="goodsimg" /></a><br />
           <p class="f1"><a href="Good.html?id=3" title="花噜噜2014秋装新款女装修身西服中长款单扣长袖小西装蕾丝外套潮">花噜噜2014秋装新款女装修身西服中长款单扣长袖小西装蕾丝外套潮</a></p>
           
           
 市场价：<font class="market">144元</font> <br/>
      
           本店价：<font class="f1">
                     150元                     </font>      
		    
        </div>
   
    </div>
</div>
<div class="blank"></div>

<div class="xm-box">
<h4 class="title"><span>精品推荐</span> <a class="more" href="Search.html?">更多</a></h4>
<div class="blank"></div>
<div id="show_best_area" class="clearfix">
  <div class="goodsItem">
       
           <a href="Good.html?id=2"><img src="images/201312/thumb_img/134_thumb_G_1386627874181.jpg" alt="女式两色通勤韩版两件套条纹长袖T恤TK3303" class="goodsimg" /></a><br />
           <p class="f1"><a href="Good.html?id=2" title="女式两色通勤韩版两件套条纹长袖T恤TK3303">女式两色通勤韩版两件套条纹长袖T恤TK3303</a></p>
           
           
 市场价：<font class="market">201元</font> <br/>
      
           本店价：<font class="f1">
                     220元                     </font>      
		    
        </div>
    <div class="goodsItem">
       
           <a href="Good.html?id=1"><img src="images/201408/thumb_img/140_thumb_G_1409076056693.jpg" alt="衬衫粉红大布娃娃2014秋新 白色拼蕾丝立体蝴蝶结长袖衬衫 女" class="goodsimg" /></a><br />
           <p class="f1"><a href="Good.html?id=1" title="衬衫粉红大布娃娃2014秋新 白色拼蕾丝立体蝴蝶结长袖衬衫 女">衬衫粉红大布娃娃2014秋新 白色拼蕾丝立体蝴蝶结长袖衬衫 女</a></p>
           
           
 市场价：<font class="market">336元</font> <br/>
      
           本店价：<font class="f1">
                     430元                     </font>      
		    
        </div>
    <div class="goodsItem">
       
           <a href="Good.html?id=2"><img src="images/201408/thumb_img/141_thumb_G_1409076369744.jpg" alt="女米白色韩版春装新款条纹镂空开衫针织衫MQ3160" class="goodsimg" /></a><br />
           <p class="f1"><a href="Good.html?id=2" title="女米白色韩版春装新款条纹镂空开衫针织衫MQ3160">女米白色韩版春装新款条纹镂空开衫针织衫MQ3160</a></p>
           
           
 市场价：<font class="market">309元</font> <br/>
      
           本店价：<font class="f1">
                     200元                     </font>      
		    
        </div>
    <div class="goodsItem">
       
           <a href="Good.html?id=5"><img src="images/201408/thumb_img/138_thumb_G_1409076277153.jpg" alt="女式黑色韩版拉链纽扣口袋装饰拼接工艺千鸟格短外套OU3045" class="goodsimg" /></a><br />
           <p class="f1"><a href="Good.html?id=5" title="女式黑色韩版拉链纽扣口袋装饰拼接工艺千鸟格短外套OU3045">女式黑色韩版拉链纽扣口袋装饰拼接工艺千鸟格短外套OU3045</a></p>
           
           
 市场价：<font class="market">381元</font> <br/>
      
           本店价：<font class="f1">
                     351元                     </font>      
		    
        </div>
    <div class="goodsItem">
       
           <a href="Good.html?id=3"><img src="images/201408/thumb_img/136_thumb_G_1409076772989.jpg" alt="花噜噜2014秋装新款女装修身西服中长款单扣长袖小西装蕾丝外套潮" class="goodsimg" /></a><br />
           <p class="f1"><a href="Good.html?id=3" title="花噜噜2014秋装新款女装修身西服中长款单扣长袖小西装蕾丝外套潮">花噜噜2014秋装新款女装修身西服中长款单扣长袖小西装蕾丝外套潮</a></p>
           
           
 市场价：<font class="market">144元</font> <br/>
      
           本店价：<font class="f1">
                     150元                     </font>      
		    
        </div>
   
    </div>
</div>
<div class="blank"></div>



  </div> 
  
    </div>
  <!--right end-->
  
 
<%@ include file="footer.jsp" %>


</body>
</html>

