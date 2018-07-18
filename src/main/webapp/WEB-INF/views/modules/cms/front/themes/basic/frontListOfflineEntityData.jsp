<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
         <!-- 等待地图插件 -->
         <div id="offline-map" class="offline-map">
             <%-- <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/map.jpg" /> --%>
         </div>
         <script type="text/javascript">
			// 百度地图API功能
			var map = new BMap.Map("offline-map");    // 创建Map实例
			map.centerAndZoom(new BMap.Point(113.65,34.76), 15);  // 初始化地图,设置中心点坐标和地图级别
			
			//添加地图类型控件
			map.addControl(new BMap.MapTypeControl({
				mapTypes:[
		            BMAP_NORMAL_MAP,
		            BMAP_HYBRID_MAP
		        ]}));	  
			//map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
			map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
			
			// 编写自定义函数,创建标注
			function addMarker(point){
			  var marker = new BMap.Marker(point);
			  map.addOverlay(marker);
			}
			
			//从后台获取数据放到map中
			
			
			
			/* 
			// 随机向地图添加25个标注
			var bounds = map.getBounds();
			var sw = bounds.getSouthWest();
			var ne = bounds.getNorthEast();
			var lngSpan = Math.abs(sw.lng - ne.lng);
			var latSpan = Math.abs(ne.lat - sw.lat);
			for (var i = 0; i < 25; i ++) {
				var point = new BMap.Point(sw.lng + lngSpan * (Math.random() * 0.7), ne.lat - latSpan * (Math.random() * 0.7));
				addMarker(point);
			} */
		</script>
		<ul class="offline-address clearfix">
			
			<c:forEach items="${page.list}" var="offlineEntity">
       			<li class="item">
					<span class="item-img"><img alt="" src="${offlineEntity.image}" /> </span>
					<div class="item-info">
						<h3 class="shop-name">
							${offlineEntity.name}</h3>
						<p class="shop-add" title="${offlineEntity.address}">
							${offlineEntity.address}</p>
						<p class="shop-tel" title="${offlineEntity.person}">
							${offlineEntity.person}</p>
						<p class="shop-tel" title="${offlineEntity.tel}">
							${offlineEntity.tel}</p>
					</div>
				</li>
           	</c:forEach>
           	
           	<!--
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
		<!-- 样式需要美化 ******功能待做****** -->
		<div class="pagination">${page}</div>
