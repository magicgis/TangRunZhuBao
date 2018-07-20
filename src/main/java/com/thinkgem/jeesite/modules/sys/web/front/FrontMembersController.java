/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web.front;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.security.shiro.session.SessionDAO;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

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
	 * 个人中心
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "frontMemberCenterPersonalInfo")
	public String frontMemberCenterPersonalInfo(HttpServletRequest request, HttpServletResponse response,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		return "modules/cms/front/themes/basic/frontViewArticleMemberCenterPersonalInfo";
	}

	/**
	 * 注册
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "frontMemberRegister")
	public String frontMemberRegisterPage(Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("user", new User());
		return "modules/cms/front/themes/basic/memberRegister";
	}

	/**
	 * 注册
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "frontMemberRegister/save")
	public String frontMemberRegister(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		User user=new User();
		// 修正引用赋值问题，不知道为何，Company和Office引用的一个实例地址，修改了一个，另外一个跟着修改。
		/*user.setCompany(new Office(request.getParameter("company.id")));
		user.setOffice(new Office(request.getParameter("office.id")));*/
		// 如果新密码为空，则不更换密码
		if (StringUtils.isNotBlank(user.getPassword())) {
			user.setPassword(SystemService.entryptPassword(user.getPassword()));
		}
		if (!beanValidator(model, user)){
			return formUser(user, model);
		}
		if (!"true".equals(checkLoginName(user.getOldLoginName(), user.getLoginName()))){
			addMessage(model, "注册用户失败，手机号：'"+user.getOldLoginName()+"'已存在");
			return formUser(user, model);
		}
		// 角色数据有效性验证，过滤不在授权内的角色
		/*List<Role> roleList = Lists.newArrayList();
		List<String> roleIdList = user.getRoleIdList();
		for (Role r : systemService.findAllRole()){
			if (roleIdList.contains(r.getId())){
				roleList.add(r);
			}
		}
		user.setRoleList(roleList);*/
		// 保存用户信息
		systemService.saveUser(user);
		// 清除当前用户缓存
		if (user.getLoginName().equals(UserUtils.getUser().getLoginName())){
			UserUtils.clearCache();
			//UserUtils.getCacheMap().clear();
		}
		addMessage(redirectAttributes, "保存用户'" + user.getLoginName() + "'成功");
		return "redirect:" + adminPath + "/sys/user/list?repage";
	}

	@RequestMapping(value = "form")
	public String formUser(User user, Model model) {
		if (user.getCompany()==null || user.getCompany().getId()==null){
			user.setCompany(UserUtils.getUser().getCompany());
		}
		if (user.getOffice()==null || user.getOffice().getId()==null){
			user.setOffice(UserUtils.getUser().getOffice());
		}
		model.addAttribute("user", user);
		return "modules/cms/front/themes/basic/memberRegister";
	}


	/**
	 * 验证登录名是否有效
	 * @param oldLoginName
	 * @param loginName
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "checkLoginName")
	public String checkLoginName(String oldLoginName, String loginName) {
		if (loginName !=null && loginName.equals(oldLoginName)) {
			return "true";
		} else if (loginName !=null && systemService.getUserByLoginName(loginName) == null) {
			return "true";
		}
		return "false";
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
	 * 我的收藏
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "frontMemberCenterMyCollection")
	public String frontMemberCenterMyCollection(Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		return "modules/cms/front/themes/basic/frontViewArticleMemberCenterMyCollection";
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
