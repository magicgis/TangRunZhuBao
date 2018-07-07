/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.product.utils;
import java.util.ArrayList;
import java.util.List;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.product.entity.Product;
import com.thinkgem.jeesite.modules.product.service.ProductService;



/**
 * 产品工具类
 * @author David
 * @version 2018-06-05
 */
public class ProductUtils {
	
	private static ProductService productService = SpringContextHolder.getBean(ProductService.class);
    
	private static final String PRODUCT_CACHE = "productCache";
	private static final String PRODUCT_HOT_CACHE = "productHotCache";
	
	/**
	 * 获得 产品列表 <产品列表页暂时不用>
	 * @param siteId 站点编号
	 * @param delFlag 删除标记
	 */
	public static List<Product> getProductList(String siteId,String delFlag){
		@SuppressWarnings("unchecked")
		List<Product> productList = (List<Product>)CacheUtils.get(PRODUCT_CACHE, "productList_"+siteId);
		if (productList == null){//productList的值是从这里设定（首次在这里设定，以后每次在这里取）
			Product product = new Product();
			product.setSite(new Site(siteId));
			product.setDelFlag(delFlag);
			Page<Product> page = new Page<Product>(1, 12);//查询前12条记录
			
			page = productService.findPage(page, product);
			
			productList = page.getList();
			CacheUtils.put(PRODUCT_CACHE, "productList_"+siteId, productList);
		}
		return productList;
	}
	
	/**
	 * 将传入的一个字符串中的图片路径分割
	 * @param path 传入的图片路径
	 * @return List<String>
	 */
	public static List<String> getImageByPath(String path){
		List<String> imageList = new ArrayList<String>();
		if((path != null) && (path.length()>0)){
			/* |/TangRunZhuBao/userfiles/1/images/product/share/2018/06/imageShare2A.jpg|/TangRunZhuBao/userfiles/1/images/product/share/2018/06/imageShare2B.jpg
			 * 先去掉 首位，然后通过 |分割
			 * */  
			String newPath= path.substring(1, path.length());
			String[] newPathArray = newPath.split("\\|");
			for (int i = 0; i < newPathArray.length; i++) {
				imageList.add(newPathArray[i]);
			}
		}
		
		return imageList;
	}
	
	/**
	 * 获取热门产品
	 * @param siteId 站点id
	 * @param delFlag 删除标记
	 * @param pageSize 查询多少条数据
	 * @return
	 */
	public static List<Product> getHotProductList(String siteId,String delFlag,Integer pageSize){
		@SuppressWarnings("unchecked")
		List<Product> productHotList = (List<Product>)CacheUtils.get(PRODUCT_HOT_CACHE, "productHotList_"+siteId);
		if (productHotList == null){//productList的值是从这里设定（首次在这里设定，以后每次在这里取）
			Product product = new Product();
			product.setSite(new Site(siteId));
			product.setDelFlag(delFlag);

			Page<Product> page = new Page<Product>(1, pageSize);//查询前12条记录
			page.setOrderBy("hits asc");//根据点击量来进行统计是否热门产品
			page = productService.findPage(page, product);
			productHotList = page.getList();
	
			CacheUtils.put(PRODUCT_HOT_CACHE, "productHotList_"+siteId, productHotList);
		}
		return productHotList;
	}
	
	
	
	
	 

}