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
		/*  点击“个人信息管理”导航之后颜色变色    */
	    $(function(){
	        $(".personal-center-side .side-menu .side-menu-list dd a").click(function(){
	            $(".personal-center-side .side-menu .side-menu-list dd a").removeClass('active');
	            $(this).addClass('active');
	            
	            
	            
	            
	        })
	    })
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
                        <p class="username">用户名：1527856895</p>
                        <p class="username">昵称：凤吹落叶</p>
                    </div>
                    <dl class="side-menu-list">
                        <dt>
                            <i class="ico"></i>
                           	 个人信息管理
                        </dt>
                        <dd><a href="javascript:;" class="active"><i class="arrow"></i>个人信息</a></dd>
                        <dd><a href="javascript:;"><i class="arrow"></i>修改密码</a></dd>
                        <dd><a href="javascript:;"><i class="arrow"></i>我的收藏</a></dd>
                    </dl>
                </div>
            </div>
            
            
            
            <div class="personal-center-box">
                

            </div>
        </div>
    </div>

</body>
</html>
