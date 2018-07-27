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
   <%-- <script src="${ctxStatic}/common/Area.js"></script>
    <script src="${ctxStatic}/common/AreaData_min.js"></script>--%>
    <script type="text/javascript">
        $(document).ready(function() {
            /*initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, '0', '0', '0');
            initComplexArea('cseachprov', 'cseachcity', 'cseachdistrict', area_array, sub_array, '0', '0', '0');*/

            $("#mobile").focus();
            $("#inputForm").validate({
                //debug: true,
                rules: {
                    loginName: {
                        checkLoginName: true,
                        remote:"${ctx}/checkLoginName"
                    },
                    mobile: {
                        required:true,
                        checkMobile:true,
                        remote: "${ctx}/checkMobile"
                    },
                    email: {
                        requried: true,
                        remote: "{ctx}/checkEmail"
                    },
                    agree: {
                        required: true
                    },
                    vcodeinput: {
                        required: true
                    }

                },
                messages: {
                    loginName: {
                        remote: "登录名已存在",
                    },
                    mobile: {
                            required:"手机号码不能为空",
                            remote: "手机号码已存在",
                        confirmNewPassword: {equalTo: "输入与上面相同的密码"}
                    },
                    email: {
                        remote: "改邮箱已被注册"
                    },
                    agree: {
                        required: "请同意我们的注册协议"
                    }
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
            $.validator.addMethod("checkMobile",function(value,element,params){
                var checkName = /^1[3,5,7,8]\d{9}$/;
                return checkName.test(value);
            },"手机号码格式不正确");

            $.validator.addMethod("checkLoginName",function(value,element,params){
                var uPattern = /^[a-zA-Z0-9_-]{4,16}$/;;
                return uPattern.test(value);
            },"登录名只能包含字母、数字、下划线4-16个字母");
            console.log(encodeURIComponent('${user.loginName}'));
            eventInit();

        });


        //发送短信按钮倒计时标志，true的时候表示正在倒计时
        var timerflag = false;

        //点击发送短信按钮后倒计时60s
        var countdown = 60;

        function settime(obj) {
            if(countdown == 0) {
                //结束倒计时
                timerflag = false;
                obj.text("获取验证码");
                countdown = 60;
                return;
            } else {
                obj.text('重新获取' + countdown + "s");
                countdown--;
            }
            setTimeout(function() {
                settime(obj);
            }, 1000);
        }



        function changeImg(imgSrc) {
            var src = imgSrc.attr("src");
            console.log(src);
            imgSrc.attr("src", chgUrl(src));
        }

        // 时间戳
        // 为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
        function chgUrl(url) {
            var timestamp = (new Date()).valueOf();
            //url = url.substring(0, 20);
            if ((url.indexOf("&") >= 0)) {
                url = url + "×tamp=" + timestamp;
            } else {
                url = url + "?timestamp=" + timestamp;
            }
            return url;
        }


        function eventInit() {
            $("#l_gsc").on('click',function (event) {
                /*$.ajax({
                    type: "post",
                    url: ${ctxStatic}+"/f"
                });*/
                settime($("#l_gsc"));
            });
            
            
            $("#change-vcode").on('click',function () {
                changeImg($('#vcode-img'));
            })

        }
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
                        <span class="label-title">登录名<font color="red">*</font>:</span>
                        <form:input path="loginName" id="loginName" htmlEscape="false" maxlength="100" cssClass="input-control"/>
                    </div>
                    <div class="form-col-control">
                        <span class="label-title">手机号码<font color="red">*</font>:</span>
                        <form:input path="mobile" id="mobile" htmlEscape="false" maxlength="100" cssClass="input-control"/>
                    </div>
                    <div class="form-col-control">
                        <span class="label-title">邮箱地址<font color="red">*</font>:</span>
                        <form:input path="email" id="mobile" htmlEscape="false" maxlength="100" cssClass="input-control email"/>
                    </div>
                    <div class="form-col-control">
                        <span class="label-title">密码<font color="red">*</font>:</span>
                        <form:input id="password" path="password" type="password" value="" maxlength="50" minlength="3" cssClass="input-control required" />
                    </div>
                    <div class="form-col-control">
                        <span class="label-title">确认密码:</span>
                        <input id="confirmNewPassword"  class="input-control" type="password" value="" maxlength="50" minlength="3" equalTo="#password"/>
                    </div>
                   <%--<div class="form-col-control">
                        <span class="label-title">地区:</span>
                        <div class="select-area">
                            <select path="seachprov" id="seachprov" name="seachprov" onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');" cssClass="select-area province"></select>
                            <select path="homecity" id="seachcity" name="homecity" onChange="changeCity(this.value,'seachdistrict','seachdistrict');" cssClass="select-area city"></select>
                            <select path="seachdistrict" id="seachdistrict" name="seachdistrict" cssClass="select-area county"></select>
                        </div>

                    </div>--%>
                    <div class="form-col-control">
                        <span class="label-title">验证码:</span>
                        <input  class="input-control vcode-input required" name='vcodeinput' maxlength="4"/>
                        <span class="vcode-img">
                            <img id="vcode-img" src="${ctx2}/servlet/validateCodeServlet" alt="">
                        </span>
                        <a href="javascript:" class="change-vcode" id="change-vcode">看不清?换一个</a>
                    </div>
                   <%-- <div class="form-col-control">
                        <span class="label-title">短信验证码:</span>
                        <input  class="input-control message-input" />
                        <a href="javascript:" id="l_gsc" class="get-message-code">获取短信验证码</a>
                    </div>--%>
                    <div class="form-col-control">
                        <p class="xy-p">
                        <input type="checkbox" name="agree" style="padding-right:10px;"/>
                
		                <c:set var="helpCenter" value="${fnc:getCategory('c64c12f10a844029b275cea9d74e7489')}"></c:set>
		            	我已阅读并同意
                        <a href="${helpCenter.url}" class="xy-link">会员注册协议</a>和<a href="${helpCenter.url}" class="xy-link">隐私保护政策</a></p>
                    </div>
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
