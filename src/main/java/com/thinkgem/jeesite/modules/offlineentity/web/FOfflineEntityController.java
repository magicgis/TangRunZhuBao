/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.offlineentity.web;

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
import com.thinkgem.jeesite.modules.offlineentity.entity.FOfflineEntity;
import com.thinkgem.jeesite.modules.offlineentity.service.FOfflineEntityService;

/**
 * 线下实体店管理Controller
 * @author David
 * @version 2018-07-17
 */
@Controller
@RequestMapping(value = "${adminPath}/offlineentity/fOfflineEntity")
public class FOfflineEntityController extends BaseController {

	@Autowired
	private FOfflineEntityService fOfflineEntityService;
	
	@ModelAttribute
	public FOfflineEntity get(@RequestParam(required=false) String id) {
		FOfflineEntity entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = fOfflineEntityService.get(id);
		}
		if (entity == null){
			entity = new FOfflineEntity();
		}
		return entity;
	}
	
	@RequiresPermissions("offlineentity:fOfflineEntity:view")
	@RequestMapping(value = {"list", ""})
	public String list(FOfflineEntity fOfflineEntity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<FOfflineEntity> page = fOfflineEntityService.findPage(new Page<FOfflineEntity>(request, response), fOfflineEntity); 
		model.addAttribute("page", page);
		return "modules/offlineentity/fOfflineEntityList";
	}

	@RequiresPermissions("offlineentity:fOfflineEntity:view")
	@RequestMapping(value = "form")
	public String form(FOfflineEntity fOfflineEntity, Model model) {
		model.addAttribute("fOfflineEntity", fOfflineEntity);
		return "modules/offlineentity/fOfflineEntityForm";
	}

	@RequiresPermissions("offlineentity:fOfflineEntity:edit")
	@RequestMapping(value = "save")
	public String save(FOfflineEntity fOfflineEntity, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, fOfflineEntity)){
			return form(fOfflineEntity, model);
		}
		fOfflineEntityService.save(fOfflineEntity);
		addMessage(redirectAttributes, "保存线下实体店管理成功");
		return "redirect:"+Global.getAdminPath()+"/offlineentity/fOfflineEntity/?repage";
	}
	
	@RequiresPermissions("offlineentity:fOfflineEntity:edit")
	@RequestMapping(value = "delete")
	public String delete(FOfflineEntity fOfflineEntity, RedirectAttributes redirectAttributes) {
		fOfflineEntityService.delete(fOfflineEntity);
		addMessage(redirectAttributes, "删除线下实体店管理成功");
		return "redirect:"+Global.getAdminPath()+"/offlineentity/fOfflineEntity/?repage";
	}

}