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
import com.thinkgem.jeesite.modules.alliancebusiness.entity.FAllianceBusiness;
import com.thinkgem.jeesite.modules.alliancebusiness.service.FAllianceBusinessService;

/**
 * 加盟商管理Controller
 * @author David
 * @version 2018-07-17
 */
@Controller
@RequestMapping(value = "${adminPath}/alliancebusiness/fAllianceBusiness")
public class FAllianceBusinessController extends BaseController {

	@Autowired
	private FAllianceBusinessService fAllianceBusinessService;
	
	@ModelAttribute
	public FAllianceBusiness get(@RequestParam(required=false) String id) {
		FAllianceBusiness entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = fAllianceBusinessService.get(id);
		}
		if (entity == null){
			entity = new FAllianceBusiness();
		}
		return entity;
	}
	
	@RequiresPermissions("alliancebusiness:fAllianceBusiness:view")
	@RequestMapping(value = {"list", ""})
	public String list(@ModelAttribute("fAllianceBusiness")FAllianceBusiness fAllianceBusiness, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<FAllianceBusiness> page = fAllianceBusinessService.findPage(new Page<FAllianceBusiness>(request, response), fAllianceBusiness); 
		model.addAttribute("page", page);
		return "modules/alliancebusiness/fAllianceBusinessList";
	}

	@RequiresPermissions("alliancebusiness:fAllianceBusiness:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("fAllianceBusiness")FAllianceBusiness fAllianceBusiness, Model model) {
		model.addAttribute("fAllianceBusiness", fAllianceBusiness);
		return "modules/alliancebusiness/fAllianceBusinessForm";
	}

	@RequiresPermissions("alliancebusiness:fAllianceBusiness:edit")
	@RequestMapping(value = "save")
	public String save(@ModelAttribute("fAllianceBusiness")FAllianceBusiness fAllianceBusiness, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, fAllianceBusiness)){
			return form(fAllianceBusiness, model);
		}
		fAllianceBusinessService.save(fAllianceBusiness);
		addMessage(redirectAttributes, "保存加盟商管理成功");
		return "redirect:"+Global.getAdminPath()+"/alliancebusiness/fAllianceBusiness/?repage";
	}
	
	@RequiresPermissions("alliancebusiness:fAllianceBusiness:edit")
	@RequestMapping(value = "delete")
	public String delete(@ModelAttribute("fAllianceBusiness")FAllianceBusiness fAllianceBusiness, RedirectAttributes redirectAttributes) {
		fAllianceBusinessService.delete(fAllianceBusiness);
		addMessage(redirectAttributes, "删除加盟商管理成功");
		return "redirect:"+Global.getAdminPath()+"/alliancebusiness/fAllianceBusiness/?repage";
	}

}