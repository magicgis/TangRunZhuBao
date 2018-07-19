<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<script type="text/javascript">
	function submitPassword(){
		var usuff = "${fns:getUrlSuffix()}";
		
		$.ajax({
		   type: "POST",
		   url: ctx+"/frontMemberCenterResetPassData"+usuff,
		   data: $("#myForm").serialize(),
		   success: function(msg){
			  
		   }
		});
	}
</script>


	<div class="column-nav">
	    <a href="">会员中心</a>
	    	<span class="ico"> -&gt; </span>
	    <a href="">修改密码</a>
	</div>
	
	<div class="personal-info">
	    <div class="title">
	        <span class="name">修改密码</span>
	        <span class="subtitle">尽量填写完整信息，方便店家与你联系！</span>
	    </div>
	    <div class="personal-form clearfix">
	        <form id="myForm" action="" method="post">
		        <input type="hidden" id="id" name="id" class="input-control" value="${user.id}"/>
		        
		        <div class="form-column-control clearfix">
		            <div class="name">旧密码：</div>
		            <div class="input-div-wrap">
		            	<input id="oldPassword" name="oldPassword" type="password" class="input-control"/>
		            </div>
		        </div>
		        <div class="form-column-control clearfix">
		            <div class="name">新密码：</div>
		            <div class="input-div-wrap">
		            	<input id="newPassword" name="newPassword" type="password" class="input-control"/>
		            </div>
		        </div>
		        <div class="form-column-control clearfix">
		            <div class="name">确认密码：</div>
		            <div class="input-div-wrap">
		            	<input id="confirmNewPassword" name="confirmNewPassword" type="password" class="input-control" equalTo="#newPassword"/>
		            </div>
		        </div>
		        
		        <div class="submit-wrap clearfix">
		            <input type="button" onclick="submitPassword()" class="submit-control" value="保存" />
		        </div>
	        </form>
	    </div>
	</div>
	<div class="guess-you-like">
	    <div class="guess-title">
	        <span class="name">猜你喜欢</span>
	       <!--  <a href="" class="refresh"><i class="ico"></i>换一组</a> -->
	    </div>
	    <ul class="you-like-list clearfix">
	       	<!-- 使用工具类的热门产品  3个产品 -->
            <c:forEach items="${fnp:getHotProductList(site.id,'0',3)}" var="hotProduct">
                <li class="item">
	                <div class="img">
	                    <img src="${hotProduct.imageEmeraldNephrite2}" alt="">
	                </div>
	                <div class="handel">
	                    <span class="name">${hotProduct.name}</span>
	                    <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${hotProduct.id}" class="look">查看详情</a>
	                </div>
		        </li>
            </c:forEach>
	    </ul>
	</div>