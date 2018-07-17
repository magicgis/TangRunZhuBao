/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.offlineentity.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.offlineentity.entity.OfflineEntity;

/**
 * 线下实体店管理DAO接口
 * @author David
 * @version 2018-07-17
 */
@MyBatisDao
public interface OfflineEntityDao extends CrudDao<OfflineEntity> {
	
}