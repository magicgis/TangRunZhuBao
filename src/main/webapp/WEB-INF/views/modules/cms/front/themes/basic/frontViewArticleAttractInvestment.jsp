<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>招商加盟</title>
    <meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${site.description}" />
	<meta name="keywords" content="${site.keywords}" />
	<script type="text/javascript">
		$(document).ready(function() {
            $("#inputForm").validate({
            	//debug: true,
                rules: {
                    name: {
                    	required:true
                    },
                    telPhone: {
                        required:true
                    },
                    mobilePhone: {
                        required: true,
                        checkMobile:true
                    },
                    qq: {
                        required: true
                    },
                    wechat: {
                        required: true
                    },
                    address: {
                        required: true
                    },
                    remarks: {
                        required: true
                    }

                },
                messages: {
                	name: {
                		required: "请您输入姓名",
                    },
                    telPhone: {
                        required:"请您输入电话号",
                    },
                    mobilePhone: {
                        required: "请您输入手机号",
                    },
                    qq: {
                        required: "请您输入QQ",
                    },
                    wechat: {
                        required: "请您输入微信号",
                    },
                    address: {
                        required: "请您输入地址信息",
                    },
                    remarks: {
                        required: "请您输入备注",
                    }
                },
                submitHandler: function(form){
                    //loading('正在提交，请稍等...');
                    //form.submit();
                    var usuff = "${fns:getUrlSuffix()}";
        			
        			$.ajax({
        				url:ctx+"/alliancebusinessSave"+usuff,
        				type:'post',
        				dataType:'text',
        				data:$("#inputForm").serialize(),
        				success:function(errorCode){
        					if(errorCode==0){
        						$.jBox.tip('添加信息成功！','info');
        					}else{
        						$.jBox.tip('添加信息失败！','error');
        					}
        				},
        		        error:function(){
        		        	$.jBox.tip('出现异常，请重新输入信息！','error');
        		        }
        		 	});
                }
            });	
        });
        $.validator.addMethod("checkMobile",function(value,element,params){
            var checkName = /^1[3,5,7,8]\d{9}$/;
            return checkName.test(value);
        },"手机号码格式不正确");
		/*
			使用ajax提交form表单
		
		function alliancebusinessSave(){
			
		}*/
		
	</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/modules/cms/front/include/title.jsp"%>
	
    <div class="column-banner">
        <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/img (27).jpg" alt="">
    </div>

    <div class="single-page">
        <div class="wrapper">
			<!-- 条款 -->
			${article.articleData.content}
            <div class="message-board">
                <div class="head-box">
                    <div class="head-title">我们与您携手共同创造财富</div>
                    <div class="head-brand">
                        <p>如果您想了解更多关于总部的信息，请一定填写您的真实信息，</p>
                        <p>以便于我们的工作人员及时联系到您。我们承诺为您的个人信息保密！</p>
                    </div>
                </div>
                <div class="message-panel clearfix">
                    <form id="inputForm" action="" method="post">
	                    <div class="message-l">
	                    	<input id="name" name="name" maxlength="255" placeholder="姓名" class="input-control"/>
	                    	<input id="telPhone" name="telPhone" maxlength="255" placeholder="手机" class="input-control"/>
	                    	<input id="mobilePhone" name="mobilePhone" maxlength="255" placeholder="电话" class="input-control"/>
	                    	<input id="qq" name="qq" maxlength="255" placeholder="微信" class="input-control"/>
	                    	<input id="wechat" name="wechat" maxlength="255" placeholder="QQ" class="input-control"/>
	                    	<input id="address" name="address" maxlength="255" placeholder="地址" class="input-control"/>
	                    </div>
	                    <div class="message-r">
	                    	<textarea id="remarks" name="remarks" cols="30" rows="11" class="textarea-control"></textarea>
	                       <!--  <input id="btnSubmit" type="button" value="提交" class="submit-control" onclick="alliancebusinessSave()"/> -->
 	                        <input id="btnSubmit" type="submit" value="提交" class="submit-control"/>
	                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
