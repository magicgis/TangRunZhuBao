<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
	<title><sitemesh:title default="欢迎光临"/> - ${site.title} </title>
	<%@include file="/WEB-INF/views/modules/cms/front/include/head.jsp" %>
	<sitemesh:head/>
</head>
<body>
<body>
	<div class="min-nav">
	    <div class="wrapper clearfix">
	        <div class="site-nav-l fl">
	            <span class="msg">欢迎来到唐润珠宝！</span>
	            <a href="${ctx}/frontMemberLogin${fns:getUrlSuffix()}" class="login-link">登录</a>
	            <span class="line">|</span>
	            <a href="${ctx}/frontMemberRegister${fns:getUrlSuffix()}" class="register-link">注册</a>
	        </div>
	        <div class="site-nav-r fr">
	            <a href="${ctx}/frontMemberCenterMyCollection${fns:getUrlSuffix()}" class="t-nav">我的收藏</a>
	            <span class="line">|</span>
	            <a href="${ctx}/frontMemberCenterPersonalInfo${fns:getUrlSuffix()}" class="t-nav">会员中心</a>
	            <span class="line">|</span>
	            <a href="${ctx}/frontMemberHelpCenterData${fns:getUrlSuffix()}" class="t-nav">帮助中心</a>
	        </div>
	    </div>
	</div>
	<div class="logo-con clearfix">
	    <div class="wrapper">
	        <h1 class="logo">
	            <a href=""><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/logo.jpg" alt=""></a>
	        </h1>
	        <a href="javascript:;" class="min-menu-btn">
	            <span class="line"></span>
	            <span class="line"></span>
	            <span class="line"></span>
	        </a>
	    </div>
	</div>
	<!-- 身体 -->
	<sitemesh:body/>

	<div class="ensure-content">
	   <div class="wrapper">
           <ul class="ensure clearfix">
               <li>
                   <span class="ico ico1"></span>
                   <span class="text">正品鉴定保障</span>
               </li>
               <li>
                   <span class="ico ico2"></span>
                   <span class="text">增值保值障</span>
               </li>
               <li>
                   <span class="ico ico3"></span>
                   <span class="text">无理由退货障</span>
               </li>
               <li>
                   <span class="ico ico4"></span>
                   <span class="text">实物拍摄障</span>
               </li>
               <li>
                   <span class="ico ico5"></span>
                   <span class="text">源头供货障</span>
               </li>
               <li>
                   <span class="ico ico6"></span>
                   <span class="text">假一赔十</span>
               </li>
           </ul>
           <div class="foot-other clearfix">
               <div class="logo">
                   <img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/logo2.jpg" alt="">
               </div>
               <dl class="address">
                   <dt>联系我们</dt>
                   <dd>热线电话：15737100370   邮箱：530285116@qq.com</dd>
                   <dd>地址：河南省郑州市金水东路7号鑫苑中央花园东区6号楼0703号</dd>
                     <!-- 河南省郑州市郑东新区金水东路7号鑫苑中央花园东区6号楼7层0703号 -->
               </dl>
               <div class="code">
                   <img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/code.jpg" alt="">
                </div>
            </div>
	    </div>
	</div>
	
	<div class="footer">
	    <p class="bottom-nav">
	        <a href="${ctx}/index-1${fns:getUrlSuffix()}">网站首页</a><span class="line">|</span>
	        <a href="${ctx}/frontProductList${fns:getUrlSuffix()}">产品展示</a><span class="line">|</span>
	        <c:forEach items="${fnc:getMainNavList(site.id)}" var="category" varStatus="status">
				<c:if test="${status.index lt 10}">
					<c:choose>
						<c:when test="${status.index eq 4}"><a href="${category.url}">${category.name}</a></c:when>
						<c:otherwise><a href="${category.url}">${category.name}</a><span class="line">|</span></c:otherwise>
					</c:choose>
		    	</c:if>
		    	
	    	</c:forEach>
	        <a href="${ctx}/frontOfflineEntityList${fns:getUrlSuffix()}">产品展示</a>
	        
	        
	       <!--  <a href="">玉器师</a><span class="line">|</span>
	        <a href="">联系我们</a><span class="line">|</span>
	        <a href="">真伪查询</a><span class="line">|</span>
	        <a href="">友情链接</a> -->
	    </p>
	    <p class="copyright">©2018-2030 版权所有：香港唐润珠宝集团有限公司（技术支持）备案号:粤ICP备17107378号-2</p>
	</div>
	<script src="${ctxStatic}/common/common.js"></script>

</body>
</html>