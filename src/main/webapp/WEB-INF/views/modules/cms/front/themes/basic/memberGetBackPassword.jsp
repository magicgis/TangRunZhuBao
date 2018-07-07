<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>找回密码</title>
    <meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${site.description}" />
	<meta name="keywords" content="${site.keywords}" />
    <!-- 下面的3个js只在本页面用到  -->
    <script src="${ctxStatic}/common/Area.js"></script>
    <script src="${ctxStatic}/common/AreaData_min.js"></script>
    <script type="text/javascript">
        $(function (){
            initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, '0', '0', '0');
            initComplexArea('cseachprov', 'cseachcity', 'cseachdistrict', area_array, sub_array, '0', '0', '0');
        });
    </script>
</head>

<body>

    <div class="user-reg clearfix">
        <div class="wrapper">
            <div class="user-reg-box">
                    <h2 class="title">手机找回密码</h2>
                    <div class="form-col-control">
                        <span class="label-title">手机号码:</span>
                        <input type="text" class="input-control" />
                    </div>

                    <div class="form-col-control">
                        <span class="label-title">验证码:</span>
                        <input type="password" class="input-control vcode-input" maxlength="4"/>
                        <span class="vcode-img">
                            <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/vcode.jpg" alt="">
                        </span>
                        <a href="" class="change-vcode">看不清?换一个</a>
                    </div>
                     <p class="xy-p">
                         正确输入上方验证码后，点击<span class="text"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/mobile.png" />获取短信验证码</span>，查收短信将系统发送的"6位动态密码"输入到下方验证后登录！
                     </p>
                    <div class="form-col-control">
                        <span class="label-title">短信验证码:</span>
                        <input type="password" class="input-control message-input" />
                        <a href="" class="get-message-code">获取短信验证码</a>
                    </div>
                    <div class="form-col-control">
                        <span class="label-title">新密码:</span>
                        <input type="password" class="input-control" />
                    </div>
                    <div class="form-col-control">
                        <span class="label-title">确认密码:</span>
                        <input type="password" class="input-control" />
                    </div>


                    <a href="javascript:;" class="register-btn">确认重置</a>
            </div>
        </div>
    </div>

</body>
</html>
