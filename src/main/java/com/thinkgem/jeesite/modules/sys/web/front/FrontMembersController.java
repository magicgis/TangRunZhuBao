/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web.front;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.servlet.ValidateCodeServlet;
import com.thinkgem.jeesite.common.utils.JsonUtil;
import com.thinkgem.jeesite.common.utils.SmsLeyunUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.security.shiro.session.SessionDAO;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
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

	private static final String   REGISTER_OFFICE_ID="743291658d174ab9ac2da179e0fb66c4";
	private static final String   REGISTER_ROLE_ID="6";

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
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		return "modules/cms/front/themes/basic/memberRegister";
	}

	/**
	 * 注册
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "frontMemberRegister/save")
	public String frontMemberRegister(User user,HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		// 修正引用赋值问题，不知道为何，Company和Office引用的一个实例地址，修改了一个，另外一个跟着修改。
		if (!ValidateCodeServlet.validate(request,request.getParameter("vcodeinput"))){
			addMessage(model, "验证码错误，请重新输入");
			return formUser(user, model);
		}
		user.setName(user.getLoginName());
		user.setCompany(new Office(REGISTER_OFFICE_ID));
		user.setOffice(new Office(REGISTER_OFFICE_ID));
		user.setCreateBy(new User("1"));
		user.setUpdateBy(new User("1"));
		user.setCreateDate(new Date());
		user.setUpdateDate(new Date());
		if (StringUtils.isNotBlank(user.getPassword())) {
			user.setPassword(SystemService.entryptPassword(user.getPassword()));
		}
		if (!beanValidator(model, user)){
			return formUser(user, model);
		}
		if (!"true".equals(checkLoginName(user.getLoginName()))){
			addMessage(model, "注册用户失败，登录名：'"+user.getLoginName()+"'已存在");
			return formUser(user, model);
		}

		if (!"true".equals(checkMobile(user.getMobile()))){
			addMessage(model, "注册用户失败，手机号：'"+user.getMobile()+"'已存在");
			return formUser(user, model);
		}
		// 角色数据有效性验证，过滤不在授权内的角色
		List<Role> roleList = Lists.newArrayList();
		/*List<String> roleIdList = user.getRoleIdList();
		for (Role r : systemService.findAllRole()){
			if (roleIdList.contains(r.getId())){
				roleList.add(r);
			}
		}*/
		roleList.add(new Role(REGISTER_ROLE_ID));
		user.setRoleList(roleList);
		// 保存用户信息
		systemService.saveUser(user);
		// 清除当前用户缓存

		addMessage(redirectAttributes, "保存用户'" + user.getLoginName() + "'成功");
		return "redirect:"+frontPath+"/frontMemberCenterPersonalInfo?repage";
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
		model.addAttribute("site", CmsUtils.getSite(Site.defaultSiteId()));
		return "modules/cms/front/themes/basic/memberRegister";
	}


	/**
	 * 验证登录名是否有效
	 * @param oldLoginName
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "checkLoginName")
	public String checkLoginName(String loginName) {
		if (loginName !=null && systemService.getUserByLoginName(loginName) == null) {
			return "true";
		}
		return "false";
	}


	/**
	 * 验证手机号码是否有效
	 * @param mobile
	 * @param mobile
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "checkMobile")
	public String checkMobile(String mobile) {
		List userList=systemService.getUserByMobile(mobile);
		if (mobile !=null && CollectionUtils.isEmpty(userList)) {
			return "true";
		}
		return "false";
	}




	/**
	 * 获取短信验证码
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "getSmsCode")
	public String getSmsCode(String mobile) {
		//ObjectMapper mapper = new ObjectMapper();
		//mapper.readTree(SmsLeyunUtils.send("登陆验证码为：9999",mobile,""));
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
