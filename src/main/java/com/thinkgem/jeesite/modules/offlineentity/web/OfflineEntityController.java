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
import com.thinkgem.jeesite.modules.offlineentity.entity.OfflineEntity;
import com.thinkgem.jeesite.modules.offlineentity.service.OfflineEntityService;

/**
 * 线下实体店管理Controller
 * @author David
 * @version 2018-07-17
 */
@Controller
@RequestMapping(value = "${adminPath}/offlineentity/offlineEntity")
public class OfflineEntityController extends BaseController {

	@Autowired
	private OfflineEntityService offlineEntityService;
	
	@ModelAttribute
	public OfflineEntity get(@RequestParam(required=false) String id) {
		OfflineEntity entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = offlineEntityService.get(id);
		}
		if (entity == null){
			entity = new OfflineEntity();
		}
		return entity;
	}
	
	@RequiresPermissions("offlineentity:offlineEntity:view")
	@RequestMapping(value = {"list", ""})
	public String list(OfflineEntity offlineEntity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OfflineEntity> page = offlineEntityService.findPage(new Page<OfflineEntity>(request, response), offlineEntity); 
		model.addAttribute("page", page);
		return "modules/offlineentity/offlineEntityList";
	}

	@RequiresPermissions("offlineentity:offlineEntity:view")
	@RequestMapping(value = "form")
	public String form(OfflineEntity offlineEntity, Model model) {
		model.addAttribute("offlineEntity", offlineEntity);
		return "modules/offlineentity/offlineEntityForm";
	}

	@RequiresPermissions("offlineentity:offlineEntity:edit")
	@RequestMapping(value = "save")
	public String save(OfflineEntity offlineEntity, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, offlineEntity)){
			return form(offlineEntity, model);
		}
		offlineEntityService.save(offlineEntity);
		addMessage(redirectAttributes, "保存线下实体店管理成功");
		return "redirect:"+Global.getAdminPath()+"/offlineentity/offlineEntity/?repage";
	}
	
	@RequiresPermissions("offlineentity:offlineEntity:edit")
	@RequestMapping(value = "delete")
	public String delete(OfflineEntity offlineEntity, RedirectAttributes redirectAttributes) {
		offlineEntityService.delete(offlineEntity);
		addMessage(redirectAttributes, "删除线下实体店管理成功");
		return "redirect:"+Global.getAdminPath()+"/offlineentity/offlineEntity/?repage";
	}

}