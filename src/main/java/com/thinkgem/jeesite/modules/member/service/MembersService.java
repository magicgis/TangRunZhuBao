/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.member.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.member.entity.Members;
import com.thinkgem.jeesite.modules.member.dao.MembersDao;

/**
 * 会员信息管理Service
 * @author David
 * @version 2018-07-02
 */
@Service
@Transactional(readOnly = true)
public class MembersService extends CrudService<MembersDao, Members> {

	public Members get(String id) {
		return super.get(id);
	}
	
	public List<Members> findList(Members members) {
		return super.findList(members);
	}
	
	public Page<Members> findPage(Page<Members> page, Members members) {
		return super.findPage(page, members);
	}
	
	@Transactional(readOnly = false)
	public void save(Members members) {
		super.save(members);
	}
	
	@Transactional(readOnly = false)
	public void delete(Members members) {
		super.delete(members);
	}
	
}