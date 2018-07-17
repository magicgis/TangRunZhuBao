/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.alliancebusiness.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 加盟商管理Entity
 * @author David
 * @version 2018-07-17
 */
public class AllianceBusiness extends DataEntity<AllianceBusiness> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 加盟商名字
	private String telPhone;		// 加盟商电话
	private String mobilePhone;		// 加盟商手机
	private String qq;		// qq
	private String wechat;		// 微信
	private String address;		// 加盟商地址
	private String bak1;		// bak1
	private String bak2;		// bak2
	private String bak3;		// bak3
	
	public AllianceBusiness() {
		super();
	}

	public AllianceBusiness(String id){
		super(id);
	}

	@Length(min=0, max=255, message="加盟商名字长度必须介于 0 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=255, message="加盟商电话长度必须介于 0 和 255 之间")
	public String getTelPhone() {
		return telPhone;
	}

	public void setTelPhone(String telPhone) {
		this.telPhone = telPhone;
	}
	
	@Length(min=0, max=255, message="加盟商手机长度必须介于 0 和 255 之间")
	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	
	@Length(min=0, max=255, message="qq长度必须介于 0 和 255 之间")
	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}
	
	@Length(min=0, max=255, message="微信长度必须介于 0 和 255 之间")
	public String getWechat() {
		return wechat;
	}

	public void setWechat(String wechat) {
		this.wechat = wechat;
	}
	
	@Length(min=0, max=255, message="加盟商地址长度必须介于 0 和 255 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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