/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web.front;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.security.shiro.session.SessionDAO;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.sys.service.SystemService;

/**
 * 用户Controller
 * 登录、注册、找回密码
 * 
 * 登录使用user表，并且前台和后台使用统一登录
 * 
 * @author ThinkGem
 * @version 2013-8-29
 */
@Controller
@RequestMapping(value = "${frontPath}")
public class FrontMembersController extends BaseController {

	@Autowired
	private SystemService systemService;
	@Autowired
	private SessionDAO sessionDAO;
	
	/**
	 * 注册
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "frontMemberRegister")
	public String frontMemberRegister(Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		return "modules/cms/front/themes/basic/memberRegister";
	}
	
	/**
	 * 重置密码
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "frontMemberResetPassword")
	public String frontMemberResetPassword(Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		return "modules/cms/front/themes/basic/memberGetBackPassword";
	}

	/**
	 * 个人中心
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "memberCenter")
	public String memberCenter(HttpServletRequest request, HttpServletResponse response,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		
		
		
		return "modules/cms/front/themes/basic/memberCenter";
	}
	
	/**
	 * 个人中心
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "frontMemberCenterPersonalInfoData")
	public String frontMemberCenterPersonalInfo(HttpServletRequest request, HttpServletResponse response,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		return "modules/cms/front/themes/basic/memberCenterPersonalInfoData";
	}
	
	/**
	 * 重置密码
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "frontMemberCenterResetPassData")
	public String frontMemberCenterResetPassData(Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		return "modules/cms/front/themes/basic/memberCenterResetPassData";
	}
	
	/**
	 * 我的收藏
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "frontMemberCenterMyCollectionData")
	public String frontMemberCenterMyCollectionData(Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		return "modules/cms/front/themes/basic/memberCenterMyCollectionData";
	}

	/**
	 * 帮助中心
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "frontMemberHelpCenterData")
	public String frontUserHelpCenterData(Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		return "modules/cms/front/themes/basic/frontViewArticleHelpCenter";
	}
}
