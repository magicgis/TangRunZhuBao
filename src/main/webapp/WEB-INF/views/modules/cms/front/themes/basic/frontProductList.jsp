<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>产品列表</title>
    <meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${site.description}" />
	<meta name="keywords" content="${site.keywords}" />
	<script type="text/javascript">
		$(document).ready(function() {
			getProductListData();
		});
		
		function getProductListData(){
			var usuff = "${fns:getUrlSuffix()}";
			$.ajax({
			   type: "POST",
			   url: ctx+"/getFrontProductListData"+usuff,
			   data: $("#searchForm").serialize(),
			   success: function(msg){
				   $(".product-list").html(msg);
			   }
			});
			return false;
		}
		
		//将选中的类别、材质、种色值设定到指定的input中
		function setPcmsValue(flag,value){
			//设定的值在form表单中提交
			if(flag == 'c'){
				$("#productCategory").val(value);
			}else if(flag == 'm'){
				$("#productMaterial").val(value);
			}else if(flag == 's'){
				$("#productSpeciescolor").val(value);
			}else if(flag == 'cAll'){//选择类别全部时
				$("#productCategory").val("");
			}else if(flag == 'mAll'){//选择材质全部时
				$("#productMaterial").val("");
			}else if(flag == 'sAll'){//选择种色全部时
				$("#productSpeciescolor").val("");
			}else{
				
			}
			
			/*使用ajax提交form表单*/
			getProductListData();
		}
		/* 分页 */
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			/*使用ajax提交form表单*/
			getProductListData();
        }
		
		
		
	</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/modules/cms/front/include/title.jsp"%>
    
    <div class="column-banner">
        <img src="${ctxStatic}/modules/cms/front/themes/basic/uploads/img (27).jpg" alt="">
    </div>
	<form:form id="searchForm" modelAttribute="product" action="${ctx}/frontProductList/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

		<input id="productCategory" name="productCategory" type="hidden" value="${product.productCategory}"/>
		<input id="productMaterial" name="productMaterial" type="hidden" value="${product.productMaterial}"/>
		<input id="productSpeciescolor" name="productSpeciescolor" type="hidden" value="${product.productSpeciescolor}"/>
	</form:form>
	
    <div class="product-cate">
        <div class="wrapper">
            <dl class="clearfix">
                <dt class="label">类别：</dt>
                <dd class="cates">
                    <div class="cates-list" data-status="0" data-parent="类别" data-id="0">
                    	<a href="javascript:setPcmsValue('cAll','');" class="item">全部</a>
                    	<!-- 循环遍历数据字典中内容  -->
                    	<c:forEach items="${fns:getDictList('product_category')}" var="productCategory">
                    		<a href="javascript:setPcmsValue('c','${productCategory.value}');" class="item">${productCategory.label}</a>
                    	</c:forEach>
                    	
                    	<a href="javascript:;" class="more-btn cate-more-btn">
                           	更多<i class="ico"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/down-arrow.png" /></i>
                        </a>
                    </div>
                </dd>
            </dl>
            <dl class="clearfix">
                <dt class="label">材质：</dt>
                <dd class="cates">
                    <div class="cates-list" data-status="0" data-parent="材质" data-id="1">
                    	<a href="javascript:setPcmsValue('mAll','');" class="item">全部</a>
                    	<c:forEach items="${fns:getDictList('product_material')}" var="productMaterial">
                    		<a href="javascript:setPcmsValue('m','${productMaterial.value}');" class="item">${productMaterial.label}</a>
                    	</c:forEach>
                    	<a href="javascript:;" class="more-btn cate-more-btn">
                           	更多<i class="ico"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/down-arrow.png" /></i>
                        </a>
                    </div>
                </dd>
            </dl>
            <dl class="clearfix">
                <dt class="label">种色：</dt>
                <dd class="cates">
                    <div class="cates-list" data-status="0" data-parent="种色" data-id="2">
                    	<a href="javascript:setPcmsValue('sAll','');" class="item">全部</a>
                    	<c:forEach items="${fns:getDictList('product_speciescolor')}" var="productSpeciescolor">
                    		<a href="javascript:setPcmsValue('s','${productSpeciescolor.value}');" class="item">${productSpeciescolor.label}</a>
                    	</c:forEach>
                    	
                     	<a href="javascript:;" class="more-btn cate-more-btn">
                           	更多<i class="ico"><img src="${ctxStatic}/modules/cms/front/themes/basic/asset/img/down-arrow.png" /></i>
                        </a>
                    </div>
                </dd>
            </dl>
        </div>
    </div>
    <div class="screen-results">
        <div class="wrapper">
            <dl id="screen-results">
                <dt>筛选结果:</dt>
                <dd>
                  <!--<a href="javascript:;" class="check-item"><span class="text">类别·<b>满绿</b></span><i>×</i></a>-->

                </dd>
            </dl>
        </div>
    </div>

    
    <!-- 不放到form表单中 -->
    <script>
	        $(function(){
	            $(".cate-more-btn").click(function(){
	                if($(this).parent().attr('data-status')== '0'){
	                	 $(".cate-more-btn").find('img').attr('src',ctxStatic+'/modules/cms/front/themes/basic/asset/img/up-arrow.png');
	                    $(this).parent().css('height','auto');
	                    $(this).parent().attr('data-status','1');
	                }else{
	                	$(".cate-more-btn").find('img').attr('src',ctxStatic+'/modules/cms/front/themes/basic/asset/img/down-arrow.png');
	                    $(this).parent().css('height','60px');
	                    $(this).parent().attr('data-status','0');
	                }
	            })
	            
	            /*筛选条件初始化数组*/
	            var screenArray = [
	                {type:'0',name:'0'},
	                {type:'0',name:'0'},
	                {type:'0',name:'0'}
	            ];
	
	            $(".cates-list .item").click(function(){//选择条件
	                $(".screen-results,#screen-results").show();
	                var str ='';
	                var name = $(this).html();
	                var type = $(this).parent().attr('data-parent');
	                var id = $(this).parent().attr('data-id');
	                screenArray[id].type = type;
	                screenArray[id].name = name;
	               /* console.log(screenArray);*/
	                $(this).parent().find(".item").removeClass('active');
	                $(this).addClass('active');
	                for(j = 0; j < screenArray.length; j++) {
	                    if(screenArray[j].type!='0'){
	                        str += '<a href="javascript:;" class="check-item"><span class="text">'+screenArray[j].type+'·<b>'+screenArray[j].name+'</b></span><i data-id="'+j+'">×</i></a>';
	                    }
	                   /* console.log(screenArray[j].type);*/
	                }
	
	                $("#screen-results dd").empty().append(str+'<a href="javascript:;" class="resetBtn">重置筛选条件</a>');
	            })
	
	           $("#screen-results dd").on('click','i',function(){//对样式screen-results dd下的子元素i操作，即是对
	               var num=0;
	               var str ='';
	               var id = $(this).attr('data-id');
	               $('.cates-list[data-id$='+id+']').find('.item').removeClass('active');
				   //要删除的重置为0
	               screenArray[id].type = '0';
	               screenArray[id].name = '0';
	               
	               //重新生成选中的信息
	               for(j = 0; j < screenArray.length; j++) {
	                   if(screenArray[j].type!='0'){
	                       str += '<a href="javascript:;" class="check-item"><span class="text">'+screenArray[j].type+'· <b>'+screenArray[j].name+'</b></span><i data-id="'+j+'">×</i></a>';
	                   }else{
	                       num=num+1;
	                   }
	                   /* console.log(screenArray[j].type);*/
	               }
	               console.log(num);
	               if(num == '3'){
	                   $("#screen-results").hide();
	                   num = 0;
	               }
	               $("#screen-results dd").empty().append(str+'<a href="javascript:;" class="resetBtn">重置筛选条件</a>');
				   
	               //根据id的值进行判断是删除了什么条件，然后去掉相应的值
	               if(id=='0'){
	            	   $("#productCategory").val("");
	               }else if(id=='1'){
	            	   $("#productMaterial").val("");
	               }else{//id=='2'
	            	   $("#productSpeciescolor").val("");
	               }
	               getProductListData();//查询相关数据
	               
	           })
	            $("#screen-results").on('click','.resetBtn',function(){//重置筛选条件
	                $(".screen-results").hide();
	                $(".cates-list .item").removeClass('active');
	                screenArray = [
	                    {type:'0',name:'0'},
	                    {type:'0',name:'0'},
	                    {type:'0',name:'0'}
	                ];
	                
	                //清空条件后，发出请求
	                $("#productCategory").val("");
					$("#productMaterial").val("");
					$("#productSpeciescolor").val("");
					getProductListData();
	            })
	        })
	    </script>
    
    <div class="product-list">
    </div>

</body>

</html>
