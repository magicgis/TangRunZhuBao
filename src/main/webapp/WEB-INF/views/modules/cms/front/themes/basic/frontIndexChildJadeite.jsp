<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!-- 翡翠专区专用jsp页面    -->
<div class="fecui-row-two clearfix">
         <div class="goods-item item01 fl">
             <div class="sidebar">
                 <span class="rect rect1"></span>
                 <div class="side-line"></div>
                 <span class="rect rect2"></span>
             </div>
             <div class="goods-win">
                <c:if test="${productListSize>0}">
	                 <span class="goods-image">
	                   	<img class="lazy" src="${productList[0].imageEmerald1}" alt="">
			        </span>
			        <div class="bar">
			            <span class="name">${productList[0].fullName}</span>
			            <span class="subhead">${productList[0].brand}</span>
			            <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${productList[0].id}" class="go-look">查看详情</a>
			        </div>
		        </c:if>
		        
		    </div>
		</div>
		
		<div class="goods-item item02 fl">
		    <div class="sidebar">
		        <span class="rect rect1"></span>
		        <div class="side-line"></div>
		        <span class="rect rect2"></span>
		    </div>
		    <div class="goods-win">
	           <c:if test="${productListSize>1}">
	           
	           
		           <span class="goods-image">
		            <img class="lazy" src="${productList[1].imageEmerald2}" alt="">
		           </span>
		           <div class="bar">
		               <span class="name">${productList[1].fullName}</span>
		               <span class="subhead">${productList[1].brand}</span>
		               <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${productList[1].id}" class="go-look">查看详情</a>
		           </div>
	            </c:if>
	       </div>
	  	</div>
</div>

<div class="fecui-row-four clearfix">
    <div class="goods-item item03 fl">
        <div class="sidebar">
            <span class="rect rect1"></span>
            <div class="side-line"></div>
            <span class="rect rect2"></span>
        </div>
        <div class="goods-win">
        	
        	<c:if test="${productListSize>2}">
	            <span class="goods-image">
	                <img class="lazy" src="${productList[2].imageEmerald3}" alt="">
		        </span>
		        <div class="bar">
		            <span class="subhead">${productList[2].fullName}</span>
		            <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${productList[2].id}" class="go-look">查看详情</a>
		        </div>
	        </c:if>
	        
	    </div>
	</div>
	<div class="goods-item item03 fl">
	    <div class="sidebar">
	        <span class="rect rect1"></span>
	        <div class="side-line"></div>
	        <span class="rect rect2"></span>
	    </div>
	    <div class="goods-win">
	    	<c:if test="${productListSize>3}">
	            <span class="goods-image">
	                <img class="lazy" src="${productList[3].imageEmerald3}" alt="">
		        </span>
		        <div class="bar">
		            <span class="subhead">${productList[3].fullName}</span>
		            <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${productList[3].id}" class="go-look">查看详情</a>
		        </div>
	       </c:if>
	    </div>
	</div>
	<div class="goods-item item03 fl">
	    <div class="sidebar">
	        <span class="rect rect1"></span>
	        <div class="side-line"></div>
	        <span class="rect rect2"></span>
	    </div>
	    <div class="goods-win">
	    
	    	<c:if test="${productListSize>4}">
            <span class="goods-image">
                <img class="lazy" src="${productList[4].imageEmerald3}" alt="">
	        </span>
	        <div class="bar">
	            <span class="subhead">${productList[4].fullName}</span>
	            <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${productList[4].id}" class="go-look">查看详情</a>
	        </div>
	        </c:if>
	        
	        
	    </div>
	</div>
	<div class="goods-item item03 fl">
	    <div class="sidebar">
	        <span class="rect rect1"></span>
	        <div class="side-line"></div>
	        <span class="rect rect2"></span>
	    </div>
	    <div class="goods-win">
	    	<c:if test="${productListSize>5}">
            <span class="goods-image">
                <img class="lazy" src="${productList[5].imageEmerald3}" alt="">
	        </span>
	        <div class="bar">
	            <span class="subhead">${productList[5].fullName}</span>
	            <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${productList[5].id}" class="go-look">查看详情</a>
	        </div>
	        </c:if>
        </div>
   	</div>
</div>

<div class="fecui-row-three clearfix">
  <div class="goods-item item04 fl">
      <div class="sidebar">
          <span class="rect rect1"></span>
          <div class="side-line"></div>
          <span class="rect rect2"></span>
      </div>
      <div class="goods-win">
      	 <c:if test="${productListSize>6}">
	         <span class="goods-image">
	           <img class="lazy" src="${productList[6].imageEmerald4}" alt="">
	 		  </span>
	         <div class="bar">
	             <span class="name">${productList[6].fullName}</span>
	             <span class="subhead">${productList[6].brand}</span>
	             <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${productList[6].id}" class="go-look">查看详情</a>
	         </div>
         </c:if>
      </div>
  </div>
  <div class="goods-item item04 fl">
      <div class="sidebar">
          <span class="rect rect1"></span>
          <div class="side-line"></div>
          <span class="rect rect2"></span>
      </div>
      <div class="goods-win">
      	  <c:if test="${productListSize>7}">
          <span class="goods-image">
              <img class="lazy" src="${productList[7].imageEmerald4}" alt="">
          </span>
          <div class="bar">
              <span class="name">${productList[7].fullName}</span>
              <span class="subhead">${productList[7].brand}</span>
              <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${productList[7].id}" class="go-look">查看详情</a>
          </div>
          </c:if>
     </div>
  </div>
  <div class="goods-item item04 fl">
      <div class="sidebar">
          <span class="rect rect1"></span>
          <div class="side-line"></div>
          <span class="rect rect2"></span>
      </div>
      <div class="goods-win">
      	<c:if test="${productListSize>8}">
          <span class="goods-image">
            <img class="lazy" src="${productList[8].imageEmerald4}" alt="">
          </span>
          <div class="bar">
              <span class="name">${productList[8].fullName}</span>
              <span class="subhead">${productList[8].brand}</span>
              <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${productList[8].id}" class="go-look">查看详情</a>
          </div>
         </c:if>
      </div>
   </div>
</div>

<div class="fecui-row-four clearfix">
   <div class="goods-item item03 fl">
     <div class="sidebar">
         <span class="rect rect1"></span>
         <div class="side-line"></div>
         <span class="rect rect2"></span>
     </div>
     <div class="goods-win">
     <c:if test="${productListSize>9}">
         <span class="goods-image">
             <img class="lazy" src="${productList[9].imageEmerald3}" alt="">
         </span>
         <div class="bar">
             <span class="subhead">${productList[9].fullName}</span>
             <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${productList[9].id}" class="go-look">查看详情</a>
         </div>
         </c:if>
     </div>
  </div>
  <div class="goods-item item03 fl">
      <div class="sidebar">
          <span class="rect rect1"></span>
          <div class="side-line"></div>
          <span class="rect rect2"></span>
      </div>
      <div class="goods-win">
      	 <c:if test="${productListSize>10}">
	         <span class="goods-image">
	             <img class="lazy" src="${productList[10].imageEmerald3}" alt="">
	         </span>
	         <div class="bar">
	             <span class="subhead">${productList[10].fullName}</span>
	             <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${productList[10].id}" class="go-look">查看详情</a>
	         </div>
         </c:if>
      </div>
  </div>
  <div class="goods-item item03 fl">
      <div class="sidebar">
          <span class="rect rect1"></span>
          <div class="side-line"></div>
          <span class="rect rect2"></span>
      </div>
      <div class="goods-win">
      	<c:if test="${productListSize>11}">
	         <span class="goods-image">
	             <img class="lazy" src="${productList[11].imageEmerald3}" alt="">
	         </span>
	         <div class="bar">
	             <span class="subhead">${productList[11].fullName}</span>
	             <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${productList[11].id}" class="go-look">查看详情</a>
	         </div>
         </c:if>
      </div>
  </div>
  <div class="goods-item item03 fl">
      <div class="sidebar">
          <span class="rect rect1"></span>
          <div class="side-line"></div>
          <span class="rect rect2"></span>
      </div>
      <div class="goods-win">
      	<c:if test="${productListSize>12}">
	         <span class="goods-image">
	             <img class="lazy" src="${productList[12].imageEmerald3}" alt="">
	         </span>
	         <div class="bar">
	             <span class="subhead">${productList[12].fullName}</span>
	             <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${productList[12].id}" class="go-look">查看详情</a>
	         </div>
         </c:if>
      </div>
  </div>
</div>
