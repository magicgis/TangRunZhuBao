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
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.security.shiro.session.SessionDAO;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.product.entity.UserProduct;
import com.thinkgem.jeesite.modules.product.service.UserProductService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
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
	@Autowired
	private UserProductService userProductService;

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
	 * 进到“修改密码”页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "frontMemberCenterResetPass")
	public String reachFrontMemberCenterResetPass(Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);

		return "modules/cms/front/themes/basic/memberCenterResetPassData";
	}
	/**
	 * 修改密码
	 * @param oldPassword
	 * @param newPassword
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "frontMemberCenterResetPassData")
	public String frontMemberCenterResetPassData(String oldPassword, String newPassword,Model model) {
		/*Map<String, Object> returnMap = new HashMap<String, Object>();*/
		String state = "2";
		User user = UserUtils.getUser();
		if (StringUtils.isNotBlank(oldPassword) && StringUtils.isNotBlank(newPassword)){
			if (SystemService.validatePassword(oldPassword, user.getPassword())){
				systemService.updatePasswordById(user.getId(), user.getLoginName(), newPassword);
				/*returnMap.put("errorCode", "0");//成功*/
				state = "0";
			}else{
				/*returnMap.put("errorCode", "1");//失败*/
				state = "1";
			}
		}else{
			/*returnMap.put("errorCode", "2");//传递的密码数据为空*/
			state = "2";
		}

		return state;
	}



	/**
	 * 我的收藏
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "frontMemberCenterMyCollection")
	public String frontMemberCenterMyCollection(HttpServletRequest request, HttpServletResponse response,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);

		return "modules/cms/front/themes/basic/memberCenterMyCollection";
	}

	@RequestMapping(value = "frontMemberCenterMyCollectionData")
	public String frontMemberCenterMyCollectionData(HttpServletRequest request, HttpServletResponse response,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);

		String pageNo = request.getParameter("pageNo");
		/*查询“我的收藏”的相关数据*/
		UserProduct userProduct = new UserProduct();
		userProduct.setDelFlag(UserProduct.DEL_FLAG_NORMAL);

		Page<UserProduct> pages = new Page<UserProduct>(request, response);
		pages.setPageSize(2);//设定为2页面的个数
		if(pageNo!= null && StringUtils.isNotBlank(pageNo)){
			pages.setPageNo(Integer.parseInt(pageNo));
		}

        Page<UserProduct> page = userProductService.findPage(pages, userProduct);

        model.addAttribute("page", page);

		return "modules/cms/front/themes/basic/memberCenterMyCollectionData";
	}

	@ResponseBody
	@RequestMapping(value = "frontMemberCenterMyCollectionDelete")
	public String frontMemberCenterMyCollectionDelete(HttpServletRequest request, HttpServletResponse response,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);

		String userProductId = request.getParameter("userProductId");
		/*查询“我的收藏”的相关数据*/
		UserProduct userProduct = new UserProduct();
		if(userProductId!= null && StringUtils.isNotBlank(userProductId)){
			userProduct.setId(userProductId);
		}
		userProduct.setDelFlag(UserProduct.DEL_FLAG_DELETE);
        userProductService.save(userProduct);

		return "0";
	}

}
