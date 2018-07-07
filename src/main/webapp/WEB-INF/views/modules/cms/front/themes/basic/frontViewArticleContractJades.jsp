<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>合作玉器师</title>
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
                    <a href="">关于我们</a> 
                    <span class="ico"> -> </span>
                    <a href="">${category.name}</a>
                </div>
                <div class="column-con">
                
                
                    <div class="article-title">中国玉雕大师   加龙</div>
                    <div class="article-body">
                        <p>1972年生，天津人。海派最年轻的玉雕大师，“青藤玉舍”创始人崔磊。获得“中国工艺美术大师”、“中国玉石雕刻大师”、“中国玉石雕刻艺术家”、“高级工艺美术师”、“上海市非物质文化遗产项目代表性传承人”、“上海特级玉石雕刻大师”等称号。第五批国家级非物质文化遗产代表性项目代表性传承人。</p>
                        <p><img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/img (35).jpg" alt=""></p>
                        <p>1972年生，天津人。海派最年轻的玉雕大师，“青藤玉舍”创始人崔磊。获得“中国工艺美术大师”、“中国玉石雕刻大师”、“中国玉石雕刻艺术家”、“高级工艺美术师”、“上海市非物质文化遗产项目代表性传承人”、“上海特级玉石雕刻大师”等称号。第五批国家级非物质文化遗产代表性项目代表性传承人。</p>
                    </div>
                    <div class="article-handle clearfix">
                        <div class="article-nav">
                            <p><a href=""><span class="label">上一篇：</span>没有了</a></p>
                            <p><a href=""><span class="label">上一篇：</span>翡翠大师王国荣 珍品鉴赏</a></p>
                        </div>
                        <div class="article-share">
                            <a href="" class="share-ico"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/ico7.jpg" alt=""></a>
                            <a href="" class="share-ico"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/ico8.jpg" alt=""></a>
                            <a href="" class="share-ico"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/ico9.jpg" alt=""></a>
                            <a href="" class="share-ico"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/ico10.jpg" alt=""></a>
                            <a href="" class="share-ico"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/ico11.jpg" alt=""></a>
                        </div>
                    </div>
                    
                    
                    
                    
                </div>
            </div>
        </div>
    </div>

	
</body>
</html>
