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
<%--    <script src="${ctxStatic}/common/Area.js"></script>
    <script src="${ctxStatic}/common/AreaData_min.js"></script>--%>

    <script type="text/javascript">

        $(document).ready(function() {
            $("#email").focus();
            $("#myForm").validate({
                //debug: true,
                rules: {
                   email: {
                       required: true,
                       remote:"${ctx}/checkEmailExits"
                    },
                    vcode: {
                       required: true,
                       remote: '${ctx}/checkVCode',
                    }
                },
                messages: {
                    email: {
                        required:"邮箱地址不能为空",
                        remote:"邮箱地址没有注册信息"
                    },
                    vcode: {
                        remote: '验证码错误'
                    },
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

            eventInit();
        });

        $.validator.addMethod("checkMobile",function(value,element,params){
            var checkName = /^1[3,5,7,8]\d{9}$/;
            return checkName.test(value);
        },"手机号码格式不正确");



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
                if($("#myForm").validate().element($("#email"))&&$("#myForm").validate().element($("#vcode"))){
                    $.ajax({
                        url: chgUrl("${ctx2}/servlet/validateNumServlet"),
                        type: "POST",
                        dataType: "JSON",
                        data: {
                            email: $("#email").val()
                        },
                        success: function (data) {
                            console.log(data);
                            settime($("#l_gsc"));
                            /*if(data.success) {

                            }else{
                                setTimeout(function() {
                                    settime($("#l_gsc"));
                                }, 1000);
                                jBox.tip("发送验证码失败，请稍后再试");
                            }*/
                        }
                    });
                }
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
            <form id="myForm"  class="form-signin" action="${ctx}/doBackPassword" method="post">
                <sys:message content="${message}"/>
                <div class="user-reg-box">
                        <h2 class="title">邮箱找回密码</h2>
                       <%-- <div class="form-col-control">
                            <span class="label-title">手机号码:</span>
                            <input type="text" name="mobile" id="mobile" class="input-control required" htmlEscape="false" maxlength="100" />
                        </div>--%>
                        <div class="form-col-control">
                            <span class="label-title">邮箱地址:</span>
                            <input type="text" name="email" id="email" class="input-control required" htmlEscape="false" maxlength="100" value="${email}"/>
                        </div>
                        <div class="form-col-control">
                            <span class="label-title">验证码:</span>
                            <input type="text" class="input-control vcode-input required" name="vcode" id="vcode" maxlength="4" />
                            <span class="vcode-img">
                                <img src="${ctx2}/servlet/validateCodeServlet" alt="" id="vcode-img">
                            </span>
                            <a href="javascript:void(0);" class="change-vcode" id="change-vcode">看不清?换一个</a>
                        </div>
                        <%--<div class="validateCode form-col-control">
                            <span class="label-title">验证码:</span>
                            <sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;"/>
                        </div>--%>
                         <p class="xy-p">
                             正确输入上方验证码后，点击<span class="text"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/mobile.png" />获取邮箱验证码</span>，查收邮箱将系统发送的"6位动态密码"输入到下方验证后登录！
                         </p>
                        <div class="form-col-control">
                            <span class="label-title">邮箱验证码:</span>
                            <input type="text" name="vnum" class="input-control message-input required"  maxlength="6" />
                            <a href="javascript:void(0);" id="l_gsc" class="get-message-code">获取验证码</a>
                        </div>
                        <div class="form-col-control">
                            <span class="label-title">新密码:</span>
                            <input type="password" name="password" id="password" class="input-control required"  maxlength="50"/>
                        </div>
                        <div class="form-col-control">
                            <span class="label-title">确认密码:</span>
                            <input type="password" class="input-control required"  maxlength="50" minlength="3" equalTo="#password" />
                        </div>

                    <div class="form-col-control">
                        <input type="submit" href="javascript:;" class="register-btn" value="确认重置"/>
                    </div>
                </div>
            </form>
        </div>

    </div>

</body>
</html>
