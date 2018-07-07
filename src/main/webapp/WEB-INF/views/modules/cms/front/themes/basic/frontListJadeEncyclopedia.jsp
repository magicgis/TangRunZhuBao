<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>玉器百科</title>
    <meta name="decorator" content="cms_default_${site.theme}"/>
    <!-- <meta name ="keywords" content="Jewellery,Jades,Emerald,Nephrite,唐润珠宝,珠宝,玉器师,翡翠,和田玉">
	<meta name="description" content="唐润珠宝是一家以经营翡翠为主，集原料采购、研发设计、雕刻加工、批发零售、自营加盟连锁为一体的专业珠宝运营公司"> -->
	<meta name="description" content="${site.description}" />
	<meta name="keywords" content="${site.keywords}" />
	<script type="text/javascript">
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
	    	return false;
	    }
		
		/*到达详情页面*/
	    function reachDetail(id){
	    	var usuff = "${fns:getUrlSuffix()}";
	    	$.ajax({
			   type: "POST",
			   url: ctx+"/frontJadesEncyclopediaDetail"+usuff,
			   data: {"id":id},
			   success: function(msg){
				   $(".news-list").html(msg);
			   }
			});
			return false;	
		}
	</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/modules/cms/front/include/title.jsp"%>
    <div class="column-banner">
        <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/img (27).jpg" alt="">
    </div>

    <div class="list-column clearfix">
        <div class="wrapper">
            <div class="site-crumbs clearfix">
                <a href="javascript:;">首页</a>
                <span class="arrow">&gt;</span>
                <a href="javascript:;" class="active">玉器百科</a>
            </div>
            
           	<form:form id="searchForm" modelAttribute="article" action="${ctx}/list-${category.id}${urlSuffix}" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
			</form:form>
            
            <div class="news-list clearfix">
                
                <c:forEach items="${page.list}" var="article">
	                <div class="news-item clearfix">
	                    <a href="javascript:reachDetail('${article.id}');">
	                        <span class="img"><img src="${article.image}" alt=""></span>
	                        <span class="title">${article.title}</span>
	                        <span class="subtitle">${article.description}……</span>
	                    </a>
	                </div>
                </c:forEach>  
                
                <div class="pagination">${page}</div>
                
            </div>
            
            <div class="news-side">
                <div class="side-swpier">
                    <div class="column-title">
                        <span class="line"></span>
                        <span class="name">翡翠鉴赏</span>
                    </div>
                    <div class="figure clearfix" id="side-scroll">
                        <ul class="scroll-wrap">
                            <c:forEach items="${page.list}" var="article">
				                <li>
	                                <span class="img"><img src="${article.image}" alt=""></span>
	                                <span class="text">${article.keywords}</span>
	                            </li>
			                </c:forEach>
                        </ul>
                        <div class="nav">
                           <!-- <a href="" class="active"></a>
                            <a href=""></a>
                            <a href=""></a>
                            <a href=""></a>-->
                        </div>
                    </div>
                    <script>
					    /*
					     * 侧边图片轮播
					     * */
					    var imgnum = $("#side-scroll .scroll-wrap li").length;
					    var str='';
					    for(var i = 0;i<imgnum;i++){
					        str+=' <a href=""></a>';
					    }
					    $(".nav").append(str);
					    $('.nav a:eq(0)').addClass('active');
					    $('#side-scroll .scroll-wrap li:eq(0)').css({'z-index':'2','opacity':'1'});
					    var index = 0;
					    setInterval(function(){
					        if(index<imgnum-1){
					            index++;
					        }else{
					            index=0;
					        }
					        $('.nav a').removeClass('active');
					        $('.nav a:eq('+index+')').addClass('active');
					        $('#side-scroll .scroll-wrap li').css({'z-index':'0','opacity':'.5'});
					        $('#side-scroll .scroll-wrap li:eq('+index+')').css('z-index','2').animate({'opacity':'1'});;
					        $('#side-scroll .scroll-wrap li:eq('+index+')')
					    },3000);
					</script>
                </div>
                <div class="side-list">
                    <div class="column-title">
                        <span class="line"></span>
                        <span class="name">翡翠鉴赏</span>
                    </div>
                    <ul class="lists">
                    	
                    	<c:forEach items="${articleHotList}" var="articleHot" varStatus="status">
			                 <c:choose>
			                 	<c:when test="${status.index==0 || status.index==1 || status.index==2}">
			                 		<li><a href="javascript:reachDetail('${articleHot.id}');"><span class="num active">${status.index+1}</span><span class="text">${articleHot.title}</span></a></li>
			                 	</c:when>
			                 	<c:otherwise>
			                 		<li><a href="javascript:reachDetail('${articleHot.id}');"><span class="num">${status.index+1}</span><span class="text">${articleHot.title}</span></a></li>
			                 	</c:otherwise>
			                 </c:choose>
		                </c:forEach>
		                
                        
                    </ul>
                </div>
                
            </div>
        </div>
    </div>
    
</body>


</html>
