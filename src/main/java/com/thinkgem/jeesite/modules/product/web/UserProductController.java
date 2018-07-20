/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.product.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.product.entity.UserProduct;
import com.thinkgem.jeesite.modules.product.service.UserProductService;

/**
 * 我的收藏Controller
 * @author David
 * @version 2018-07-20
 */
@Controller
@RequestMapping(value = "${adminPath}/product/userProduct")
public class UserProductController extends BaseController {

	@Autowired
	private UserProductService userProductService;
	
	@ModelAttribute
	public UserProduct get(@RequestParam(required=false) String id) {
		UserProduct entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = userProductService.get(id);
		}
		if (entity == null){
			entity = new UserProduct();
		}
		return entity;
	}
	
	@RequiresPermissions("product:userProduct:view")
	@RequestMapping(value = {"list", ""})
	public String list(UserProduct userProduct, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<UserProduct> page = userProductService.findPage(new Page<UserProduct>(request, response), userProduct); 
		model.addAttribute("page", page);
		return "modules/product/userProductList";
	}

	@RequiresPermissions("product:userProduct:view")
	@RequestMapping(value = "form")
	public String form(UserProduct userProduct, Model model) {
		model.addAttribute("userProduct", userProduct);
		return "modules/product/userProductForm";
	}

	@RequiresPermissions("product:userProduct:edit")
	@RequestMapping(value = "save")
	public String save(UserProduct userProduct, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, userProduct)){
			return form(userProduct, model);
		}
		userProductService.save(userProduct);
		addMessage(redirectAttributes, "保存我的收藏成功");
		return "redirect:"+Global.getAdminPath()+"/product/userProduct/?repage";
	}
	
	@RequiresPermissions("product:userProduct:edit")
	@RequestMapping(value = "delete")
	public String delete(UserProduct userProduct, RedirectAttributes redirectAttributes) {
		userProductService.delete(userProduct);
		addMessage(redirectAttributes, "删除我的收藏成功");
		return "redirect:"+Global.getAdminPath()+"/product/userProduct/?repage";
	}

}