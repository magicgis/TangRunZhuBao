<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
	<%@include file="/WEB-INF/views/modules/cms/front/include/head.jsp" %>
	<script language="javascript">
		function changFont(fontSize){
			$(".changeFont").css({"font-size":fontSize});
		}
	</script>
	<title>${article.title}</title>
</head>
<body>
	<%@include file="/WEB-INF/views/modules/cms/front/include/title.jsp" %>
	<div class="main no-borderbg bgwhite">
		<div class="sanji-banner">&nbsp;</div>
		<div class="div-auto1180">
			<div class="div-left no-border" style="width:130px;">
	         	<input type="hidden" id="lanmuurl" value="cn/cxyfz/shzl/shzrsj/" />
			 	<div class="gray-bg news-menu130 padding-tp20">
		             <ul id="newskey">
				    	<cms:frontCategoryList categoryList="${categoryList}"/>
				    </ul>
					<script language="javascript" type="text/javascript">
					 	var pageId = 14556;
					 	$("#newskey>li").each(function(){
		     	      	var liId = $(this).attr("id");
							if(liId == pageId){
								$(this).find("a").addClass("current");
						 		$(this).find("dd>a").removeClass("current");
						 		$(this).siblings().find("a").removeClass("current");
						 		$(this).find("dl").css("display","block");
						 		$(this).siblings().find("dl").css("display","none");
		     			}else{
								$("#newskey>li>dl>dd").each(function(){
							  		var ddId = $(this).attr("id");
									if(ddId == pageId){
										$(this).parent().css("display","block");
										$(this).find("a").addClass("current");
										$(this).siblings().find("a").removeClass("current");
										$(this).parent().parent().siblings().find("a").removeClass("current");;
									}
								});
							}
						});
					</script>
				</div>
			</div>
	
			<div class="div-rights">
				<div class="changeFont pfont">
					<p>　　${article.articleData.content}　</p>
				</div>
			</div>
		</div>
	</div>
	<%-- <%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %> --%>
</body>
</html>
<!-- Powered by CMS(内容管理系统) 1.3.4.1988 PublishDate 2017-10-13 11:14:27-->