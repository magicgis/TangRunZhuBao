/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.member.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.member.entity.Members;

/**
 * 会员信息管理DAO接口
 * @author David
 * @version 2018-07-02
 */
@MyBatisDao
public interface MembersDao extends CrudDao<Members> {
	
}