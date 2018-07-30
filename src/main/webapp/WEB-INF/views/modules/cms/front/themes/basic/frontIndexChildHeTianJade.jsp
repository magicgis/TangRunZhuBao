<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

       <!-- 和田玉专区专用jsp页面 -->
       <div class="column-hetianyu-con clearfix">
        <div class="hetianyu-row-three">
           <div class="goods-item item04 fl">
                     <div class="sidebar">
                         <span class="rect rect1"></span>
                         <div class="side-line"></div>
                         <span class="rect rect2"></span>
                     </div>
                     <div class="goods-win">
                     	 <c:if test="${nephriteListSize >0}">
		                     <span class="goods-image">
		                         <img class="lazy" src="${nephriteList[0].imageNephrite1}" alt="">
		                     </span>
	                         <div class="bar">
	                             <span class="name">${nephriteList[0].fullName}</span>
	                             <span class="subhead">${nephriteList[0].brand}</span>
	                             <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${nephriteList[0].id}" class="go-look">查看详情</a>
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
	                     <c:if test="${nephriteListSize >1}">
		                     <span class="goods-image">
		                         <img class="lazy" src="${nephriteList[1].imageNephrite1}" alt="">
		                     </span>
	                         <div class="bar">
	                             <span class="name">${nephriteList[1].fullName}</span>
	                             <span class="subhead">${nephriteList[1].brand}</span>
	                             <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${nephriteList[1].id}" class="go-look">查看详情</a>
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
	                     <c:if test="${nephriteListSize >2}">
		                     <span class="goods-image">
		                         <img class="lazy" src="${nephriteList[2].imageNephrite1}" alt="">
		                     </span>
	                         <div class="bar">
	                             <span class="name">${nephriteList[2].fullName}</span>
	                             <span class="subhead">${nephriteList[2].brand}</span>
	                             <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${nephriteList[2].id}" class="go-look">查看详情</a>
	                         </div>
	                     </c:if>
                     </div>
                 </div>
        </div>
          <div class="hetianyu-row-one-three clearfix">
                  <div class="column-one fl">
                      <div class="goods-item item05 fl">
                          <div class="sidebar">
                              <span class="rect rect1"></span>
                              <div class="side-line"></div>
                              <span class="rect rect2"></span>
                          </div>
                       <div class="goods-win">
		                      <c:if test="${nephriteListSize >3}"> 
		                          <span class="goods-image">
		                            <img class="lazy" src="${nephriteList[3].imageNephrite2}" alt="">
		                          </span>
	                              <div class="bar">
	                                  <span class="subhead">${nephriteList[3].fullName}</span>
	                                  <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${nephriteList[3].id}" class="go-look">查看详情</a>
	                              </div>
	                           </c:if>
                          </div>
                      </div>
                  </div>
                  <div class="column-three fl">
                      <div class="goods-item item06 fl">
                          <div class="sidebar">
                              <span class="rect rect1"></span>
                              <div class="side-line"></div>
                              <span class="rect rect2"></span>
                          </div>
                          <div class="goods-win">
			                  <c:if test="${nephriteListSize >4}">
			                      <span class="goods-image">
		                              <img class="lazy" src="${nephriteList[4].imageNephrite3}" alt="">
			                      </span>
	                              <div class="bar">
	                                  <span class="subhead">${nephriteList[4].fullName}</span>
	                                  <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${nephriteList[4].id}" class="go-look">查看详情</a>
	                              </div>
	                          </c:if>
                          </div>
                      </div>
                      <div class="goods-item item06 fl">
                          <div class="sidebar">
                              <span class="rect rect1"></span>
                              <div class="side-line"></div>
                              <span class="rect rect2"></span>
                          </div>
                          <div class="goods-win">
                          	<c:if test="${nephriteListSize >5}">
		                          <span class="goods-image">
		                            <img class="lazy" src="${nephriteList[5].imageNephrite3}" alt="">
		                          </span>
	                              <div class="bar">
	                                  <span class="subhead">${nephriteList[5].fullName}</span>
	                                  <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${nephriteList[5].id}" class="go-look">查看详情</a>
	                              </div>
	                            </c:if>
                          </div>
                      </div>
                      <div class="goods-item item06 fl">
                          <div class="sidebar">
                              <span class="rect rect1"></span>
                              <div class="side-line"></div>
                              <span class="rect rect2"></span>
                          </div>
                           <div class="goods-win">
                           		<c:if test="${nephriteListSize >6}">
		                          <span class="goods-image">
		                            <img class="lazy" src="${nephriteList[6].imageNephrite3}" alt="">
		                          </span>
	                              <div class="bar">
	                                  <span class="subhead">${nephriteList[6].fullName}</span>
	                                  <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${nephriteList[6].id}" class="go-look">查看详情</a>
	                              </div>
	                           </c:if>
                          </div>
                      </div>
                      <div class="goods-item item06 fl">
                          <div class="sidebar">
                              <span class="rect rect1"></span>
                              <div class="side-line"></div>
                              <span class="rect rect2"></span>
                          </div>
                           <div class="goods-win">
                           		<c:if test="${nephriteListSize >7}">
		                          <span class="goods-image">
		                            <img class="lazy" src="${nephriteList[7].imageNephrite3}" alt="">
		                          </span>
	                              <div class="bar">
	                                  <span class="subhead">${nephriteList[7].fullName}</span>
	                                  <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${nephriteList[7].id}" class="go-look">查看详情</a>
	                              </div>
	                           </c:if>
                          </div>
                      </div>
                      <div class="goods-item item06 fl">
                          <div class="sidebar">
                              <span class="rect rect1"></span>
                              <div class="side-line"></div>
                              <span class="rect rect2"></span>
                          </div>
                          <div class="goods-win">
	                          <c:if test="${nephriteListSize >8}">
		                        <span class="goods-image">
		                            <img class="lazy" src="${nephriteList[8].imageNephrite3}" alt="">
		                        </span>
                                <div class="bar">
                                  <span class="subhead">${nephriteList[8].fullName}</span>
                                  <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${nephriteList[8].id}" class="go-look">查看详情</a>
                                </div>
                              </c:if>
                          </div>
                      </div>
                      <div class="goods-item item06 fl">
                          <div class="sidebar">
                              <span class="rect rect1"></span>
                              <div class="side-line"></div>
                              <span class="rect rect2"></span>
                          </div>
                           <div class="goods-win">
                           		<c:if test="${nephriteListSize >9}">
		                          <span class="goods-image">
		                            <img class="lazy" src="${nephriteList[9].imageNephrite3}" alt="">
		                          </span>
	                              <div class="bar">
	                                  <span class="subhead">${nephriteList[9].fullName}</span>
	                                  <a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${nephriteList[9].id}" class="go-look">查看详情</a>
	                              </div>
	                           </c:if>
                          </div>
                      </div>
                  </div>
              </div>
      </div>
