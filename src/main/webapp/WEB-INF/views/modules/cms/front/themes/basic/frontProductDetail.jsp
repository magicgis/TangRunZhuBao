<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>产品详情</title>
    <meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${site.description}" />
	<meta name="keywords" content="${site.keywords}" />
	<!-- 只有产品详情中才用到 -->
    <script src="${ctxStatic}/common/jquery.jqzoom.js"></script>
	<script>
	    function preview(img){
	        $("#preview .jqzoom img").attr("src",$(img).attr("src"));
	        $("#preview .jqzoom img").attr("jqimg",$(img).attr("bimg"));
	    }
	    //图片放大镜效果
	    $(function(){
	        $(".jqzoom").jqueryzoom({xzoom:560,yzoom:380});
	    });
	
	    //图片预览小图移动效果,页面加载时触发
	    $(function(){
	        var tempLength = 0; //临时变量,当前移动的长度
	        var viewNum = 4; //设置每次显示图片的个数量
	        var moveNum = 1; //每次移动的数量
	        var moveTime = 0; //移动速度,毫秒
	        var scrollDiv = $(".spec-scroll .items ul"); //进行移动动画的容器
	        var scrollItems = $(".spec-scroll .items ul li"); //移动容器里的集合
	        var moveLength = scrollItems.eq(0).width() * moveNum; //计算每次移动的长度
	        var countLength = (scrollItems.length - viewNum) * scrollItems.eq(0).width(); //计算总长度,总个数*单个长度
	
	        //下一张
	        $(".spec-scroll .next").bind("click",function(){
	            if(tempLength < countLength){
	                if((countLength - tempLength) > moveLength){
	                    scrollDiv.animate({left:"-=" + moveLength + "px"}, moveTime);
	                    tempLength += moveLength;
	                }else{
	                    scrollDiv.animate({left:"-=" + (countLength - tempLength) + "px"}, moveTime);
	                    tempLength += (countLength - tempLength);
	                }
	            }
	        });
	        //上一张
	        $(".spec-scroll .prev").bind("click",function(){
	            if(tempLength > 0){
	                if(tempLength > moveLength){
	                    scrollDiv.animate({left: "+=" + moveLength + "px"}, moveTime);
	                    tempLength -= moveLength;
	                }else{
	                    scrollDiv.animate({left: "+=" + tempLength + "px"}, moveTime);
	                    tempLength = 0;
	                }
	            }
	        });
	    });
	    
	    /* 添加收  和 取消收藏 */
	    function addCollection(productId){
	    	//星号变色
	    	
	    	//修改数据库表中的字段,并插入到数据库表中
	    	
	    }
	</script>
	
</head>
<body>
	<%@ include file="/WEB-INF/views/modules/cms/front/include/title.jsp"%>

    <div class="good-top">
        <div class="wrapper clearfix">
            <div class="good-top-box clearfix">

                <div class="good-top-swiper" style="">
						<c:set var="imageShare2" scope="session" value="${fnp:getImageByPath(product.imageShare2)}"/>
						<c:set var="imageShare3" scope="session" value="${fnp:getImageByPath(product.imageShare3)}"/>
						
                        <div id="preview" class="spec-preview">
                            <span class="jqzoom">
                                <img jqimg="<c:out value="${imageShare3.get(0)}"/>" src="<c:out value="${imageShare2.get(0)}"/>" alt="" width="100%" height="383">
<%--                                 <img jqimg="${ctxStatic}/modules/cms/front/themes/basic/uploads/timgb.jpg" src="${ctxStatic}/modules/cms/front/themes/basic/uploads/timgs.jpg" alt="" width="100%" height="383"> --%>
                            </span>
                        </div>
                        <!--缩图开始-->
                        <div class="spec-scroll"> 
	                        <a class="prev"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/good-arrow-left.png" alt=""></a> 
	                        <a class="next"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/good-arrow-right.png" alt=""></a>
                            <div class="items">
                                <ul>
                                	<!-- 用重复的图片5张，实际用4张 容易报错 -->
                                    <li><img bimg="<c:out value="${imageShare3.get(0)}"/>" src="<c:out value="${imageShare2.get(0)}"/>" onmousemove="preview(this);"></li>
                                    <li><img bimg="<c:out value="${imageShare3.get(1)}"/>" src="<c:out value="${imageShare2.get(1)}"/>" onmousemove="preview(this);"></li>
                                    <li><img bimg="<c:out value="${imageShare3.get(2)}"/>" src="<c:out value="${imageShare2.get(2)}"/>" onmousemove="preview(this);"></li>
                                    <li><img bimg="<c:out value="${imageShare3.get(3)}"/>" src="<c:out value="${imageShare2.get(3)}"/>" onmousemove="preview(this);"></li>
                                    <li><img bimg="<c:out value="${imageShare3.get(0)}"/>" src="<c:out value="${imageShare2.get(0)}"/>" onmousemove="preview(this);"></li>
                                </ul>
                            </div>
                        </div>

                </div>
                <div class="good-introduce">
                    <h2 class="title">${product.name}</h2>
                    <p class="look-num">
                        <span style="float:left;">
	                        <i class="ico">
	                            <img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/eye.png" alt="">
	                        </i>
	                       	 浏览次数： ${product.hits}次
                       	</span>
                       	<a href="javascript:addCollection('${product.id}');" style="float:right;color:#2a2a2a;">
	                        <i class="ico">
	                            <img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/star.png" alt="" title="点我收藏">
	                        </i>
	                        	收藏产品：2人气
                        </a>
                    </p>
                    <ul class="specifications">
                        <li class="item">
                            <p class="labeli">产品尺寸: </p>
                            <p class="info"> ${product.size}(mm)</p>
                        </li>
                        <li class="item">
                            <p class="labeli">产品材质: </p>
                            <p class="info">${fns:getDictLabel(product.productMaterial, 'product_material', '')}</p>
                        </li>
                        <li class="item">
                            <p class="labeli">产品工艺: </p>
                            <p class="info"> ${product.technology}</p>
                        </li>
                    </ul>
                    <div class="service-commitment">
                        <span class="stitle">
                            服务承诺
                        </span>
                        <span class="item">
                            <i class="ico"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/wu.png" alt=""></i>
                            物流保障
                        </span>
                        <span class="item">
                            <i class="ico"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/xin.png" alt=""></i>
                            信誉保障
                        </span>
                        <span class="item">
                            <i class="ico"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/zheng.png" alt=""></i>
                           正品保障
                        </span>
                    </div>
                    <div class="handle">
                    	<!-- 跳转到淘宝页面 -->
                        <a href="" class="go-buy">立即购买</a>
                        <a href="" class="contact-customer">联系客服</a>
                    </div>
                    <!-- 二维码 图片-->
                    <div class="code-wrap">
                        <span class="code-img"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/qqimg1.jpg" alt=""></span>
                        <span class="code-img"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/qqimg2.jpg" alt=""></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="good-detail">
        <div class="wrapper">
            <div class="good-detail-box">
                <div class="column-head">
                    <h3 class="title">
                        <span class="arrow"></span>
                       	 商品详情
                    </h3>
                </div>
                <div class="column-item">
                    <ul class="column-item-list">
                        <li><span class="title">【上市时间】</span> <fmt:formatDate value="${product.timeToMarket}" type="both" pattern="yyyy-MM-dd"/> </li>
                        <li><span class="title">【优化处理方式】</span>${fns:getDictLabel(product.optimalProcessingMethod, 'optimalProcessingMethod', '')}</li>
                        <li><span class="title">【是否商场同款】</span>${fns:getDictLabel(product.sameToMarket, 'sameToMarket', '')}</li>
                        <li><span class="title">【种地类型】</span>${fns:getDictLabel(product.productSpeciescolor, 'product_speciescolor', '')} </li>
                        <li><span class="title">【鉴定标识】</span>${product.identificationMark}</li>
                        <li><span class="title">【鉴定类别】</span>${fns:getDictLabel(product.identificationCategory, 'identificationCategory', '')}</li>
                        <li><span class="title">【认证标识】</span>${product.certificationMark}</li>
                        <li><span class="title">【销售渠道类型】</span>${product.salesChannelType}</li>
                        <li><span class="title">【图案/形状】</span>${product.patternShape}</li>
                        <li><span class="title">【镶嵌材质】</span>${product.mosaicMaterial}</li>
                        <li><span class="title">【品牌】</span>${product.brand}</li>
                        <li><span class="title">【货号】</span>${product.freightNumber}</li>
                        <li><span class="title">【价格】</span>${product.price}</li>
                        <li><span class="title">【类别】</span>${fns:getDictLabel(product.productCategory, 'product_category', '')}</li>  
                    </ul>
                </div>
                
                
                <!-- 
                	或者使用工具类来做  传入相关字段，使用split来分割，返回到页面list
                	超过2个则使用<br/>来换行，使用index来判断
                	${product.imageShare4}
                -->
                <div class="column-detail-wrap">
      	            <c:forEach items="${fnp:getImageByPath(product.imageShare4)}" var="tempImage" varStatus="status">
			            <c:if test="${status.index}==1">
			            	<br/>
			            </c:if>
			            <img src="${tempImage}" alt="">
		           	</c:forEach>
                </div>
            </div>
            
            <div class="guess-you-like">
                <div class="guess-you-title">
                   	 猜你喜欢
                </div>
                <div class="guess-you-swiper">
                    <div class="swiper-container guess-swiper-container2">
                        <div class="swiper-wrapper">
                           	<!-- 使用工具类的热门产品   8个产品 -->
                            <c:forEach items="${fnp:getHotProductList(site.id,'0',8)}" var="hotProduct">
	                            <div class="swiper-slide">
	                                <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${hotProduct.id}">
	                                	<span class="img"><img src="${hotProduct.imageEmeraldNephrite1}" alt=""></span>
	                                </a>
	                                <p class="title">${hotProduct.name}</p>
	                            </div>	
	                    	</c:forEach>
                        </div>
                        <!-- Add Pagination -->
                        <div class="swiper-button-next swiper-button-white"></div>
                        <div class="swiper-button-prev swiper-button-white"></div>
                    </div>

                </div>
            </div>
        </div>
    </div>

<script>
    var swiper2 = new Swiper('.guess-swiper-container2', {
    	 slidesPerView: 5,
         spaceBetween: 50,
         loop:true,
         // init: false,
         pagination: {
             el: '.swiper-pagination',
             clickable: true,
         },
         navigation: {
             nextEl: '.swiper-button-next',
             prevEl: '.swiper-button-prev',
         },
         breakpoints: {
             1024: {
                 slidesPerView: 4,
                 spaceBetween: 40,
             },
             768: {
                 slidesPerView: 3,
                 spaceBetween: 30,
             },
             640: {
                 slidesPerView: 2,
                 spaceBetween: 20,
             },
             320: {
                 slidesPerView: 1,
                 spaceBetween: 10,
             }
         }
   
    });
    </script>
</body>

</html>