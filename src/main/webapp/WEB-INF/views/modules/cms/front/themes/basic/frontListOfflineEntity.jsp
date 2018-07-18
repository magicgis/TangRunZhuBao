<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
   
    <title>线下实体店</title>
    <meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${site.description}" />
	<meta name="keywords" content="${site.keywords}" />
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=HgTNrnm3WtDMK8EncNsbWdfOekLNN1u5"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			getFrontProductListData();
		});
		
		function getFrontProductListData(){
			var usuff = "${fns:getUrlSuffix()}";
			$.ajax({
			   type: "POST",
			   url: ctx+"/getFrontOfflineEntityListData"+usuff,
			   data: $("#searchForm").serialize(),
			   success: function(msg){
				   $("#offlineContent").html(msg);
			   }
			});
			return false;
		}
		/* 分页 */
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			/*使用ajax提交form表单*/
			getFrontProductListData();
        }
	</script>	
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
                    <span class="title">线下实体店</span>
                    <div class="line line-r"></div>
                </div>
            </div>
           	<form:form id="searchForm" modelAttribute="offlineEntity" action="${ctx}/frontOfflineEntityList/" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<%-- <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/> --%>
			</form:form>
            <div id="offlineContent">
            	
            </div>
			
			<p>&nbsp;</p>
			
			<%-- ${article.articleData.content}	 --%>
        </div>
    </div>
	
</body>
</html>
