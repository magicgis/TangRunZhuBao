<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>招商加盟</title>
    <meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${site.description}" />
	<meta name="keywords" content="${site.keywords}" />
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
                    <div class="message-l">
                        <input type="text" placeholder="姓名" class="input-control"/>
                        <input type="text" placeholder="手机" class="input-control"/>
                        <input type="text" placeholder="电话" class="input-control"/>
                        <input type="text" placeholder="QQ" class="input-control"/>
                        <input type="text" placeholder="地址" class="input-control"/>
                    </div>
                    <div class="message-r">
                        <textarea name="" id="" cols="30" rows="10" class="textarea-control"></textarea>
                        <input type="submit" value="提交" class="submit-control"/>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
