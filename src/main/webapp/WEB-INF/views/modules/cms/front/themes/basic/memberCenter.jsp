<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>个人信息</title>
    <meta name="decorator" content="cms_default_${site.theme}"/>
    <!-- <meta name ="keywords" content="Jewellery,Jades,Emerald,Nephrite,唐润珠宝,珠宝,玉器师,翡翠,和田玉">
	<meta name="description" content="唐润珠宝是一家以经营翡翠为主，集原料采购、研发设计、雕刻加工、批发零售、自营加盟连锁为一体的专业珠宝运营公司"> -->
	<meta name="description" content="${site.description}" />
	<meta name="keywords" content="${site.keywords}" />
	<script type="text/javascript">
		/*  点击“个人信息管理”导航之后颜色变色   */


        $(document).ready(function() {
            /*initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, '0', '0', '0');
            initComplexArea('cseachprov', 'cseachcity', 'cseachdistrict', area_array, sub_array, '0', '0', '0');*/

            $("#mobile").focus();
            $("#myForm").validate({
                //debug: true,
                messages: {
                    mobile: {
                        required:"手机号码不能为空",
                        confirmNewPassword: {equalTo: "输入与上面相同的密码"}
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
        });
        $.validator.addMethod("checkMobile",function(value,element,params){
            var checkName = /^1[3,5,7,8]\d{9}$/;
            return checkName.test(value);
        },"手机号码格式不正确");



        $(function(){
	        $(".personal-center-side .side-menu .side-menu-list dd a").click(function(){
	            $(".personal-center-side .side-menu .side-menu-list dd a").removeClass('active');
	            $(this).addClass('active');
	        })
	    })
	    
	    
	    function changeMemberCenter(flag){
            console.log('flag==============================================');
			var usuff = "${fns:getUrlSuffix()}";
			var action = "";
			if(flag==2){//修改密码
				action = ctx+"/frontMemberCenterResetPass"+usuff;
			}else if(flag==3){//我的收藏
				action = ctx+"/frontMemberCenterMyCollection"+usuff;
			}else if(flag==1){//个人信息
				action = ctx+"/frontMemberCenter"+usuff;
				window.location.href=action;
				return;
			}else{//如果为空则直接返回
				return false;
			}
			
			$.ajax({
			   type: "POST",
			   url: action,
			   //data: $("#myForm").serialize(),
			   success: function(msg){
				   $(".personal-center-box").html(msg);

				   //如果是"我的收藏"在进一步请求
				   if(flag==3){
					   getFrontMyCollenctionData();
				   }
			   }
			});
			return false;
		}
		//进到 “我的收藏中”请求数据
		function getFrontMyCollenctionData(){
			var usuff = "${fns:getUrlSuffix()}";
			$.ajax({
			   type: "POST",
			   url: ctx+"/frontMemberCenterMyCollectionData"+usuff,
			   data: $("#searchForm").serialize(),
			   success: function(msg){
				   $(".my-collect").html(msg);
			   }
			});
			return false;
		}
		
		/* 分页 */
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			/*使用ajax提交form表单*/
			getFrontMyCollenctionData();
        }
		
		//我的收藏中的删除
	    function deleteUserProduct(id){
			$("#userProductId").val(id);
			
			var usuff = "${fns:getUrlSuffix()}";
			$.ajax({
			   type: "POST",
			   url: ctx+"/frontMemberCenterMyCollectionDelete"+usuff,
			   data: $("#searchForm").serialize(),
			   success: function(errorCode){
				   $.jBox.tip('删除成功！','info');
				   /* if(errorCode==0){
			   			alert("删除成功！");
			   		}    */
			   }
			});
			//重新请求数据
			getFrontMyCollenctionData();
		}
	</script>
	
</head>
<body>
	<%@ include file="/WEB-INF/views/modules/cms/front/include/title.jsp"%>
    <div class="column-banner">
        <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/img (34).jpg" alt="">
    </div>

    <div class="personal-center clearfix">
        <div class="wrapper">
            <div class="personal-center-side">
                <div class="side-head">唐润集团</div>
                <div class="side-menu">
                    <div class="side-menu-title">
                        <i class="ico"></i>会员信息
                    </div>
                    <div class="user-info">
                        <div class="face">
                            <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/face.jpg" alt="">
                        </div>
                        <p class="username">用户名：${user.loginName }</p>
                        <p class="username">昵称：${user.name }</p>
                    </div>
                    <dl class="side-menu-list">
                        <dt>
                            <i class="ico"></i>
                           	 个人信息管理
                        </dt>
                        <dd><a href="javascript:changeMemberCenter(1);" class="active"><i class="arrow"></i>个人信息</a></dd>
                        <dd><a href="javascript:changeMemberCenter(2);"><i class="arrow"></i>修改密码</a></dd>
                        <dd><a href="javascript:changeMemberCenter(3);"><i class="arrow"></i>我的收藏</a></dd>
                    </dl>
                </div>
            </div>
            
            <!-- 三个模块公用的地方;  首次到用户个人信息页面-->
            <div class="personal-center-box">
                <div class="column-nav">
				    <a href="">会员中心</a>
				    	<span class="ico"> -&gt; </span>
				    <a href="">个人信息</a>
				</div>
				
				<div class="personal-info">
				    <div class="title">
				        <span class="name">个人信息</span>
				        <span class="subtitle">尽量填写完整信息，方便店家与你联系！</span>
				    </div>
				    <div class="personal-form clearfix">
				        
				       	<form id="myForm" action="${ctx}/frontMemberCenter${fns:getUrlSuffix()}" method="post">
							<sys:message content="${message}"/>
							<div class="form-column-control clearfix">
								<div class="name">登录名：</div>
								<div class="input-div-wrap">
									<!-- 隐藏域 -->
									<input type="text" id="loginName" name="loginName"  readonly class="input-control" value="${user.loginName}">
								</div>
							</div>
					        <div class="form-column-control clearfix">
					            <div class="name">姓名：</div>
					            <div class="input-div-wrap">
					            	<!-- 隐藏域 -->
					            	<input type="hidden" id="photo" name="photo" value="${user.photo}">
					            	<input type="hidden" id="phone" name="phone" value="${user.phone}">
					            	<input type="hidden" id="remarks" name="remarks" value="${user.remarks}">
					            	
					                <input type="text" id="name" name="name" class="input-control" value="${user.name}">
					            </div>
					        </div>
					        <div class="form-column-control clearfix">
					            <div class="name">邮箱地址：</div>
					            <div class="input-div-wrap">
					                <input type="text" id="email" name="email" class="input-control required email"  value="${user.email}">
					            </div>
					        </div>
					        <div class="form-column-control clearfix">
					            <div class="name">手机号码：</div>
					            <div class="input-div-wrap">
					                <input type="text" id="mobile" name="mobile" minlength="11" maxlength="11" class="input-control required" value="${user.mobile}">
					            </div>
					        </div>
					        <!-- <div class="form-column-control clearfix">
					            <div class="name">注册地址：</div>
					            <div class="input-div-wrap">
					                <select name="" id="" class="select-control">
					                    <option value="">请选择省</option>
					                </select>
					                <select name="" id="" class="select-control">
					                    <option value="">请选择市</option>
					                </select>
					                <select name="" id="" class="select-control">
					                    <option value="">请选择区</option>
					                </select>
					            </div>
					        </div>
					        <div class="form-column-control clearfix">
					            <div class="name">详细地址：</div>
					            <div class="input-div-wrap">
					                <input type="text" class="input-control">
					            </div>
					        </div> -->
					        <div class="submit-wrap clearfix">
					            <input type="submit"  class="submit-control" value="保存" />
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
			        	<!-- 使用工具类的热门产品   3个产品 -->
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

            </div>
        </div>
    </div>

</body>
</html>
