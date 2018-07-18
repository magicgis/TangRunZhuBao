package com.thinkgem.jeesite.modules.offlineentity.web.front;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.service.SiteService;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.offlineentity.entity.OfflineEntity;
import com.thinkgem.jeesite.modules.offlineentity.service.OfflineEntityService;
import com.thinkgem.jeesite.modules.product.entity.Product;

/**
 * 网站Controller
 * @author David
 * @version 2018-07-18
 */
@Controller
@RequestMapping(value = "${frontPath}")
public class FrontOfflineEntityController extends BaseController{
	
	@Autowired
	private OfflineEntityService offlineEntityService;
	@Autowired
	private SiteService siteService;
	
	/**
	 * 到实体店列表页面
	 * @param product
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "frontOfflineEntityList")
	public String frontListOfflineEntity(OfflineEntity offlineEntity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		return "modules/cms/front/themes/basic/frontListOfflineEntity";
	}
	/**
	 * 查询列表页的数据
	 * @param product
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "getFrontOfflineEntityListData")
	public String getFrontOfflineEntityListData(OfflineEntity offlineEntity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
		
		//String pageSize = request.getParameter("pageSize");
		String pageNo = request.getParameter("pageNo");
		
		Page<OfflineEntity> pages = new Page<OfflineEntity>(request, response);
		pages.setPageSize(2);//设定为2页面的个数
		if(pageNo!= null && StringUtils.isNotBlank(pageNo)){
			pages.setPageNo(Integer.parseInt(pageNo));
		}
		offlineEntity.setDelFlag(OfflineEntity.DEL_FLAG_NORMAL);//未删除
		Page<OfflineEntity> page = offlineEntityService.findPage(pages, offlineEntity);
		model.addAttribute("page", page);
		
		return "modules/cms/front/themes/basic/frontListOfflineEntityData";
	}
	
	
	
	
}
