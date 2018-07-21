<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
	   <div class="title">
       		<span class="name">我的收藏</span>
       </div>
       <!-- 分页数据 -->
	   <form id="searchForm" action="" method="post" >
		 <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		 <input id="userProductId" name="userProductId" type="hidden" value=""/>
	   </form>
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
              <!--  <th class="col09">产品介绍</th> -->
               <th class="col10">操作</th>
           </tr>
           <c:forEach items="${page.list}" var="userProduct">
             <tr class="linetr">
               <td class="col01" >
               		<a href="${ctx}/frontProductDetail${fns:getUrlSuffix()}?id=${userProduct.product.id}" class="item">
						<!-- 使用  imageShare1个图片，使用等比例缩放,不会变形 -->
	                    <img src="${userProduct.product.imageShare1}" alt="">
                 	</a>
               </td>
               <td class="col02">${userProduct.product.name}</td>
               <td class="col03">${fns:getDictLabel(userProduct.product.productCategory, 'product_category', '')}</td>
               <td class="col04">${fns:getDictLabel(userProduct.product.productMaterial, 'product_material', '')}</td>
               <td class="col05">${fns:getDictLabel(userProduct.product.productSpeciescolor, 'product_speciescolor', '')}</td>
               <td class="col06">${userProduct.product.weight}g</td>
               <td class="col07">${userProduct.product.size}mm</td>
               <td class="col08">${userProduct.product.technology}</td>
               <!-- <td class="col09"></td> -->
               <td class="col10"><a href="javascript:deleteUserProduct('${userProduct.id}');" class="delete">删除</a></td>
             </tr>
           </c:forEach>
       </table>
       <div class="pagination">${page}</div>