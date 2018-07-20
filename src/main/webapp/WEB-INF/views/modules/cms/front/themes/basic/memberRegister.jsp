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

            $("#name").focus();
            $("#inputForm").validate({
                rules: {
                    loginName: {remote: "${ctx}/checkLoginName?oldLoginName=" + encodeURIComponent('${user.mobile}')}
                },
                messages: {
                    loginName: {remote: "手机号码已存在"},
                    confirmNewPassword: {equalTo: "输入与上面相同的密码"}
                },
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

    <div class="user-reg clearfix">
        <div class="wrapper">
        <form:form  modelAttribute="user" id="inputForm" action="${ctx}/frontMemberRegister/save" method="post" class="form-horizontal">
            <sys:message content="${message}"/>
                <div class="user-reg-box">
                    <h2 class="title">新用户注册</h2>
                    <div class="form-col-control">
                        <span class="label-title">手机号码:</span>
                        <form:input path="mobile" htmlEscape="false" maxlength="100" cssClass="nput-control"/>
                        <span class="help-inline"><font color="red">*</font> </span>
                    </div>
                    <div class="form-col-control">
                        <span class="label-title">密码:</span>
                        <form:input id="password" path="password" type="password" value="" maxlength="50" minlength="3" cssClass="nput-control" />
                        <span class="help-inline"><font color="red">*</font> </span>
                    </div>
                    <div class="form-col-control">
                        <span class="label-title">确认密码:</span>
                        <input id="confirmNewPassword"  class="input-control" type="password" value="" maxlength="50" minlength="3" equalTo="#password"/>
                    </div>
                   <%-- <div class="form-col-control">
                        <span class="label-title">地区:</span>
                        <div class="select-area">
                            <form:select path="seachprov" id="seachprov" name="seachprov" onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');" cssClass="select-area province"></form:select>
                            <form:select path="homecity" id="seachcity" name="homecity" onChange="changeCity(this.value,'seachdistrict','seachdistrict');" cssClass="select-area city"></form:select>
                            <form:select path="seachdistrict" id="seachdistrict" name="seachdistrict" cssClass="select-area county"></form:select>
                        </div>

                    </div>
                    <div class="form-col-control">
                        <span class="label-title">验证码:</span>
                        <form:input type="password" path="password" class="input-control vcode-input" maxlength="4"/>
                        <span class="vcode-img">
                            <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/vcode.jpg" alt="">
                        </span>
                        <a href="" class="change-vcode">看不清?换一个</a>
                    </div>
                    <div class="form-col-control">
                        <span class="label-title">短信验证码:</span>
                        <form:input type="password" path="messageCode" class="input-control message-input" />
                        <a href="" class="get-message-code">获取短信验证码</a>
                    </div>--%>
                    <p class="xy-p">
                        <input type="checkbox"  style="padding-right:10px;"/>
                        我已阅读并同意<a href="" class="xy-link">会员注册协议</a>和<a href="" class="xy-link">隐私保护政策</a></p>
                       <%-- <a href="javascript:;document.inputForm.submit();" class="register-btn" >立即注册</a>--%>
                    <div class="form-col-control">
                        <input class="register-btn" type="submit" value="立即注册"/>
                    </div>
                </div>
            </form:form>
        </div>
    </div>

</body>

</html>
