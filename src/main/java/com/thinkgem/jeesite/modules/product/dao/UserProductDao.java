/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.product.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.product.entity.UserProduct;

/**
 * 我的收藏DAO接口
 * @author David
 * @version 2018-07-20
 */
@MyBatisDao
public interface UserProductDao extends CrudDao<UserProduct> {
	
}