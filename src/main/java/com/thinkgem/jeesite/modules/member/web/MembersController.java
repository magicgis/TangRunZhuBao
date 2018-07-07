/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.member.web;

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
import com.thinkgem.jeesite.modules.member.entity.Members;
import com.thinkgem.jeesite.modules.member.service.MembersService;

/**
 * 会员信息管理Controller
 * @author David
 * @version 2018-07-02
 */
@Controller
@RequestMapping(value = "${adminPath}/member/members")
public class MembersController extends BaseController {

	@Autowired
	private MembersService membersService;
	
	@ModelAttribute
	public Members get(@RequestParam(required=false) String id) {
		Members entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = membersService.get(id);
		}
		if (entity == null){
			entity = new Members();
		}
		return entity;
	}
	
	@RequiresPermissions("member:members:view")
	@RequestMapping(value = {"list", ""})
	public String list(Members members, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Members> page = membersService.findPage(new Page<Members>(request, response), members); 
		model.addAttribute("page", page);
		return "modules/member/membersList";
	}

	@RequiresPermissions("member:members:view")
	@RequestMapping(value = "form")
	public String form(Members members, Model model) {
		model.addAttribute("members", members);
		return "modules/member/membersForm";
	}

	@RequiresPermissions("member:members:edit")
	@RequestMapping(value = "save")
	public String save(Members members, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, members)){
			return form(members, model);
		}
		membersService.save(members);
		addMessage(redirectAttributes, "保存会员信息管理成功");
		return "redirect:"+Global.getAdminPath()+"/member/members/?repage";
	}
	
	@RequiresPermissions("member:members:edit")
	@RequestMapping(value = "delete")
	public String delete(Members members, RedirectAttributes redirectAttributes) {
		membersService.delete(members);
		addMessage(redirectAttributes, "删除会员信息管理成功");
		return "redirect:"+Global.getAdminPath()+"/member/members/?repage";
	}

}