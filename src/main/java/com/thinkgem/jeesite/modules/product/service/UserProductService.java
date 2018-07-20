/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.product.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.product.entity.UserProduct;
import com.thinkgem.jeesite.modules.product.dao.UserProductDao;

/**
 * 我的收藏Service
 * @author David
 * @version 2018-07-20
 */
@Service
@Transactional(readOnly = true)
public class UserProductService extends CrudService<UserProductDao, UserProduct> {

	public UserProduct get(String id) {
		return super.get(id);
	}
	
	public List<UserProduct> findList(UserProduct userProduct) {
		return super.findList(userProduct);
	}
	
	public Page<UserProduct> findPage(Page<UserProduct> page, UserProduct userProduct) {
		return super.findPage(page, userProduct);
	}
	
	@Transactional(readOnly = false)
	public void save(UserProduct userProduct) {
		super.save(userProduct);
	}
	
	@Transactional(readOnly = false)
	public void delete(UserProduct userProduct) {
		super.delete(userProduct);
	}
	
}