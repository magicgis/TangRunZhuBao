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
	@Autowired
	private UserProductService userProductService;
	
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
		
		Page<UserProduct> pages = new Page<UserProduct>(request, response);
		pages.setPageSize(2);//设定为2页面的个数
		if(pageNo!= null && StringUtils.isNotBlank(pageNo)){
			pages.setPageNo(Integer.parseInt(pageNo));
		}
		
        Page<UserProduct> page = userProductService.findPage(pages, userProduct);
       
        model.addAttribute("page", page);
        
		return "modules/cms/front/themes/basic/memberCenterMyCollectionData";
	}
	
	
	
}
