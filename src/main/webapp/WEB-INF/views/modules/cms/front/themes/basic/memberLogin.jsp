<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>用户登录</title>
    <meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${site.description}" />
	<meta name="keywords" content="${site.keywords}" />
</head>

<body>

    <div class="user-reg clearfix">
        <div class="wrapper">
            <div class="user-reg-box">
                    <h2 class="title">用户账号登录</h2>
                    <form id="loginForm" class="form-signin" action="${ctx}/frontUserLogin" method="post">
	                    <div class="form-col-control">
	                        <span class="label-title">手机号码:</span>
	                        <input type="text" id="username" name="username" class="input-control" />
	                    </div>
	                    <div class="form-col-control">
	                        <span class="label-title">密码:</span>
	                        <input type="password" id="password" name="password" class="input-control" />
	                    </div>
	                    
                    	<input class="register-btn" type="submit" value="登 录"/>
                    	<!-- <a href="javascript:;" type="submit" class="register-btn">登录</a> -->
                    </form>
            </div>
        </div>
    </div>

</body>
</html>
