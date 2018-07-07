<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<div class="column-con">
	${article.articleData.content}
    <div class="article-handle clearfix">
        <div class="article-nav">
            <p><a href="javascript:;"><span class="label">上一篇：</span>翡翠珍品鉴赏</a></p>
            <p><a href="javascript:;"><span class="label">下一篇：</span>翡翠珍品鉴赏</a></p>
        </div>
        <div class="article-share">
            <a href="javascript:;" class="share-ico"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/ico7.jpg" alt=""></a>
            <a href="javascript:;" class="share-ico"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/ico8.jpg" alt=""></a>
            <a href="javascript:;" class="share-ico"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/ico9.jpg" alt=""></a>
            <a href="javascript:;" class="share-ico"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/ico10.jpg" alt=""></a>
            <a href="javascript:;" class="share-ico"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/ico11.jpg" alt=""></a>
        </div>
    </div>
</div>