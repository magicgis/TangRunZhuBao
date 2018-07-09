<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>${article.title}</title>
    <meta name="decorator" content="cms_default_${site.theme}"/>
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
                    <a href="javascript:;">关于我们</a> 
                    <span class="ico"> -> </span>
                    <a href="javascript:;">${article.title}</a>
                </div>
                <div class="group-profile">
                	${article.articleData.content}
                </div>   

            </div>
        	
        </div>
    </div>
   
</body>
</html>
