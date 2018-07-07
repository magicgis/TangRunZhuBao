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
                        <i class="ico"></i>
                        会员信息
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
                        <dd><a href="" class="active"><i class="arrow"></i>个人信息</a></dd>
                        <dd><a href=""><i class="arrow"></i>修改密码</a></dd>
                        <dd><a href=""><i class="arrow"></i>我的收藏</a></dd>
                    </dl>
                </div>
            </div>
			
			<div class="personal-center-box">
                <div class="column-nav">
                    <a href="">会员中心</a>
                    <span class="ico"> -&gt; </span>
                    <a href="">我的收藏</a>
                </div>
                <div class="my-collect">
                    <div class="title">
                        <span class="name">我的收藏</span>
                    </div>
                    <table class="my-collect-list" width="100%" border="0">

                        <tr class="head">
                            <th class="col01">产品图片</th>
                            <th class="col02">产品名字</th>
                            <th class="col03">类别</th>
                            <th class="col04">材质</th>
                            <th class="col05">种色</th>
                            <th class="col06">重量</th>
                            <th class="col07">尺寸</th>
                            <th class="col08">工艺</th>
                            <th class="col09">产品介绍</th>
                            <th class="col10">操作</th>
                        </tr>
                        <tr class="linetr">
                            <td class="col01">
                            	<!-- 使用 imageEmeraldNephrite1 个图片，使用等比例缩放,不会变形 -->
                                <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/img(51).jpg" alt="">
                            </td>
                            <td class="col02">和田玉竹保平安</td>
                            <td class="col03">吊坠</td>
                            <td class="col04">翡翠</td>
                            <td class="col05">冰种</td>
                            <td class="col06">120g</td>
                            <td class="col07">15.5*6mm</td>
                            <td class="col08">手工雕刻</td>
                            <td class="col09">吾爱和田玉竹报平安</td>
                            <td class="col10"><a href="" class="delete">删除</a></td>
                        </tr>
                        <tr class="linetr">
                            <td class="col01">
                                <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/img(51).jpg" alt="">
                            </td>
                            <td class="col02">和田玉竹保平安</td>
                            <td class="col03">吊坠</td>
                            <td class="col04">翡翠</td>
                            <td class="col05">冰种</td>
                            <td class="col06">120g</td>
                            <td class="col07">15.5*6mm</td>
                            <td class="col08">手工雕刻</td>
                            <td class="col09">吾爱和田玉竹报平安</td>
                            <td class="col10"><a href="" class="delete">删除</a></td>
                        </tr>
                        <tr class="linetr">
                            <td class="col01">
                                <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/img(51).jpg" alt="">
                            </td>
                            <td class="col02">和田玉竹保平安</td>
                            <td class="col03">吊坠</td>
                            <td class="col04">翡翠</td>
                            <td class="col05">冰种</td>
                            <td class="col06">120g</td>
                            <td class="col07">15.5*6mm</td>
                            <td class="col08">手工雕刻</td>
                            <td class="col09">吾爱和田玉竹报平安</td>
                            <td class="col10"><a href="" class="delete">删除</a></td>
                        </tr> <tr class="linetr">
                        <td class="col01">
                            <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/img(51).jpg" alt="">
                        </td>
                        <td class="col02">和田玉竹保平安</td>
                        <td class="col03">吊坠</td>
                        <td class="col04">翡翠</td>
                        <td class="col05">冰种</td>
                        <td class="col06">120g</td>
                        <td class="col07">15.5*6mm</td>
                        <td class="col08">手工雕刻</td>
                        <td class="col09">吾爱和田玉竹报平安</td>
                        <td class="col10"><a href="" class="delete">删除</a></td>
                    </tr>
                        <tr class="linetr">
                            <td class="col01">
                                <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/img(51).jpg" alt="">
                            </td>
                            <td class="col02">和田玉竹保平安</td>
                            <td class="col03">吊坠</td>
                            <td class="col04">翡翠</td>
                            <td class="col05">冰种</td>
                            <td class="col06">120g</td>
                            <td class="col07">15.5*6mm</td>
                            <td class="col08">手工雕刻</td>
                            <td class="col09">吾爱和田玉竹报平安</td>
                            <td class="col10"><a href="" class="delete">删除</a></td>
                        </tr>
                    </table>
                </div>
			
        	</div>
        </div>
    </div>

</body>
</html>
