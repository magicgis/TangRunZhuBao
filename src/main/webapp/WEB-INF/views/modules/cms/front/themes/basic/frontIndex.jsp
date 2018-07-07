<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>唐润珠宝</title>
    <meta name="decorator" content="cms_default_${site.theme}"/>
    <!-- <meta name ="keywords" content="Jewellery,Jades,Emerald,Nephrite,唐润珠宝,珠宝,玉器师,翡翠,和田玉">
	<meta name="description" content="唐润珠宝是一家以经营翡翠为主，集原料采购、研发设计、雕刻加工、批发零售、自营加盟连锁为一体的专业珠宝运营公司"> -->
	<meta name="description" content="${site.description}" />
	<meta name="keywords" content="${site.keywords}" />
	<script type="text/javascript">
		$(document).ready(function() {
			getFrontEmeraldListData("1","");
			getFrontNephriteListData("2","");
			getFrontDiamondListData("4","");
		});
		
		function getFrontEmeraldListData(productMaterial,productCategory){
			$.ajax({
			   type: "POST",
			   url: ctx+"/getFrontEmeraldListData",
			   data:{"productMaterial":productMaterial,"productCategory":productCategory},
			   success: function(msg){
				   $(".column-feicui-con").html(msg);
			   }
			});
			return false;
		}
		function getFrontNephriteListData(productMaterial,productCategory){
			$.ajax({
			   type: "POST",
			   url: ctx+"/getFrontNephriteListData",
			   data:{"productMaterial":productMaterial,"productCategory":productCategory},
			   success: function(msg){
				   $(".column-hetianyu-con").html(msg);
			   }
			});
			return false;
		}
		function getFrontDiamondListData(productMaterial,productCategory){
			$.ajax({
			   type: "POST",
			   url: ctx+"/getFrontDiamondListData",
			   data:{"productMaterial":productMaterial,"productCategory":productCategory},
			   success: function(msg){
				   $(".column-zuanshi-con").html(msg);
			   }
			});
			return false;
		}
		//暂时不用
		function reachNew(id){
			
			return false;
		}
		
	</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/modules/cms/front/include/title.jsp"%>

    <div class="swiper-container index-slider" >
        <div class="swiper-wrapper">
            <div class="swiper-slide">
               <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/index (1).jpg" > 
            </div>
            <div class="swiper-slide">
               <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/index (1).jpg" > 
            </div>
            <div class="swiper-slide">
              <%--   <img data-src="${ctxStatic}/modules/cms/front/themes/basic/uploads/index (1).jpg" class="swiper-lazy">
                <div class="swiper-lazy-preloader"></div>
              --%>
               <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/index (1).jpg" > 
            </div>
        </div>
        <div class="swiper-pagination"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    </div>
   
    <script type="text/javascript">
    	/*  点击“类别”导航之后颜色变色    */
	    $(function(){
	        $(".column-feicui-head .title-nav .link").click(function(){
	            $(".column-feicui-head .title-nav .link").removeClass('cur');
	            $(this).addClass('cur');
	        })
	        $(".column-hetianyu-head .title-nav .link").click(function(){
	            $(".column-hetianyu-head .title-nav .link").removeClass('cur');
	            $(this).addClass('cur');
	        })
	        $(".column-zuanshi-head .title-nav .link").click(function(){
	            $(".column-zuanshi-head .title-nav .link").removeClass('cur');
	            $(this).addClass('cur');
	        })
	    })
    	/*轮播插件*/
    	var mySwiper = new Swiper ('.swiper-container', {
	        autoplay:true,
	        direction: 'horizontal',
	        loop: true,
	        pagination: {
	            el: '.swiper-pagination',
	            type: 'bullets',
	        },
	        navigation: {
	            nextEl: '.swiper-button-next',
	            prevEl: '.swiper-button-prev',
	        }
	    })
	    
	    
	</script>
   <div class="feicui-content">
       <div class="column-feicui-head">
               <div class="wrapper">
                   <p class="title-01">JADEITE&nbsp;&nbsp;AREA</p>
                   <div class="title-02">
                       <div class="line line-l"></div>
                       <span class="title">翡翠专区</span>
                       <div class="line line-r"></div>
                   </div>
                   <div class="title-nav">
                       <dl>
                           <dd>
                               <a href="javascript:getFrontEmeraldListData('1','');" class="link">全部</a>
                               <span class="line">|</span>
                               
                               <c:forEach items="${fns:getDictList('product_category')}" var="productCategory">
	                    	   		<a href="javascript:getFrontEmeraldListData('1','${productCategory.value}');" class="link">${productCategory.label}</a>
                               		<span class="line">|</span>
	                    	   </c:forEach>
                               
                               <a href="${ctx}/frontProductList${fns:getUrlSuffix()}" class="more-link">更多<i class="ico arrow-right"></i></a>
                           </dd>
                       </dl>
                   </div>
            </div>
       </div>
       <div class="wrapper">
       	   <!-- 内容替换 -->
		   <div class="column-feicui-con">
		   </div>
       </div>

    </div>

    <div class="hetianyu-content">
      <div class="wrapper">
          <div class="column-hetianyu-head">
              <p class="title-01">HETIANY&nbsp;AREA</p>
              <div class="title-02">
                  <div class="line line-l"></div>
                  <span class="title">和田玉专区</span>
                  <div class="line line-r"></div>
              </div>
              <div class="title-nav">
                  <dl>
                      <dd>
                          <a href="javascript:getFrontNephriteListData('2','');" class="link">全部</a>
                          <span class="line">|</span>
                          <c:forEach items="${fns:getDictList('product_category')}" var="productCategory">
	                   	   		<a href="javascript:getFrontNephriteListData('2','${productCategory.value}');" class="link">${productCategory.label}</a>
	                            <span class="line">|</span>
	                   	  </c:forEach>
                          <a href="${ctx}/frontProductList${fns:getUrlSuffix()}" class="more-link">更多<i class="ico arrow-right"></i></a>
                      </dd>
                  </dl>
              </div>
          </div>
          <!-- 内容替换 -->
	      <div class="column-hetianyu-con clearfix">
	      
	      </div>
      
      </div>

  </div>
    <div class="zuanshi-content">
          <div class="wrapper">
              <div class="column-zuanshi-head">
                  <p class="title-01">DIAMOND&nbsp;AREA</p>
                  <div class="title-02">
                      <div class="line line-l"></div>
                      <span class="title">钻石专区</span>
                      <div class="line line-r"></div>
                  </div>
                  <div class="title-nav">
                      <dl>
                          <dd>
                               <a href="javascript:getFrontDiamondListData('4','');" class="link">全部</a>
                               <span class="line">|</span>
                               <c:forEach items="${fns:getDictList('product_category')}" var="productCategory">
		                   	   		<a href="javascript:getFrontDiamondListData('4','${productCategory.value}');" class="link">${productCategory.label}</a>
		                            <span class="line">|</span>
		                   	   </c:forEach>
                               <a href="${ctx}/frontProductList${fns:getUrlSuffix()}" class="more-link">更多<i class="ico arrow-right"></i></a>
                           </dd>
                      </dl>
                  </div>

              </div>
			  <!-- 内容替换的地方 -->
			  <div class="column-zuanshi-con">
			  
			  </div>
          </div>
      </div>

    <div class="valuator-content">
             <div class="wrapper clearfix" id="valuator-scroll">

                <a href="javascript:;" class="btn prev-btn"></a>
                 <div class="valuator-all clearfix">
                     
                     
                     <c:forEach items="${fnc:getArticleList('${site.id}','184b55386f5b464683cfb3ba8b65845d',5,'')}" var="articleJade">
                     	<div class="valuator-item clearfix">
	                         <div class="detail">
	                             <p class="title">${articleJade.title}</p>
	                             <p class="three">${articleJade.description}</p>
	                             </p>
	                         </div>
	                         <div class="face">
	                             <img src="${articleJade.image}" alt="">
	                         </div>
	                     </div>
                     </c:forEach>
                     
                     
                    <%-- 
                     <div class="valuator-item clearfix">
                         <div class="detail">
                             <p class="title">玉器石团队</p>
                             <p class="second">佳龙333 青年玉雕名家</p>
                             <p class="three">玉雕界签约名家中级工艺美术师 </p>
                             <p class="three">广东省揭阳职业技术学院外聘教师 </p>
                             <p class="three">广东省雕刻艺术研究会副会长 </p>
                             </p>
                         </div>
                         <div class="face">
                             <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/face3.jpg" alt="">
                         </div>
                     </div> --%>
                     
                 </div>

                <ul class="scroll-nav">
                     <li><a href="javascript:;" class="active"></a></li>
                     <li><a href="javascript:;"></a></li>
                     <li><a href="javascript:;"></a></li>
                 </ul>
                 <a href="javascript:;" class="btn next-btn"></a>
             </div>

         </div>

          <div class="recommend-content">
              <div class="wrapper">
                  <div class="recommend-top clearfix">
                      <div class="img">
                          <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/index (26).jpg" alt="">
                          <i class="light"></i>
                      </div>
                      <c:forEach items="${fnc:getArticleList('${site.id}','2',1,'orderBy: \"hits desc\"')}" var="articleNews">
                      	<div class="con">
                          <div class="title">${articleNews.title}</div>
                          <p class="handles">
	                          <span class="time"><fmt:formatDate value="${articleNews.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
	                          <span class="num">&nbsp;&nbsp;${articleNews.hits}次</span>
                          </p>
                          <div class="detail">${articleNews.description}......</div>
                          <!-- 跳转到玉器百科列表 直接写栏目  -->
                          <a href="${fnc:getCategory('2').url}" class="more">了解更多&gt;</a>
                      </div>
                      </c:forEach>
                  </div>
                  <div class="lists clearfix">
                      <c:forEach items="${fnc:getArticleList('${site.id}','2',3,'')}" var="articleNews">
                         <div class="box">
                          	 <!-- 顶多9个字符+...... -->
	                         <div class="title">${articleNews.title}</div>
	                         <div class="line"></div>
	                         <!-- 顶多81个字符+...... -->
	                         <div class="detail">${articleNews.description}</div>
	                     </div>
                      </c:forEach>
                  </div>
              </div>
          </div>
</body>


</html>