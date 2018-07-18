<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
    
    <div class="wrapper">
        <ul class="productlists clearfix">
            <c:forEach items="${page.list}" var="product">
             <li>
                 <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${product.id}" class="item">
                     <img src="${product.imageShare1}" alt="${product.fullName}">
                 </a>
             </li>
           	</c:forEach>
        </ul>
        <!-- 样式需要美化 ******功能待做****** -->
        <div class="pagination">${page}</div>
        
    </div>
