<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${site.description}" />
	<meta name="keywords" content="${site.keywords}" />
	
	<title><%-- ${fns:getConfig('productName')}  --%>登录</title>
	
	<style type="text/css">
      
      	/*注册页面*/
		.user-reg {
		  padding-top: 84px;
		  background: url("${ctxStatic}/modules/cms/front/themes/basic/asset/img/rbg.jpg") no-repeat center center;
		}
		.user-reg .user-reg-box {
		  background: #fff;
		  padding: 40px 60px 110px;
		  display: inline-block;
		  float: right;
		  margin-bottom: 105px;
		}
		.user-reg .user-reg-box .title {
		  font-size: 24px;
		  font-weight: bold;
		  line-height: 28px;
		  text-align: left;
		  margin-bottom: 15px;
		}
		.user-reg .user-reg-box .form-col-control {
		  height: 35px;
		  width: 350px;
		  display: block;
		  border-bottom: 1px solid #e3e3e3;
		  margin-bottom: 15px;
		}
		.user-reg .user-reg-box .form-col-control .label-title {
		  display: inline-block;
		  line-height: 35px;
		  font-size: 14px;
		  color: #c7c7c7;
		  text-align: left;
		  width: 80px;
		  float: left;
		}
		.user-reg .user-reg-box .form-col-control .input-control {
		  height: 35px;
		  border: 0;
		  width: 270px;
		  float: left;
		  position: relative;
		  top: -1px;
		}
		
		
		
		
		.user-reg .user-reg-box .form-col-control .vcode-input {
		  width: 90px;
		  float: left;
		}
		.user-reg .user-reg-box .form-col-control .vcode-img {
		  width: 90px;
		  height: 35px;
		  display: inline-block;
		  float: left;
		  border-bottom: 0;
		}
		.user-reg .user-reg-box .form-col-control .vcode-img img {
		  width: 100%;
		  height: 35px;
		}
		.user-reg .user-reg-box .form-col-control .change-vcode {
		  display: inline-block;
		  float: right;
		  height: 35px;
		  width: 90px;
		  text-align: center;
		  line-height: 35px;
		  border-bottom: 0;
		  position: relative;
		  top: 1px;
		  background: #fff;
		  color: #c0c0c0;
		}
		.user-reg .user-reg-box .form-col-control .change-vcode:hover {
		  color: #666;
		}
		
		.user-reg .user-reg-box .register-btn {
		  height: 55px;
		  line-height: 55px;
		  background: #1ca339;
		  color: #fff;
		  font-size: 16px;
		  text-align: center;
		  display: block;
		  width: 100%;
		}
		@media (max-width: 470px) {
		  .user-reg {
		    padding-top: 20px;
		  }
		  .user-reg .user-reg-box {
		    margin-bottom: 20px;
		  }
		  .user-reg .user-reg-box {
		    margin-left: auto;
		    margin-right: auto;
		    padding: 20px 5px;
		  }
		  .user-reg .user-reg-box .form-col-control {
		    width: 310px;
		  }
		  .user-reg .user-reg-box .form-col-control .input-control {
		    width: 222px;
		  }
		  .user-reg .user-reg-box .form-col-control .select-area {
		    width: 222px;
		  }
		  .user-reg .user-reg-box .form-col-control .select-area select {
		    width: 74px;
		  }
		  .user-reg .user-reg-box .form-col-control .vcode-input {
		    width: 70px;
		  }
		  .user-reg .user-reg-box .form-col-control .vcode-img {
		    width: 70px;
		  }
		  .user-reg .user-reg-box .form-col-control .message-input {
		    width: 70px;
		  }
		  .user-reg .user-reg-box .xy-p {
		    width: 310px;
		  }
		}
    </style>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#loginForm").validate({
				rules: {
					validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
				},
				messages: {
					username: {required: "请填写用户名."},password: {required: "请填写密码."},
					validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
				},
				errorLabelContainer: "#messageBox",
				errorPlacement: function(error, element) {
					error.appendTo($("#loginError").parent());
				} 
			});
		});
		// 如果在框架或在对话框中，则弹出提示并跳转到首页
		if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
			alert('未登录或登录超时。请重新登录，谢谢！');
			top.location = "${ctx}";
		}
	</script>
</head>
<body>
	    <div class="user-reg clearfix">
        	<div class="wrapper">
            	<div class="user-reg-box">
                    <h2 class="title">用户账号登录</h2>
                    	
                    	<!--[if lte IE 6]><br/><div class='alert alert-block' style="text-align:left;padding-bottom:10px;"><a class="close" data-dismiss="alert">x</a><h4>温馨提示：</h4><p>你使用的浏览器版本过低。为了获得更好的浏览体验，我们强烈建议您 <a href="http://browsehappy.com" target="_blank">升级</a> 到最新版本的IE浏览器，或者使用较新版本的 Chrome、Firefox、Safari 等。</p></div><![endif]-->
						<div class="header">
							<div id="messageBox" class="alert alert-error ${empty message ? 'hide' : ''}"><button data-dismiss="alert" class="close">×</button>
								<label id="loginError" class="error">${message}</label>
							</div>
						</div>
						<%--<h1 class="form-signin-heading">${fns:getConfig('productName')}</h1> --%>
						<form id="loginForm" class="form-signin" action="${ctx}/login" method="post">
							
							<div class="form-col-control">
	                        	<label class="label-title" for="username">登录名:</label>
	                        	<input type="text" id="username" name="username" class="input-control required" value="${username}"/>
		                    </div>
		                    <div class="form-col-control">
		                        <label class="label-title" for="password">密码:</label>
		                        <input type="password" id="password" name="password" class="input-control required">
		                    </div>
							
							<c:if test="${isValidateCodeLogin}">
								<div class="validateCode form-col-control">
									<label class="label-title mid" for="validateCode">验证码:</label>
									<sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;"/>
								</div>
							</c:if>
							<input class="register-btn" type="submit" value="登 录"/>&nbsp;&nbsp;
							<br>
							<label for="rememberMe" title="下次不需要再登录">
								<input type="checkbox" id="rememberMe" name="rememberMe" ${rememberMe ? 'checked' : ''}/> 记住我（公共场所慎用）
							</label>
 							
							<%-- <label class="input-label" for="username">登录名</label>
							<input type="text" id="username" name="username" class="input-block-level required" value="${username}">
							
							<label class="input-label" for="password">密码</label>
							<input type="password" id="password" name="password" class="input-block-level required">
							<c:if test="${isValidateCodeLogin}"><div class="validateCode">
								<label class="input-label mid" for="validateCode">验证码</label>
								<sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;"/>
							</div></c:if>
							<input class="btn btn-large btn-primary" type="submit" value="登 录"/>&nbsp;&nbsp;
							<label for="rememberMe" title="下次不需要再登录"><input type="checkbox" id="rememberMe" name="rememberMe" ${rememberMe ? 'checked' : ''}/> 记住我（公共场所慎用）</label>
							--%>
							<%-- <div id="themeSwitch" class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">${fns:getDictLabel(cookie.theme.value,'theme','默认主题')}<b class="caret"></b></a>
								<ul class="dropdown-menu">
								  <c:forEach items="${fns:getDictList('theme')}" var="dict"><li><a href="#" onclick="location='${pageContext.request.contextPath}/theme/${dict.value}?url='+location.href">${dict.label}</a></li></c:forEach>
								</ul>
								<!--[if lte IE 6]><script type="text/javascript">$('#themeSwitch').hide();</script><![endif]-->
							</div> --%>
						</form>
						
	            </div>
	        </div>
	    </div>

	<script src="${ctxStatic}/flash/zoom.min.js" type="text/javascript"></script>
</body>
</html>