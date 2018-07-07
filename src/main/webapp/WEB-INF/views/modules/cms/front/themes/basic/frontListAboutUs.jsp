<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>集团概况 暂时没有用到；</title>
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
                    
                    <dd><a href="javascript:;" class="active">集团概况</a></dd>
                    <dd><a href="javascript:;">业务实力</a></dd>
                    <dd><a href="javascript:;">品牌文化</a></dd>
                    <dd><a href="javascript:;">签约玉器师</a></dd>
                    
                </dl>
            </div>
            <div class="column-body">
                <div class="column-nav">
                    <a href="">关于我们</a> 
                    <span class="ico"> -> </span>
                    <a href="">${article.title}</a>
                </div>
                <div class="group-profile">
                	${article.articleData.content}
                </div>   

            </div>
        
        </div>
    </div>
   
</body>
</html>
