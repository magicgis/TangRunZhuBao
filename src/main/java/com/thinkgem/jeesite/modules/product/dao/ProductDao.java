/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.product.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.product.entity.Product;

/**
 * 产品管理DAO接口
 * @author David
 * @version 2018-03-30
 */
@MyBatisDao
public interface ProductDao extends CrudDao<Product> {
	
}