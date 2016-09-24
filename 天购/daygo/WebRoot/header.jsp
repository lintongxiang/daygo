<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
var process_request = "正在处理您的请求...";
</script>
<script type="text/javascript">
//收藏本站 bbs.ecmoban.com
function AddFavorite(title, url) {
  try {
      window.external.addFavorite(url, title);
  }
catch (e) {
     try {
       window.sidebar.addPanel(title, url, "");
    }
     catch (e) {
         alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
     }
  }
}
</script>
<div id="toolbar">
  <div class="heaTop w">
      <div class="f_l">
      <a href="index.jsp" class="shouye">返回首页</a> 
   <script src="js/jquery-1.9.1.min.js"></script>
  <script src="js/jquery.json-2.3.min.js"></script>
  <script src="js/transport.js"></script>
  <script src="js/utils.js"></script>
  <script src="js/jquery.SuperSlide.2.1.1.js"></script>
   <span class="heaHalving"> 
      <!--{if $navigator_list.top}--> 
      <!-- {foreach name=nav_top_list from=$navigator_list.top item=nav} --> 
      <a href="ShoppingCart.html" >查看购物车</a>    
                    
   
       <!-- {if !$smarty.foreach.nav_top_list.last} -->
             
            <!-- {/if} -->
      <!-- {/foreach} --> 
      <!-- {/if} --> 
      </span>
        </div>
        
        <div class="f_r">
        <c:if test="${sessionScope.username != null}"><font id="ECS_MEMBERZONE" class="f_l">欢迎您！&nbsp;&nbsp;
<span id="topLoginDiv" class="heaTopHighlight" style="display:inline-block;">
<a href="UserCenter.html" class="bgNone" target="_blank" >${sessionScope.username} </a><a href="Logout.html" class="popHover">注销</a>
<a href="Login.html?action=reg" target="_blank"  class="popHover">注册</a>
</span>
</font></c:if>
        <c:if test="${sessionScope.username == null}"> <font id="ECS_MEMBERZONE" class="f_l">欢迎光临本店！&nbsp;&nbsp;
<span id="topLoginDiv" class="heaTopHighlight" style="display:inline-block;">
<a href="Login.html?action=login" class="bgNone" target="_self">请登录</a><a href="Login.html?action=reg" target="_blank"  class="popHover">注册</a>
</span>
</font></c:if>
        
         <div class="f_l">
          <p class="weixin f_l">
           <a href="#" class="wei" onmouseover="this.className='wei wei_on'" onmouseout="this.className='wei'">手机版
           <img src="css/images/qrcode_for_hd.jpg"></a></p> <p class="weixin f_l">
           
         </div>
         
        </div> 
     </div>
</div>    
<div id="head">
    <div class="hd">
            <p class="heaLogo f_l"> <a href="index.jsp" target="_parent" title="天购" > 
            <img src="css/images/dglogo.png" alt="天购"></a> </p>
            <div class="hd_search f_l">
                <div class="tab_search ">
                   <!--search start-->
                    <div id="search"  class="clearfix">
                      <form id="searchForm" name="searchForm" method="get" action="Search.html" onSubmit="return checkSearchForm()" class="f_r">
                       <input name="key" type="text" id="searchinput" value="" class="f_l searchinput" />
                       <input name="imageField" type="submit" value="搜索" class="searchbtn" style="cursor:pointer; border:none" />
                       </form>
                       <div class="keys f_l">
                       <script type="text/javascript">
        
                
                        function checkSearchForm()
                        {
                            if(document.getElementById('searchinput').value)
                            {
                                return true;
                            }
                            else
                            {
                                alert("请输入搜索关键词！");
                                return false;
                            }
                        }
            
       
                        </script>
                        
                       <font>热门搜索 ：</font>
                                              <a href="Search.html?key=秋装新品"><span>秋装新品</span></a>
                                              <a href="Search.html?key=打底衫">打底衫</a>
                                              <a href="Search.html?key=开衫">开衫</a>
                                              <a href="Search.html?key=衬衫">衬衫</a>
                                              <a href="Search.html?key=连衣裙"><span>连衣裙</span></a>
                                              <a href="Search.html?key=小脚牛仔裤">小脚牛仔裤</a>
                                              <a href="Search.html?key=女鞋">女鞋</a>
                                              <a href="Search.html?key=配饰">配饰</a>
                      
                      </div>
                       
                    </div>
                    <!--search end-->
                </div>
            </div>
            
            
</div>         
 
</div>
<!--主导航开始-->
<div id="heaNav">
       <h2 class="menu-title">商品服务分类</h2>
        <div class="bd">
        <p class="heaNavOnly"> <a href="index.jsp" class="cur">
    首页</a> </p>
         <ul class="heaNavNone">
                    <li class="heaNav" onmouseover="this.className='heaNav heaNav_on'" onmouseout="this.className='heaNav'" 
    
    > <a  class="aaa" target="_blank" href="Search.html?category=女装"     
    
    title="女装/内衣">女装</a> </li>
                    <li class="heaNav" onmouseover="this.className='heaNav heaNav_on'" onmouseout="this.className='heaNav'" 
    
    > <a  class="aaa" target="_blank" href="Search.html?category=男装"     
    
    title="男装/运动户外">男装</a> </li>
                    <li class="heaNav" onmouseover="this.className='heaNav heaNav_on'" onmouseout="this.className='heaNav'" 
    
    > <a  class="aaa" target="_blank" href="Search.html?category=母婴玩具"     
    
    title="母婴玩具">母婴玩具</a> </li>
                    <li class="heaNav" onmouseover="this.className='heaNav heaNav_on'" onmouseout="this.className='heaNav'" 
    
    > <a  class="aaa" target="_blank" href="Search.html?category=女鞋"     
    
    title="女鞋/男鞋/箱包">女鞋</a> </li>
                    <li class="heaNav" onmouseover="this.className='heaNav heaNav_on'" onmouseout="this.className='heaNav'" 
    
    > <a  class="aaa" target="_blank" href="Search.html?category=食品"     
    
    title="食品">食品</a> </li>
                    <li class="heaNav" onmouseover="this.className='heaNav heaNav_on'" onmouseout="this.className='heaNav'" 
    
    > <a  class="aaa" target="_blank" href="Search.html?category=手机数码"     
    
    title="手机数码">手机数码</a> </li>
                    <li class="heaNav" onmouseover="this.className='heaNav heaNav_on'" onmouseout="this.className='heaNav'" 
    
    > <a  class="aaa" target="_blank" href="Search.html?category=家居"     
    
    title="家居">家居</a> </li>
                  </ul>
      </div>
  </div>
<!--主导航结束-->
