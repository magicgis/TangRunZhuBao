/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.offlineentity.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 线下实体店管理Entity
 * @author David
 * @version 2018-07-17
 */
public class OfflineEntity extends DataEntity<OfflineEntity> {
	
	private static final long serialVersionUID = 1L;
	private String image;		// 实体店图片
	private String name;		// 实体店名字
	private String address;		// 实体店地址
	private String tel;		// 实体店电话
	private String person;		// 实体店联系人
	private String mapX;		// 实体店横坐标
	private String mapY;		// 实体店纵坐标
	private String bak1;		// bak1
	private String bak2;		// bak2
	private String bak3;		// bak3
	
	public OfflineEntity() {
		super();
	}

	public OfflineEntity(String id){
		super(id);
	}

	@Length(min=0, max=255, message="实体店图片长度必须介于 0 和 255 之间")
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	@Length(min=0, max=255, message="实体店名字长度必须介于 0 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=255, message="实体店地址长度必须介于 0 和 255 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Length(min=0, max=50, message="实体店电话长度必须介于 0 和 50 之间")
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	@Length(min=0, max=50, message="实体店联系人长度必须介于 0 和 50 之间")
	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}
	
	public String getMapX() {
		return mapX;
	}

	public void setMapX(String mapX) {
		this.mapX = mapX;
	}
	
	public String getMapY() {
		return mapY;
	}

	public void setMapY(String mapY) {
		this.mapY = mapY;
	}
	
	@Length(min=0, max=255, message="bak1长度必须介于 0 和 255 之间")
	public String getBak1() {
		return bak1;
	}

	public void setBak1(String bak1) {
		this.bak1 = bak1;
	}
	
	@Length(min=0, max=255, message="bak2长度必须介于 0 和 255 之间")
	public String getBak2() {
		return bak2;
	}

	public void setBak2(String bak2) {
		this.bak2 = bak2;
	}
	
	@Length(min=0, max=255, message="bak3长度必须介于 0 和 255 之间")
	public String getBak3() {
		return bak3;
	}

	public void setBak3(String bak3) {
		this.bak3 = bak3;
	}
	
}