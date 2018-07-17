/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.alliancebusiness.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.alliancebusiness.entity.FAllianceBusiness;
import com.thinkgem.jeesite.modules.alliancebusiness.dao.FAllianceBusinessDao;

/**
 * 加盟商管理Service
 * @author David
 * @version 2018-07-17
 */
@Service
@Transactional(readOnly = true)
public class FAllianceBusinessService extends CrudService<FAllianceBusinessDao, FAllianceBusiness> {

	public FAllianceBusiness get(String id) {
		return super.get(id);
	}
	
	public List<FAllianceBusiness> findList(FAllianceBusiness fAllianceBusiness) {
		return super.findList(fAllianceBusiness);
	}
	
	public Page<FAllianceBusiness> findPage(Page<FAllianceBusiness> page, FAllianceBusiness fAllianceBusiness) {
		return super.findPage(page, fAllianceBusiness);
	}
	
	@Transactional(readOnly = false)
	public void save(FAllianceBusiness fAllianceBusiness) {
		super.save(fAllianceBusiness);
	}
	
	@Transactional(readOnly = false)
	public void delete(FAllianceBusiness fAllianceBusiness) {
		super.delete(fAllianceBusiness);
	}
	
}