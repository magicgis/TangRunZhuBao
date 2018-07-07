<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>会员信息管理</title>
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
		<li class="active"><a href="${ctx}/member/members/">会员信息管理列表</a></li>
		<shiro:hasPermission name="member:members:edit"><li><a href="${ctx}/member/members/form">会员信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="members" action="${ctx}/member/members/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>手机：</label>
				<form:input path="mobile" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>邮箱：</label>
				<form:input path="email" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>登录次数：</label>
				<form:input path="loginCount" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>姓名</th>
				<th>手机</th>
				<th>邮箱</th>
				<th>登录次数</th>
				<th>找回密码最后一次记录</th>
				<th>地区</th>
				<th>地址</th>
				<th>备注</th>
				<shiro:hasPermission name="member:members:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="members">
			<tr>
				<td>
					<a href="${ctx}/member/members/form?id=${members.id}">
						${members.name}
					</a>
				</td>
				<td>
					${members.mobile}
				</td>
				<td>
					${members.email}
				</td>
				<td>
					${members.loginCount}
				</td>
				<td>
					${members.resetpwd}
				</td>
				<td>
					${fns:getDictLabel(members.area, '', '')}
				</td>
				<td>
					${members.addr}
				</td>
				<td>
					${members.remarks}
				</td>
				<shiro:hasPermission name="member:members:edit"><td>
    				<a href="${ctx}/member/members/form?id=${members.id}">修改</a>
					<a href="${ctx}/member/members/delete?id=${members.id}" onclick="return confirmx('确认要删除该会员信息管理吗？', this.href)">删除</a>
					<%-- <a href="${ctx}/member/members/form?id=${members.id}">统一推送活动信息</a> --%>
					
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>