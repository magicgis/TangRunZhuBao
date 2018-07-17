/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.offlineentity.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.offlineentity.entity.FOfflineEntity;
import com.thinkgem.jeesite.modules.offlineentity.dao.FOfflineEntityDao;

/**
 * 线下实体店管理Service
 * @author David
 * @version 2018-07-17
 */
@Service
@Transactional(readOnly = true)
public class FOfflineEntityService extends CrudService<FOfflineEntityDao, FOfflineEntity> {

	public FOfflineEntity get(String id) {
		return super.get(id);
	}
	
	public List<FOfflineEntity> findList(FOfflineEntity fOfflineEntity) {
		return super.findList(fOfflineEntity);
	}
	
	public Page<FOfflineEntity> findPage(Page<FOfflineEntity> page, FOfflineEntity fOfflineEntity) {
		return super.findPage(page, fOfflineEntity);
	}
	
	@Transactional(readOnly = false)
	public void save(FOfflineEntity fOfflineEntity) {
		super.save(fOfflineEntity);
	}
	
	@Transactional(readOnly = false)
	public void delete(FOfflineEntity fOfflineEntity) {
		super.delete(fOfflineEntity);
	}
	
}