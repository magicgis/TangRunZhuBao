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

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.security.shiro.session.SessionDAO;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

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
	@RequestMapping(value = "frontMemberCenter")
	public String memberCenter(User user,HttpServletRequest request, HttpServletResponse response,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		//首次个人信息页面
		User currentUser = UserUtils.getUser();
		if ((user != null) && StringUtils.isNotBlank(user.getName())){//加入了user的判断
			currentUser.setEmail(user.getEmail());
			currentUser.setPhone(user.getPhone());
			currentUser.setMobile(user.getMobile());
			currentUser.setRemarks(user.getRemarks());
			currentUser.setPhoto(user.getPhoto());
			systemService.updateUserInfo(currentUser);
			//model.addAttribute("message", "保存用户信息成功");
		}
		model.addAttribute("user", currentUser);
		
		return "modules/cms/front/themes/basic/memberCenter";
	}
	
	/**
	 * 个人中心
	 * @param model
	 * @return
	
	@RequestMapping(value = "frontMemberCenterPersonalInfoData")
	public String frontMemberCenterPersonalInfo(User user,HttpServletRequest request, HttpServletResponse response,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		//首次个人信息页面
		User currentUser = UserUtils.getUser();
		if ((user != null) && StringUtils.isNotBlank(user.getName())){//加入了user的判断
			currentUser.setEmail(user.getEmail());
			currentUser.setPhone(user.getPhone());
			currentUser.setMobile(user.getMobile());
			currentUser.setRemarks(user.getRemarks());
			currentUser.setPhoto(user.getPhoto());
			systemService.updateUserInfo(currentUser);
			//model.addAttribute("message", "保存用户信息成功");
		}
		model.addAttribute("user", currentUser);
		
		return "modules/cms/front/themes/basic/memberCenterPersonalInfoData";
	}
	 */
	/**
	 * 修改密码
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "frontMemberCenterResetPassData")
	public String frontMemberCenterResetPassData(String oldPassword, String newPassword,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		User user = UserUtils.getUser();
		if (StringUtils.isNotBlank(oldPassword) && StringUtils.isNotBlank(newPassword)){
			if (SystemService.validatePassword(oldPassword, user.getPassword())){
				systemService.updatePasswordById(user.getId(), user.getLoginName(), newPassword);
				//model.addAttribute("message", "修改密码成功");
			}else{
				//model.addAttribute("message", "修改密码失败，旧密码错误");
			}
		}
		model.addAttribute("user", user);
		
		//return "redirect:" + frontPath + "frontMemberCenter"+urlSuffix;
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
