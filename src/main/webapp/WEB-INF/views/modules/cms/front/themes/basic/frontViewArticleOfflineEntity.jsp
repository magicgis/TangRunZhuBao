<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>线下实体店</title>
    <meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${site.description}" />
	<meta name="keywords" content="${site.keywords}" />
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=HgTNrnm3WtDMK8EncNsbWdfOekLNN1u5"></script>
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
            <div id="offline-map" class="offline-map">
                <%-- <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/map.jpg" /> --%>
            </div>
            <script type="text/javascript">
				// 百度地图API功能
				var map = new BMap.Map("offline-map");    // 创建Map实例
				map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);  // 初始化地图,设置中心点坐标和地图级别
				//添加地图类型控件
				map.addControl(new BMap.MapTypeControl({
					mapTypes:[
			            BMAP_NORMAL_MAP,
			            BMAP_HYBRID_MAP
			        ]}));	  
				map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
				map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
			</script>
			
			
			${article.articleData.content}	
        </div>
    </div>
	
</body>
</html>
