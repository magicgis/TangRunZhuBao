
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>联系我们</title>
    <meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${site.description}" />
	<meta name="keywords" content="${site.keywords}" />
</head>
<body>
	<%@ include file="/WEB-INF/views/modules/cms/front/include/title.jsp"%>
	
    <div class="column-banner">
        <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/img (34).jpg" alt="">
    </div>

    <div class="personal-center clearfix">
        <div class="wrapper">
            <div class="personal-center-side">
                <div class="side-head">唐润集团</div>
            </div>
        </div>
    </div>

    <div class="Offline-entities">
        <div class="wrapper">
            <div class="offline-head">
                <p class="title-01">JADEITE&nbsp;&nbsp;AREA</p>
                <div class="title-02">
                    <div class="line line-l"></div>
                    <span class="title">${article.title}</span>
                    <div class="line line-r"></div>
                </div>
            </div>
            
            <!-- 等待地图插件 -->
            <div class="offline-map">
                <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/map.jpg" />
            </div>
            <!-- 数据展示 -->
            ${article.articleData.content}
            
        </div>
    </div>
	
</body>
</html>
