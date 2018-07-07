<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>玉器师列表</title>
  	<meta name="decorator" content="cms_default_${site.theme}"/>
    <!-- <meta name ="keywords" content="Jewellery,Jades,Emerald,Nephrite,唐润珠宝,珠宝,玉器师,翡翠,和田玉">
	<meta name="description" content="唐润珠宝是一家以经营翡翠为主，集原料采购、研发设计、雕刻加工、批发零售、自营加盟连锁为一体的专业珠宝运营公司"> -->
	<meta name="description" content="${site.description}" />
	<meta name="keywords" content="${site.keywords}" />
	<script type="text/javascript">
		/*  点击“类别”导航之后颜色变色    */
	    $(function(){
	        $(".wrapper .sidebar dd a").click(function(){
	            $(".wrapper .sidebar dd a").removeClass('active');
	            $(this).addClass('active');
	        })
	    })
	    /*到达详情页面*/
	    function reachDetail(id){
	    	var usuff = "${fns:getUrlSuffix()}";
	    	$.ajax({
			   type: "POST",
			   url: ctx+"/frontJadesDetail"+usuff,
			   data: {"id":id},
			   success: function(msg){
				   $(".column-list").remove();
				   $(".column-nav").append(msg);
			   }
			});
			return false;	
			
			
		}
	    
	</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/modules/cms/front/include/title.jsp"%>
    <div class="column-banner">
        <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/img (34).jpg" alt="">
    </div>
    <div class="page-column clearfix">
        <div class="wrapper">
            <div class="sidebar">
                <dl>
                	<dt>唐润集团</dt>
                    <!-- 关于我们下面的子栏目 -->
                    <c:forEach items="${categoryList}" var="cate" varStatus="status">
                    	<c:choose>
						   <c:when test="${cate.name ne category.name}">
						   	 <dd><a href="${cate.url}">${cate.name}</a></dd>
						   </c:when>
						   <c:otherwise>
						   	<dd><a href="${cate.url}" class="active">${cate.name}</a></dd>
						   </c:otherwise>
						</c:choose>
                    </c:forEach>
                </dl>
            </div>
            <div class="column-body">
                <div class="column-nav">
                    <a href="">关于我们</a> 
                    <span class="ico"> -> </span>
                    <a href="">${category.name}</a>
                </div>
                <!-- 列表的内容 -->
                <div class="column-list clearfix">
                    
                    <c:forEach items="${page.list}" var="article">
				        <div class="jade-division-item clearfix">
	                        <div class="face">
	                            <img src="${article.image}" alt="">
	                        </div>
	                        <div class="divison-info">
	                            <p class="names"><span class="name">${article.title}</span>
	                                <span class="level">${article.keywords}</span></p>
	                            <p class="info">
	                            	${article.description} ……
	                                
	                                <a href="javascript:reachDetail('${article.id}');" class="more">[详情]</a>
	                                
	                                <%-- <a href="${ctx}/frontJadesDetail${fns:getUrlSuffix()}?id=${article.id}" class="more">[详情]</a> --%>
	                            </p>
	                        </div>
	                    </div>
		           	</c:forEach>
		           	
               </div>
            </div>
        </div>
    </div>
	
</body>
</html>
