/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.member.web.front;
/*
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.security.shiro.session.SessionDAO;
import com.thinkgem.jeesite.common.servlet.ValidateCodeServlet;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.CookieUtils;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.sys.security.FormAuthenticationFilter;
import com.thinkgem.jeesite.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;*/

/**
 * 用户Controller
 * 登录、注册、找回密码
 * 
 * 暂时不用
 * 登录使用user表，并且前台和后台使用统一登录
 * 
 * @author ThinkGem
 * @version 2013-8-29
 */
/*@Controller
@RequestMapping(value = "${frontPath}")
public class FrontMembersController extends BaseController {

	@Autowired
	private SystemService systemService;
	@Autowired
	private SessionDAO sessionDAO;
	
	
	
	*//**
	 * 登录
	 * @param model
	 * @return
	 *//*
	@RequestMapping(value = "frontMemberLogin", method = RequestMethod.GET)
	public String frontMemberLogin(HttpServletRequest request, HttpServletResponse response,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		复制后台的内容
		Principal principal = UserUtils.getPrincipal();
		if (logger.isDebugEnabled()){
			logger.debug("frontLogin, active session size: {}", sessionDAO.getActiveSessions(false).size());
		}
		
		// 如果已登录，再次访问主页，则退出原账号。
		if (Global.TRUE.equals(Global.getConfig("notAllowRefreshIndex"))){
			CookieUtils.setCookie(response, "LOGINED", "false");
		}
		
		// 如果已经登录，则跳转到首页
		if(principal != null && !principal.isMobileLogin()){
			return "redirect:" + frontPath+"/frontMemberCenterPersonalInfo"+urlSuffix;//可以换到用户中心页面
		}
		
		return "modules/cms/front/themes/basic/memberLogin";
	}
	*//**
	 * 登录失败，真正登录的POST请求由Filter完成
	 *//*
	@RequestMapping(value = "frontMemberLogin", method = RequestMethod.POST)
	public String loginFail(HttpServletRequest request, HttpServletResponse response, Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		Principal principal = UserUtils.getPrincipal();
		// 如果已经登录，则跳转到管理首页
		if(principal != null){
			return "redirect:" + frontPath+"/frontMemberCenterPersonalInfo"+urlSuffix;//可以换到用户中心页面
		}
		///
		String username = WebUtils.getCleanParam(request, FormAuthenticationFilter.DEFAULT_USERNAME_PARAM);
		boolean rememberMe = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM);
		boolean mobile = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_MOBILE_PARAM);
		String exception = (String)request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
		String message = (String)request.getAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM);
		
		if (StringUtils.isBlank(message) || StringUtils.equals(message, "null")){
			message = "用户或密码错误, 请重试.";
		}

		model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, username);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM, rememberMe);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_MOBILE_PARAM, mobile);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME, exception);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM, message);
		
		if (logger.isDebugEnabled()){
			logger.debug("login fail, active session size: {}, message: {}, exception: {}", 
					sessionDAO.getActiveSessions(false).size(), message, exception);
		}
		// 非授权异常，登录失败，验证码加1。
		if (!UnauthorizedException.class.getName().equals(exception)){
			model.addAttribute("isValidateCodeLogin", isValidateCodeLogin(username, true, false));
		}
		// 验证失败清空验证码
		request.getSession().setAttribute(ValidateCodeServlet.VALIDATE_CODE, IdGen.uuid());
		// 如果是手机登录，则返回JSON字符串
		if (mobile){
	        return renderString(response, model);
		}
		return "modules/cms/front/themes/basic/memberLogin";
	}

	*//**
	 * 是否是验证码登录
	 * @param useruame 用户名
	 * @param isFail 计数加1
	 * @param clean 计数清零
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	public static boolean isValidateCodeLogin(String useruame, boolean isFail, boolean clean){
		Map<String, Integer> loginFailMap = (Map<String, Integer>)CacheUtils.get("loginFailMap");
		if (loginFailMap==null){
			loginFailMap = Maps.newHashMap();
			CacheUtils.put("loginFailMap", loginFailMap);
		}
		Integer loginFailNum = loginFailMap.get(useruame);
		if (loginFailNum==null){
			loginFailNum = 0;
		}
		if (isFail){
			loginFailNum++;
			loginFailMap.put(useruame, loginFailNum);
		}
		if (clean){
			loginFailMap.remove(useruame);
		}
		return loginFailNum >= 3;
	}
	
	
	*//**
	 * 登录成功，进入管理首页
	 * 个人中心
	 * @param model
	 * @return
	 *//*
	@RequiresPermissions("user")
	@RequestMapping(value = "frontMemberCenterPersonalInfo")
	public String frontMemberCenterPersonalInfo(HttpServletRequest request, HttpServletResponse response,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		Principal principal = UserUtils.getPrincipal();

		// 登录成功后，验证码计算器清零
		isValidateCodeLogin(principal.getLoginName(), false, true);
		
		if (logger.isDebugEnabled()){
			logger.debug("show memberCenter, active session size: {}", sessionDAO.getActiveSessions(false).size());
		}
		
		// 如果已登录，再次访问主页，则退出原账号。
		if (Global.TRUE.equals(Global.getConfig("notAllowRefreshIndex"))){
			String logined = CookieUtils.getCookie(request, "LOGINED");
			if (StringUtils.isBlank(logined) || "false".equals(logined)){
				CookieUtils.setCookie(response, "LOGINED", "true");
			}else if (StringUtils.equals(logined, "true")){
				UserUtils.getSubject().logout();
				return "redirect:" + frontPath+"/frontMemberLogin"+urlSuffix;//重新到登录页面
				
			}
		}
		
		// 如果是手机登录，则返回JSON字符串
		if (principal.isMobileLogin()){
			if (request.getParameter("login") != null){
				return renderString(response, principal);
			}
			if (request.getParameter("index") != null){//参数有影响吗 TODO
				return "modules/cms/front/themes/basic/memberLogin";
			}
			return "redirect:" + frontPath+"/frontMemberLogin"+urlSuffix;//重新到登录页面
		}
		
		
		return "modules/cms/front/themes/basic/frontViewArticleMemberCenterPersonalInfo";
	}
	
	
	
	
	
	
	

	*//**
	 * 注册
	 * @param model
	 * @return
	 *//*
	@RequestMapping(value = "frontMemberRegister")
	public String frontMemberRegister(Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		
		
		
		
		
		
		return "modules/cms/front/themes/basic/memberRegister";
	}
	
	*//**
	 * 重置密码
	 * @param model
	 * @return
	 *//*
	@RequestMapping(value = "frontMemberResetPassword")
	public String frontMemberResetPassword(Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		return "modules/cms/front/themes/basic/memberGetBackPassword";
	}
	
	
	

	*//**
	 * 我的收藏
	 * @param model
	 * @return
	 *//*
	@RequestMapping(value = "frontMemberCenterMyCollection")
	public String frontMemberCenterMyCollection(Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		return "modules/cms/front/themes/basic/frontViewArticleMemberCenterMyCollection";
	}
	
	
	*//**
	 * 帮助中心
	 * @param model
	 * @return
	 *//*
	@RequestMapping(value = "frontUserHelpCenterData")
	public String frontUserHelpCenterData(Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		return "modules/cms/front/themes/basic/frontViewArticleHelpCenter";
	}
	
	
	
	
	
}
*/