/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.offlineentity.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.offlineentity.entity.OfflineEntity;
import com.thinkgem.jeesite.modules.offlineentity.dao.OfflineEntityDao;

/**
 * 线下实体店管理Service
 * @author David
 * @version 2018-07-17
 */
@Service
@Transactional(readOnly = true)
public class OfflineEntityService extends CrudService<OfflineEntityDao, OfflineEntity> {

	public OfflineEntity get(String id) {
		return super.get(id);
	}
	
	public List<OfflineEntity> findList(OfflineEntity offlineEntity) {
		return super.findList(offlineEntity);
	}
	
	public Page<OfflineEntity> findPage(Page<OfflineEntity> page, OfflineEntity offlineEntity) {
		return super.findPage(page, offlineEntity);
	}
	
	@Transactional(readOnly = false)
	public void save(OfflineEntity offlineEntity) {
		super.save(offlineEntity);
	}
	
	@Transactional(readOnly = false)
	public void delete(OfflineEntity offlineEntity) {
		super.delete(offlineEntity);
	}
	
}