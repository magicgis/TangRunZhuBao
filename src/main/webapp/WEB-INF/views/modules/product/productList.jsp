<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>产品管理管理</title>
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
	<style type="text/css">
		.ellipsesSpan {
		    display: inline-block;
		    overflow: hidden;
		    white-space: nowrap;
		    text-overflow: ellipsis;
		}
	</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/product/product/">产品管理列表</a></li>
		<shiro:hasPermission name="product:product:edit"><li><a href="${ctx}/product/product/form">产品管理添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="product" action="${ctx}/product/product/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<%-- <li><label>更新时间：</label>
				<input name="updateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${product.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li> --%>
			<li><label>商品名字：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>尺寸：</label>
				<form:input path="size" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>工艺：</label>
				<form:input path="technology" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>类别：</label>
				<form:select path="productCategory" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('product_category')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>材质：</label>
				<form:select path="productMaterial" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('product_material')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>种色：</label>
				<form:select path="productSpeciescolor" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('product_speciescolor')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>产品图片</th>
				<th>产品名字</th>
				<th>类别</th>
				<th>材质</th>
				<th>种色</th>
				<th>重量</th>
				<th>尺寸</th>
				<th>工艺</th>
				<th>产品点击的次数</th>
				<th>产品介绍</th>
				<shiro:hasPermission name="product:product:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="product">
			<tr>
				<td style="width:205px;">
					<img alt="${product.name}" src="${product.imageShare1}" style="max-width:200px;max-height:200px;border:0;padding:3px;margin-right: -100px;">
				</td>
				<td>
					<a href="${ctx}/product/product/form?id=${product.id}" class="ellipsesSpan" style="width:100px;">
						${product.name}
					</a>
				</td>
				<td>
					${fns:getDictLabel(product.productCategory, 'product_category', '')}
				</td>
				<td>
					${fns:getDictLabel(product.productMaterial, 'product_material', '')}
				</td>
				<td>
					${fns:getDictLabel(product.productSpeciescolor, 'product_speciescolor', '')}
				</td>
				<td>
					${product.weight}
				</td>
				<td>
					${product.size}
				</td>
				<td>
					${product.technology}
				</td>
				<td>
					${product.hits}
				</td>
				<td>
					<span class="ellipsesSpan" style="width:220px;">
						${product.introduction}
					</span>
				</td>
				<shiro:hasPermission name="product:product:edit"><td>
    				<a href="${ctx}/product/product/form?id=${product.id}">修改</a>
					<a href="${ctx}/product/product/delete?id=${product.id}" onclick="return confirmx('确认要删除该产品管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>