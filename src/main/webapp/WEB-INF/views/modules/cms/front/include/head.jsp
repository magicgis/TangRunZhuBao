<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0" />
<meta name="robots" content="none">

<link rel="Shortcut Icon" href="${ctxStatic}/modules/cms/front/themes/basic/favicon.ico">

<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<c:if test="${site.theme eq 'basic'}">
	<link rel="stylesheet" href="${ctxStatic}/modules/cms/front/themes/basic/asset/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="${ctxStatic}/modules/cms/front/themes/basic/asset/css/style.css">
	<link rel="stylesheet" href="${ctxStatic}/modules/cms/front/themes/basic/asset/css/animate.min.css">
	<link rel="stylesheet" href="${ctxStatic}/modules/cms/front/themes/basic/asset/swiper/swiper.min.css">
	
	<!--[if lt IE 9]>
	<script src="https://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.js"></script>
	<![endif]-->

	<script src="${ctxStatic}/jquery/jquery.min.js"></script>
	<script src="${ctxStatic}/common/jquery.lazyload.js"></script>
	<script src="${ctxStatic}/modules/cms/front/themes/basic/asset/swiper/swiper.min.js"></script>
	<script type="text/javascript">
		var ctxStatic = "${ctxStatic}";
		var ctx = "${ctx}";
		
	</script>
</c:if>