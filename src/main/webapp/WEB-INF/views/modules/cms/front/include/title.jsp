<%@ page contentType="text/html;charset=UTF-8"%><!-- 防止中文乱码 -->
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!-- 
<script type="text/javascript">
	/*  点击title导航之后字体变色    */
	$(function(){
	    $(".site-menu .wrapper .menu-list li").click(function(){
	        $(".site-menu .wrapper .menu-list li .title").removeClass('titleChangeColor');
	        $(this).addClass('titleChangeColor');
	    })
	    $(".min-site-menu ul li").click(function(){
	        $(".min-site-menu ul li").removeClass('titleChangeColor');
	        $(this).addClass('titleChangeColor');
	    })
	})
</script> -->

<!-- 大屏幕和正常的屏幕显示的菜单  -->
<div class="site-menu">
     <div class="wrapper">
         <ul class="menu-list">
          	<li>
	         	<a href="${ctx}/index-1${fns:getUrlSuffix()}">
	         		<span class="title">${site.id eq '1'?'首　 页':'返回主站'}</span>
                    <span class="second"><i class="text">${site.id eq '1'?'THE&nbsp;HOME':'RETURN STATION'}</i></span>
	         	</a>
         	</li>
       	 	<li>
                <a href="${ctx}/frontProductList${fns:getUrlSuffix()}" title="产品专栏">
                    <span class="title">产品专栏</span>
                    <span class="second"><i class="text">PRODUCT&nbsp;COLUMN</i></span>
                </a>
            </li>
       	 	<c:forEach items="${fnc:getMainNavList(site.id)}" var="category" varStatus="status">
				<c:if test="${status.index lt 10}">
		    		<li>
			    		<a href="${category.url}" title="${category.name}" target="${category.target}">
		                    <span class="title">${category.name}</span>
		                    <span class="second">
		                    	<i class="text">${category.description}</i>
		                    </span>
	                 	</a>
		    		</li>
		    	</c:if>
	    	</c:forEach>
         </ul>
     </div>
 </div>
<!-- 小屏幕显示的菜单  -->
<div class="min-site-menu" data-status="0">
    <ul>
        <li><a href="${ctx}/index-1${fns:getUrlSuffix()}">首页</a></li>
        <li><a href="">产品专栏</a></li>
        
        <c:forEach items="${fnc:getMainNavList(site.id)}" var="category" varStatus="status">
			<c:if test="${status.index lt 10}">
	    		<li><a href="${category.url}">${category.name}</a></li>
	    	</c:if>
    	</c:forEach>
        
<%--    <li><a href="">关于我们</a></li>
        <li><a href="">联系我们</a></li>
        <li><a href="${ctx}/frontJadeEncyclopedia">玉器百科</a></li>
        <li><a href="${ctx}/frontAttractInvestment">招商加盟</a></li>
        <li><a href="">线下实体店</a></li> --%>
    </ul>
</div>
