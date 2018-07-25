/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.product.web.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.identity.User;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.service.SiteService;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.product.entity.Product;
import com.thinkgem.jeesite.modules.product.entity.UserProduct;
import com.thinkgem.jeesite.modules.product.service.ProductService;
import com.thinkgem.jeesite.modules.product.service.UserProductService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 网站Controller
 * @author ThinkGem
 * @version 2013-5-29
 */
@Controller
@RequestMapping(value = "${frontPath}")
public class FrontProductController extends BaseController{
	
	@Autowired
	private ProductService productService;
	@Autowired
	private SiteService siteService;
	@Autowired
	private UserProductService userProductService;
	
	/**
	 * 到达产品列表页面
	 * @param product
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "frontProductList")
	public String frontProductList(Product product, HttpServletRequest request, HttpServletResponse response, Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		return "modules/cms/front/themes/basic/frontProductList";
	}
	/**
	 * 查询列表页的数据
	 * @param product
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "getFrontProductListData")
	public String getFrontProductListData(Product product, HttpServletRequest request, HttpServletResponse response, Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		String pageSize = request.getParameter("pageSize");
		String pageNo = request.getParameter("pageNo");
		
		Page<Product> pages = new Page<Product>(request, response);
		if(pageSize!= null && StringUtils.isNotBlank(pageSize)){
			pages.setPageSize(Integer.parseInt(pageSize));
		}
		if(pageNo!= null && StringUtils.isNotBlank(pageNo)){
			pages.setPageNo(Integer.parseInt(pageNo));
		}
		product.setSite(site);
		product.setDelFlag(Product.DEL_FLAG_NORMAL);
		Page<Product> page = productService.findPage(pages, product);
		model.addAttribute("page", page);
		
		return "modules/cms/front/themes/basic/frontProductListData";
	}
	
	/**
	 * 产品详情
	 * 
	 */
	@RequestMapping(value = "frontProductDetail")
	public String frontProductDetail(Product product, HttpServletRequest request, HttpServletResponse response, Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		product = productService.get(product);
		product.setHits(product.getHits()+1);
		productService.save(product);//保存更改后的点击量对象
		model.addAttribute("product", product);//product是点击量更改后的对象
		
		/*查询我的收藏*/
		UserProduct userProduct = new UserProduct();
		userProduct.setProduct(product);
		userProduct.setUser(userProduct.getCurrentUser());
		userProduct.setDelFlag(UserProduct.DEL_FLAG_DELETE);
		List<UserProduct> userProductList = userProductService.findList(userProduct);
		int collectionState=1;//默认不存在
		if(userProductList.size()>0){
			collectionState = 0;//存在
		}
		model.addAttribute("collectionState", collectionState);
		
		return "modules/cms/front/themes/basic/frontProductDetail";
	}
	
	/**
	 * 获取首页翡翠栏目
	 * 
	 */
	@RequestMapping(value = "getFrontEmeraldListData")
	public String getFrontJadeiteListData(Product product, HttpServletRequest request, HttpServletResponse response, Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		String productMaterial = request.getParameter("productMaterial");
		String productCategory = request.getParameter("productCategory");
		if(productMaterial!= null && StringUtils.isNotBlank(productMaterial)){
			product.setProductMaterial(productMaterial);
		}
		if(productCategory!= null && StringUtils.isNotBlank(productCategory)){
			product.setProductCategory(productCategory);
		}
		product.setSite(site);
		product.setDelFlag(Product.DEL_FLAG_NORMAL);
		
		Page<Product> page = productService.findPage(new Page<Product>(1, 13), product);
		List<Product> productList = page.getList();
		model.addAttribute("productList", productList);
		model.addAttribute("productListSize", productList.size());
		return "modules/cms/front/themes/basic/frontIndexChildJadeite";
	}
	/**
	 * 获取首页和田玉栏目
	 * 
	 */
	@RequestMapping(value = "getFrontNephriteListData")
	public String getFrontHeTianJadeListData(Product product, HttpServletRequest request, HttpServletResponse response, Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		String productMaterial = request.getParameter("productMaterial");
		String productCategory = request.getParameter("productCategory");
		if(productMaterial!= null && StringUtils.isNotBlank(productMaterial)){
			product.setProductMaterial(productMaterial);
		}
		if(productCategory!= null && StringUtils.isNotBlank(productCategory)){
			product.setProductCategory(productCategory);
		}
		product.setSite(site);
		product.setDelFlag(Product.DEL_FLAG_NORMAL);
		
		Page<Product> page = productService.findPage(new Page<Product>(1, 10), product);
		List<Product> nephriteList = page.getList();
		model.addAttribute("nephriteList",nephriteList);
		model.addAttribute("nephriteListSize", nephriteList.size());
		return "modules/cms/front/themes/basic/frontIndexChildHeTianJade";
	}
	
	/**
	 * 获取首页钻石栏目
	 * 
	 */
	@RequestMapping(value = "getFrontDiamondListData")
	public String getFrontDiamondListData(Product product, HttpServletRequest request, HttpServletResponse response, Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		String productMaterial = request.getParameter("productMaterial");
		String productCategory = request.getParameter("productCategory");
		if(productMaterial!= null && StringUtils.isNotBlank(productMaterial)){
			product.setProductMaterial(productMaterial);
		}
		if(productCategory!= null && StringUtils.isNotBlank(productCategory)){
			product.setProductCategory(productCategory);
		}
		product.setSite(site);
		product.setDelFlag(Product.DEL_FLAG_NORMAL);
		
		Page<Product> page = productService.findPage(new Page<Product>(1, 6), product);
		List<Product> diamondList = page.getList();
		model.addAttribute("diamondList", diamondList);
		return "modules/cms/front/themes/basic/frontIndexChildDiamond";
	}
	@ResponseBody
	@RequestMapping(value = "operateCollection")
	public String operateCollection(HttpServletRequest request, HttpServletResponse response, Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		String productId = request.getParameter("productId");
		//String userId = request.getParameter("userId");
		String flag = request.getParameter("flag");
		String errorCode="1";
		
		if(productId==null || flag==null){
			errorCode="1";
		}else{
			UserProduct userProduct = new UserProduct();
			Product product = new Product();
			product.setId(productId);
			userProduct.setProduct(product);
			userProduct.setUser(userProduct.getCurrentUser());//userId 不用传递
			
			if("1".equalsIgnoreCase(flag)){//添加收藏
				userProductService.save(userProduct);
				errorCode="0";
				//return "0";
			}else{//取消收藏
				List<UserProduct> userProductList = userProductService.findList(userProduct);
				if(userProductList.size()>0){
					userProduct = userProductList.get(0);
					userProduct.setDelFlag(UserProduct.DEL_FLAG_DELETE);
					userProductService.save(userProductList.get(0));
					errorCode="0";
					//return "0";
				}else{
					errorCode="1";
					//return "1";
				}
				
			}
		}
		
		return errorCode;
		
	}
	
}
