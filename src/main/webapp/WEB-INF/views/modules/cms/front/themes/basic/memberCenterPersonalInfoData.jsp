<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
	<div class="column-nav">
	    <a href="">会员中心</a>
	    	<span class="ico"> -&gt; </span>
	    <a href="">个人信息</a>
	</div>
	<!-- 暂时不用 -->
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