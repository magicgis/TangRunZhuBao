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
                <div class="personal-info">
                    <div class="title">
                        <span class="name">个人信息</span>
                        <span class="subtitle">尽量填写完整信息，方便店家与你联系！</span>
                    </div>
                    <div class="personal-form clearfix">
                        <div class="form-column-control clearfix">
                            <div class="name">姓名：</div>
                            <div class="input-div-wrap">
                                <input type="text" class="input-control">
                            </div>
                        </div>
                        <div class="form-column-control clearfix">
                            <div class="name">邮箱地址：</div>
                            <div class="input-div-wrap">
                                <input type="text" class="input-control">
                            </div>
                        </div>
                        <div class="form-column-control clearfix">
                            <div class="name">手机号码：</div>
                            <div class="input-div-wrap">
                                <input type="text" class="input-control">
                            </div>
                        </div>
                        <div class="form-column-control clearfix">
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
                        </div>
                        <div class="submit-wrap clearfix">
                            <input type="submit"  class="submit-control" value="保存" />
                        </div>
                    </div>
                </div>
                <div class="guess-you-like">
                    <div class="guess-title">
                        <span class="name">猜你喜欢</span>
                        <a href="" class="refresh"><i class="ico"></i>换一组</a>
                    </div>
                    <ul class="you-like-list clearfix">
                        <li class="item">
                                <div class="img">
                                    <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/img(36).jpg" alt="">
                                </div>
                                <div class="handel">
                                    <span class="name">和田玉竹报平安</span>
                                     <a href="" class="look">查看详情</a>
                                </div>
                        </li>
                        <li class="item">
                            <div class="img">
                                <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/img(37).jpg" alt="">
                            </div>
                            <div class="handel">
                                <span class="name">和田玉竹报平安</span>
                                <a href="" class="look">查看详情</a>
                            </div>
                        </li>
                        <li class="item">
                            <div class="img">
                                <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/img(38).jpg" alt="">
                            </div>
                            <div class="handel">
                                <span class="name">和田玉竹报平安</span>
                                <a href="" class="look">查看详情</a>
                            </div>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </div>

</body>
</html>
