<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>加盟商管理管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/alliancebusiness/fAllianceBusiness/">加盟商管理列表</a></li>
		<shiro:hasPermission name="alliancebusiness:fAllianceBusiness:edit"><li><a href="${ctx}/alliancebusiness/fAllianceBusiness/form">加盟商管理添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="fAllianceBusiness" action="${ctx}/alliancebusiness/fAllianceBusiness/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>加盟商名字：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>加盟商手机：</label>
				<form:input path="mobilePhone" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>qq：</label>
				<form:input path="qq" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>微信：</label>
				<form:input path="wechat" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>加盟商地址：</label>
				<form:input path="address" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>加盟商名字</th>
				<th>加盟商电话</th>
				<th>加盟商手机</th>
				<th>qq</th>
				<th>微信</th>
				<th>加盟商地址</th>
				<shiro:hasPermission name="alliancebusiness:fAllianceBusiness:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="fAllianceBusiness">
			<tr>
				<td><a href="${ctx}/alliancebusiness/fAllianceBusiness/form?id=${fAllianceBusiness.id}">
					${fAllianceBusiness.name}
				</a></td>
				<td>
					${fAllianceBusiness.telPhone}
				</td>
				<td>
					${fAllianceBusiness.mobilePhone}
				</td>
				<td>
					${fAllianceBusiness.qq}
				</td>
				<td>
					${fAllianceBusiness.wechat}
				</td>
				<td>
					${fAllianceBusiness.address}
				</td>
				<shiro:hasPermission name="alliancebusiness:fAllianceBusiness:edit"><td>
    				<a href="${ctx}/alliancebusiness/fAllianceBusiness/form?id=${fAllianceBusiness.id}">修改</a>
					<a href="${ctx}/alliancebusiness/fAllianceBusiness/delete?id=${fAllianceBusiness.id}" onclick="return confirmx('确认要删除该加盟商管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>