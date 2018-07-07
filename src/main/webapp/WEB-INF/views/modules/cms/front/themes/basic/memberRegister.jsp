<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>用户注册</title>
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
                    <h2 class="title">新用户注册</h2>
                    <div class="form-col-control">
                        <span class="label-title">手机号码:</span>
                        <input type="text" class="input-control" />
                    </div>
                    <div class="form-col-control">
                        <span class="label-title">密码:</span>
                        <input type="password" class="input-control" />
                    </div>
                    <div class="form-col-control">
                        <span class="label-title">确认密码:</span>
                        <input type="password" class="input-control" />
                    </div>
                    <div class="form-col-control">
                        <span class="label-title">地区:</span>
                        <div class="select-area">
                            <select id="seachprov" name="seachprov" onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');" class="select-area province"></select>
                            <select id="seachcity" name="homecity" onChange="changeCity(this.value,'seachdistrict','seachdistrict');" class="select-area city"></select>
                            <select id="seachdistrict" name="seachdistrict" class="select-area county"></select>
                        </div>

                    </div>
                    <div class="form-col-control">
                        <span class="label-title">验证码:</span>
                        <input type="password" class="input-control vcode-input" maxlength="4"/>
                        <span class="vcode-img">
                            <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/vcode.jpg" alt="">
                        </span>
                        <a href="" class="change-vcode">看不清?换一个</a>
                    </div>
                    <div class="form-col-control">
                        <span class="label-title">短信验证码:</span>
                        <input type="password" class="input-control message-input" />
                        <a href="" class="get-message-code">获取短信验证码</a>
                    </div>
                    <p class="xy-p">
                        <input type="checkbox"  style="padding-right:10px;"/>
                        我已阅读并同意<a href="" class="xy-link">会员注册协议</a>和<a href="" class="xy-link">隐私保护政策</a></p>
                    <a href="javascript:;" class="register-btn">立即注册</a>
            </div>
        </div>
    </div>

</body>

</html>
