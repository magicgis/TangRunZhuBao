<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
       <!-- 钻石专区专用jsp页面 -->
       <div class="column-zuanshi-con">
           <div class="zuanshi-row-three clearfix">
               <c:forEach items="${diamondList}" var="diamond">
                <div class="goods-item item04 fl">
                    <div class="sidebar">
                        <span class="rect rect1"></span>
                        <div class="side-line"></div>
                        <span class="rect rect2"></span>
                    </div>
                    <div class="goods-win">
            <span class="goods-image">
                            <img class="lazy" src="${diamond.imageDiamonds}" alt="">
                        </span>
                        <div class="bar">
                            <span class="subhead">${diamond.fullName}</span>
                            <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${diamond.id}" class="go-look">查看详情</a>
                        </div>   
                    </div>
                </div>
                </c:forEach>
           </div>
       </div>
      