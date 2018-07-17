/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.alliancebusiness.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.alliancebusiness.entity.AllianceBusiness;
import com.thinkgem.jeesite.modules.alliancebusiness.dao.AllianceBusinessDao;

/**
 * 加盟商管理Service
 * @author David
 * @version 2018-07-17
 */
@Service
@Transactional(readOnly = true)
public class AllianceBusinessService extends CrudService<AllianceBusinessDao, AllianceBusiness> {

	public AllianceBusiness get(String id) {
		return super.get(id);
	}
	
	public List<AllianceBusiness> findList(AllianceBusiness allianceBusiness) {
		return super.findList(allianceBusiness);
	}
	
	public Page<AllianceBusiness> findPage(Page<AllianceBusiness> page, AllianceBusiness allianceBusiness) {
		return super.findPage(page, allianceBusiness);
	}
	
	@Transactional(readOnly = false)
	public void save(AllianceBusiness allianceBusiness) {
		super.save(allianceBusiness);
	}
	
	@Transactional(readOnly = false)
	public void delete(AllianceBusiness allianceBusiness) {
		super.delete(allianceBusiness);
	}
	
}