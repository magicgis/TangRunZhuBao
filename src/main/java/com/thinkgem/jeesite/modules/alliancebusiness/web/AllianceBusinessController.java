/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.alliancebusiness.web;

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
import com.thinkgem.jeesite.modules.alliancebusiness.entity.AllianceBusiness;
import com.thinkgem.jeesite.modules.alliancebusiness.service.AllianceBusinessService;

/**
 * 加盟商管理Controller
 * @author David
 * @version 2018-07-17
 */
@Controller
@RequestMapping(value = "${adminPath}/alliancebusiness/allianceBusiness")
public class AllianceBusinessController extends BaseController {

	@Autowired
	private AllianceBusinessService allianceBusinessService;
	
	@ModelAttribute
	public AllianceBusiness get(@RequestParam(required=false) String id) {
		AllianceBusiness entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = allianceBusinessService.get(id);
		}
		if (entity == null){
			entity = new AllianceBusiness();
		}
		return entity;
	}
	
	@RequiresPermissions("alliancebusiness:allianceBusiness:view")
	@RequestMapping(value = {"list", ""})
	public String list(AllianceBusiness allianceBusiness, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AllianceBusiness> page = allianceBusinessService.findPage(new Page<AllianceBusiness>(request, response), allianceBusiness); 
		model.addAttribute("page", page);
		return "modules/alliancebusiness/allianceBusinessList";
	}

	@RequiresPermissions("alliancebusiness:allianceBusiness:view")
	@RequestMapping(value = "form")
	public String form(AllianceBusiness allianceBusiness, Model model) {
		model.addAttribute("allianceBusiness", allianceBusiness);
		return "modules/alliancebusiness/allianceBusinessForm";
	}

	@RequiresPermissions("alliancebusiness:allianceBusiness:edit")
	@RequestMapping(value = "save")
	public String save(AllianceBusiness allianceBusiness, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, allianceBusiness)){
			return form(allianceBusiness, model);
		}
		allianceBusinessService.save(allianceBusiness);
		addMessage(redirectAttributes, "保存加盟商管理成功");
		return "redirect:"+Global.getAdminPath()+"/alliancebusiness/allianceBusiness/?repage";
	}
	
	@RequiresPermissions("alliancebusiness:allianceBusiness:edit")
	@RequestMapping(value = "delete")
	public String delete(AllianceBusiness allianceBusiness, RedirectAttributes redirectAttributes) {
		allianceBusinessService.delete(allianceBusiness);
		addMessage(redirectAttributes, "删除加盟商管理成功");
		return "redirect:"+Global.getAdminPath()+"/alliancebusiness/allianceBusiness/?repage";
	}

}