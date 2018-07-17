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
			
			<ul class="offline-address clearfix">
				
				
				
				
				
				<li class="item">
					<span class="item-img"><img alt="" src="/TangRunZhuBao/userfiles/1/images/cms/article/2018/06/addimg.png" /> </span>
					<div class="item-info">
						<h3 class="shop-name">
							唐润珠宝配货中心</h3>
						<p class="shop-add">
							Add：河南省郑州市金水东路7号鑫苑中央花园东区6号楼703号</p>
						<p class="shop-tel">
							Tel：15737100370</p>
					</div>
				</li>
				
				
				
				<!-- <li class="item">
					<span class="item-img"><img alt="" src="/TangRunZhuBao/userfiles/1/images/cms/article/2018/06/addimg.png" /> </span>
					<div class="item-info">
						<h3 class="shop-name">
							天下收藏店（河南郑州天下收藏店）</h3>
						<p class="shop-add">
							Add：河南省郑州市郑东新区天下收藏北区一楼1100号</p>
						<p class="shop-tel">
							Tel：15737100370</p>
					</div>
				</li>
				<li class="item">
					<span class="item-img"><img alt="" src="/TangRunZhuBao/userfiles/1/images/cms/article/2018/06/addimg.png" /> </span>
					<div class="item-info">
						<h3 class="shop-name">
							香港行政区店（九龙广东道珠宝街店）</h3>
						<p class="shop-add">
							Add：香港特别行政区九龙油麻地广东道珠宝街11号</p>
					</div>
				</li>
				<li class="item">
					<span class="item-img"><img alt="" src="/TangRunZhuBao/userfiles/1/images/cms/article/2018/06/addimg.png" /> </span>
					<div class="item-info">
						<h3 class="shop-name">
							上海徐家汇店（上海徐家汇宜山路店）</h3>
						<p class="shop-add">
							Add：上海市徐家汇宜山路店光启城12楼长昊集团唐润翡翠专柜</p>
					</div>
				</li>
				<li class="item">
					<span class="item-img"><img alt="" src="/TangRunZhuBao/userfiles/1/images/cms/article/2018/06/addimg.png" /> </span>
					<div class="item-info">
						<h3 class="shop-name">
							上海市闵行店（上海市闵行莘朱路店）</h3>
						<p class="shop-add">
							Add：上海市闵行区莘朱路415号02室艺术生活馆</p>
					</div>
				</li>
				<li class="item">
					<span class="item-img"><img alt="" src="/TangRunZhuBao/userfiles/1/images/cms/article/2018/06/addimg.png" /> </span>
					<div class="item-info">
						<h3 class="shop-name">
							湖北省荆州店（湖北荆州公安县店）</h3>
						<p class="shop-add">
							Add：湖北省荆州公安县鑫泰国际6号楼601</p>
					</div>
				</li>
				<li class="item">
					<span class="item-img"><img alt="" src="/TangRunZhuBao/userfiles/1/images/cms/article/2018/06/addimg.png" /> </span>
					<div class="item-info">
						<h3 class="shop-name">
							广东揭阳阳美店</h3>
						<p class="shop-add">
							Add：广东揭阳阳美八层楼A栋一楼102号</p>
					</div>
				</li>
				<li class="item">
					<span class="item-img"><img alt="" src="/TangRunZhuBao/userfiles/1/images/cms/article/2018/06/addimg.png" /> </span>
					<div class="item-info">
						<h3 class="shop-name">
							广东省揭阳阳美玉器街店</h3>
						<p class="shop-add">
							Add：广东省揭阳阳美玉器街2号铺3柜</p>
					</div>
				</li>
				<li class="item">
					<span class="item-img"><img alt="" src="/TangRunZhuBao/userfiles/1/images/cms/article/2018/06/addimg.png" /> </span>
					<div class="item-info">
						<h3 class="shop-name">
							深圳市福田区店（深圳福田皇城广场店）</h3>
						<p class="shop-add">
							Add：广东省深圳市福田区皇城广场西大厅一楼</p>
					</div>
				</li>
				<li class="item">
					<span class="item-img"><img alt="" src="/TangRunZhuBao/userfiles/1/images/cms/article/2018/06/addimg.png" /> </span>
					<div class="item-info">
						<h3 class="shop-name">
							广州市荔湾区店（广州市荔湾华林国际店）</h3>
						<p class="shop-add">
							Add：广东省广州市荔湾区华林国际长寿西路耀华东街17号10档</p>
					</div>
				</li> -->
			</ul>
			<p>
				&nbsp;</p>
			
			<%-- ${article.articleData.content}	 --%>
        </div>
    </div>
	
</body>
</html>
