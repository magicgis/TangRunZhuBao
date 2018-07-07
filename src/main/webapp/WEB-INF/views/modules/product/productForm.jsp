<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>产品管理管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/product/product/">产品管理列表</a></li>
		<li class="active"><a href="${ctx}/product/product/form?id=${product.id}">产品管理<shiro:hasPermission name="product:product:edit">${not empty product.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="product:product:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="product" action="${ctx}/product/product/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		

		<div class="control-group">
			<label class="control-label">产品名字：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">产品名字全称：</label>
			<div class="controls">
				<form:input path="fullName" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		
		
		<div class="control-group">
			<label class="control-label">排序:</label>
			<div class="controls">
				<form:input path="sort" htmlEscape="false" maxlength="11" class="required digits"/>
				<span class="help-inline">产品的排列次序</span>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">产品介绍：</label>
			<div class="controls">
				<form:textarea path="introduction" htmlEscape="false" rows="4" class="input-xxlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>


		<div class="control-group">
			<label class="control-label">尺寸：</label>
			<div class="controls">
				<form:input path="size" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">工艺：</label>
			<div class="controls">
				<form:input path="technology" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">类别：</label>
			<div class="controls">
				<form:select path="productCategory" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('product_category')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">材质：</label>
			<div class="controls">
				<form:select path="productMaterial" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('product_material')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">种色：</label>
			<div class="controls">
				<form:select path="productSpeciescolor" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('product_speciescolor')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否团购：</label>
			<div class="controls">
				<form:checkboxes path="isEnableGroup" items="${fns:getDictList('is_enable_group')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">is_top：</label>
			<div class="controls">
				<form:checkboxes path="isTop" items="${fns:getDictList('is_top')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">关键词：</label>
			<div class="controls">
				<form:input path="keyword" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">市场价：</label>
			<div class="controls">
				<form:input path="marketPrice" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">价格：</label>
			<div class="controls">
				<form:input path="price" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">销量：</label>
			<div class="controls">
				<form:input path="sales" htmlEscape="false" maxlength="19" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">重量：</label>
			<div class="controls">
				<form:input path="weight" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">团购信息：</label>
			<div class="controls">
				<form:textarea path="productGroup" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		
		<!-- 2018-06-03 产品图片的相关信息  -->
		<div class="control-group">
			<label class="control-label">产品列表展示图（图片尺寸：272.85×221.95）：</label>
			<div class="controls">
				<form:hidden id="imageShare1" path="imageShare1" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="imageShare1" type="images" uploadPath="/product/share" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">产品详情显示（图片尺寸：613.59×383 图片张数：4张）：</label>
			<div class="controls">
				<form:hidden id="imageShare2" path="imageShare2" htmlEscape="false" maxlength="1000" class="input-xlarge"/>
				<sys:ckfinder input="imageShare2" type="images" uploadPath="/product/share" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">产品详情放大镜（图片尺寸：1920×1177图片张数：4张）：</label>
			<div class="controls">
				<form:hidden id="imageShare3" path="imageShare3" htmlEscape="false" maxlength="1000" class="input-xlarge"/>
				<sys:ckfinder input="imageShare3" type="images" uploadPath="/product/share" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">产品详情显示（图片尺寸：551×541 图片张数：4张）：</label>
			<div class="controls">
				<form:hidden id="imageShare4" path="imageShare4" htmlEscape="false" maxlength="1000" class="input-xlarge"/>
				<sys:ckfinder input="imageShare4" type="images" uploadPath="/product/share" selectMultiple="true"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">首页翡翠（图片尺寸：551×541）：</label>
			<div class="controls">
				<form:hidden id="imageEmerald1" path="imageEmerald1" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="imageEmerald1" type="images" uploadPath="/product/emerald" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">首页翡翠（图片尺寸：465×299.34）：</label>
			<div class="controls">
				<form:hidden id="imageEmerald2" path="imageEmerald2" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="imageEmerald2" type="images" uploadPath="/product/emerald" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">首页翡翠（图片尺寸：265×350）：</label>
			<div class="controls">
				<form:hidden id="imageEmerald3" path="imageEmerald3" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="imageEmerald3" type="images" uploadPath="/product/emerald" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">首页翡翠（图片尺寸：365×300）：</label>
			<div class="controls">
				<form:hidden id="imageEmerald4" path="imageEmerald4" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="imageEmerald4" type="images" uploadPath="/product/emerald" selectMultiple="false"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">产品详情中猜你喜欢（翡翠和田玉公用 图片尺寸：200×200）：</label>
			<div class="controls">
				<form:hidden id="imageEmeraldNephrite1" path="imageEmeraldNephrite1" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="imageEmeraldNephrite1" type="images" uploadPath="/product/emeraldNephrite" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">个人信息中猜你喜欢（翡翠和田玉公用 图片尺寸：244.983×324）：</label>
			<div class="controls">
				<form:hidden id="imageEmeraldNephrite2" path="imageEmeraldNephrite2" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="imageEmeraldNephrite2" type="images" uploadPath="/product/emeraldNephrite" selectMultiple="false"/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">首页和田玉（图片尺寸：366×301）：</label>
			<div class="controls">
				<form:hidden id="imageNephrite1" path="imageNephrite1" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="imageNephrite1" type="images" uploadPath="/product/nephrite" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">首页和田玉（图片尺寸：267×703）：</label>
			<div class="controls">
				<form:hidden id="imageNephrite2" path="imageNephrite2" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="imageNephrite2" type="images" uploadPath="/product/nephrite" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">首页和田玉（图片尺寸：260×283）：</label>
			<div class="controls">
				<form:hidden id="imageNephrite3" path="imageNephrite3" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="imageNephrite3" type="images" uploadPath="/product/nephrite" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">首页钻石（图片尺寸：339×320）：</label>
			<div class="controls">
				<form:hidden id="imageDiamonds" path="imageDiamonds" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="imageDiamonds" type="images" uploadPath="/product/diamonds" selectMultiple="false"/>
			</div>
		</div>
		
		<!--2018-04-28  产品相关信息 -->
		<div class="control-group">
			<label class="control-label">品牌：</label>
			<div class="controls">
				<form:input path="brand" htmlEscape="false" maxlength="255" class="input-xlarge"/>
			</div>
		</div>
		 <div class="control-group">
			<label class="control-label">上市时间：</label>
			<div class="controls">
				<input id="timeToMarket" name="timeToMarket" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${product.timeToMarket}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">优化处理方式：</label>
			<div class="controls">
				<form:select path="optimalProcessingMethod" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('optimalProcessingMethod')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否商场同款：</label>
			<!-- (0是 1否) -->
			<div class="controls">
				<form:select path="sameToMarket" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('sameToMarket')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">鉴定标识：</label>
			<div class="controls">
				<form:input path="identificationMark" htmlEscape="false" maxlength="255" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">鉴定类别：</label>
			<!-- (0 国家珠宝玉石质量监督检验中心 1 中国地质大学珠宝检测中心....) -->
			<div class="controls">
				<form:select path="identificationCategory" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('identificationCategory')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">认证标识：</label>
			<div class="controls">
				<form:input path="certificationMark" htmlEscape="false" maxlength="255" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">销售渠道类型：</label>
			<div class="controls">
				<form:input path="salesChannelType" htmlEscape="false" maxlength="255" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">图案/形状：</label>
			<!-- (0 其他) -->
			<div class="controls">
				<form:input path="patternShape" htmlEscape="false" maxlength="255" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">镶嵌材质：</label>
			<div class="controls">
				<form:input path="mosaicMaterial" htmlEscape="false" maxlength="255" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">货号：</label>
			<div class="controls">
				<form:input path="freightNumber" htmlEscape="false" maxlength="255" class="input-xlarge"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		
		<div class="form-actions">
			<shiro:hasPermission name="product:product:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>