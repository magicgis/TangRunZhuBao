<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>线下实体店管理管理</title>
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
		<li class="active"><a href="${ctx}/offlineentity/offlineEntity/">线下实体店管理列表</a></li>
		<shiro:hasPermission name="offlineentity:offlineEntity:edit"><li><a href="${ctx}/offlineentity/offlineEntity/form">线下实体店管理添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="offlineEntity" action="${ctx}/offlineentity/offlineEntity/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>实体店名字：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>实体店地址：</label>
				<form:input path="address" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>实体店电话：</label>
				<form:input path="tel" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>实体店联系人：</label>
				<form:input path="person" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>实体店图片</th>
				<th>实体店名字</th>
				<th>实体店地址</th>
				<th>实体店电话</th>
				<th>实体店联系人</th>
				<th>实体店横坐标</th>
				<th>实体店纵坐标</th>
				<shiro:hasPermission name="offlineentity:offlineEntity:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="offlineEntity">
			<tr>
				<td><a href="${ctx}/offlineentity/offlineEntity/form?id=${offlineEntity.id}">
					${offlineEntity.image}
				</a></td>
				<td>
					${offlineEntity.name}
				</td>
				<td>
					${offlineEntity.address}
				</td>
				<td>
					${offlineEntity.tel}
				</td>
				<td>
					${offlineEntity.person}
				</td>
				<td>
					${offlineEntity.mapX}
				</td>
				<td>
					${offlineEntity.mapY}
				</td>
				<shiro:hasPermission name="offlineentity:offlineEntity:edit"><td>
    				<a href="${ctx}/offlineentity/offlineEntity/form?id=${offlineEntity.id}">修改</a>
					<a href="${ctx}/offlineentity/offlineEntity/delete?id=${offlineEntity.id}" onclick="return confirmx('确认要删除该线下实体店管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>