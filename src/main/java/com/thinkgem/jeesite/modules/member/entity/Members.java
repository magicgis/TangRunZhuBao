/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.member.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 会员信息管理Entity
 * @author David
 * @version 2018-07-02
 */
public class Members extends DataEntity<Members> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 姓名
	private String mobile;		// 手机
	private String email;		// 邮箱
	private Date birthday;		// 出生年月
	private String sex;		// 性别:0女，1男，2其他
	private String wedlock;		// 婚姻状况：0未婚，1已婚，2其他
	private String loginCount;		// 登录次数
	private String resetpwd;		// 找回密码最后一次记录
	private Date resetpwdtime;		// 找回密码时间
	private String area;		// 地区
	private String addr;		// 地址
	private String memberLvId;		// 会员等级(暂时不用)
	private String point;		// 积分(暂时不用)
	private String advance;		// 会员账户余额(暂时不用)
	private String advanceFreeze;		// 会员预存款冻结金额（暂不使用）
	private String pointFreeze;		// 会员当前冻结积分（暂不使用）
	private String pointHistory;		// 会员历史总积分（暂不使用）
	private String state;		// 会员验证状态(暂时不用)
	private String bizMoney;		// 上次结算到现在的所有商业合作(推广人,代理)而产生的可供结算的金额（暂不使用）
	private String unreadmsg;		// 未读信息(暂时不用)
	private String tel;		// 固定电话(暂时不用)
	private String orderNum;		// 订单数(暂时不用)
	private String referId;		// 来源id（暂不使用）
	private String referUrl;		// 推广来源URL（暂不使用）
	private String education;		// 教育程度(暂时不用)
	private String vocation;		// 职业(暂时不用)
	private String interest;		// 扩展信息里的爱好(暂时不用)
	private String regIp;		// 注册时IP地址(暂时不用)
	private String source;		// 平台来源（暂不使用）
	private String bak1;		// 备用字段1
	private String bak2;		// 备用字段2
	private String bak3;		// 备用字段3
	private String bak4;		// 备用字段4
	private String bak5;		// 备用字段5
	
	public Members() {
		super();
	}

	public Members(String id){
		super(id);
	}

	@Length(min=1, max=50, message="姓名长度必须介于 1 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=20, message="手机长度必须介于 0 和 20 之间")
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	@Length(min=0, max=50, message="邮箱长度必须介于 0 和 50 之间")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	@Length(min=0, max=1, message="性别:0女，1男，2其他长度必须介于 0 和 1 之间")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@Length(min=0, max=1, message="婚姻状况：0未婚，1已婚，2其他长度必须介于 0 和 1 之间")
	public String getWedlock() {
		return wedlock;
	}

	public void setWedlock(String wedlock) {
		this.wedlock = wedlock;
	}
	
	@Length(min=1, max=11, message="登录次数长度必须介于 1 和 11 之间")
	public String getLoginCount() {
		return loginCount;
	}

	public void setLoginCount(String loginCount) {
		this.loginCount = loginCount;
	}
	
	@Length(min=0, max=255, message="找回密码最后一次记录长度必须介于 0 和 255 之间")
	public String getResetpwd() {
		return resetpwd;
	}

	public void setResetpwd(String resetpwd) {
		this.resetpwd = resetpwd;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getResetpwdtime() {
		return resetpwdtime;
	}

	public void setResetpwdtime(Date resetpwdtime) {
		this.resetpwdtime = resetpwdtime;
	}
	
	@Length(min=0, max=255, message="地区长度必须介于 0 和 255 之间")
	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}
	
	@Length(min=0, max=255, message="地址长度必须介于 0 和 255 之间")
	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	@Length(min=0, max=11, message="会员等级(暂时不用)长度必须介于 0 和 11 之间")
	public String getMemberLvId() {
		return memberLvId;
	}

	public void setMemberLvId(String memberLvId) {
		this.memberLvId = memberLvId;
	}
	
	@Length(min=0, max=11, message="积分(暂时不用)长度必须介于 0 和 11 之间")
	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}
	
	public String getAdvance() {
		return advance;
	}

	public void setAdvance(String advance) {
		this.advance = advance;
	}
	
	public String getAdvanceFreeze() {
		return advanceFreeze;
	}

	public void setAdvanceFreeze(String advanceFreeze) {
		this.advanceFreeze = advanceFreeze;
	}
	
	@Length(min=0, max=11, message="会员当前冻结积分（暂不使用）长度必须介于 0 和 11 之间")
	public String getPointFreeze() {
		return pointFreeze;
	}

	public void setPointFreeze(String pointFreeze) {
		this.pointFreeze = pointFreeze;
	}
	
	@Length(min=0, max=11, message="会员历史总积分（暂不使用）长度必须介于 0 和 11 之间")
	public String getPointHistory() {
		return pointHistory;
	}

	public void setPointHistory(String pointHistory) {
		this.pointHistory = pointHistory;
	}
	
	@Length(min=0, max=1, message="会员验证状态(暂时不用)长度必须介于 0 和 1 之间")
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	public String getBizMoney() {
		return bizMoney;
	}

	public void setBizMoney(String bizMoney) {
		this.bizMoney = bizMoney;
	}
	
	@Length(min=0, max=11, message="未读信息(暂时不用)长度必须介于 0 和 11 之间")
	public String getUnreadmsg() {
		return unreadmsg;
	}

	public void setUnreadmsg(String unreadmsg) {
		this.unreadmsg = unreadmsg;
	}
	
	@Length(min=0, max=20, message="固定电话(暂时不用)长度必须介于 0 和 20 之间")
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	@Length(min=0, max=11, message="订单数(暂时不用)长度必须介于 0 和 11 之间")
	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	
	@Length(min=0, max=11, message="来源id（暂不使用）长度必须介于 0 和 11 之间")
	public String getReferId() {
		return referId;
	}

	public void setReferId(String referId) {
		this.referId = referId;
	}
	
	@Length(min=0, max=255, message="推广来源URL（暂不使用）长度必须介于 0 和 255 之间")
	public String getReferUrl() {
		return referUrl;
	}

	public void setReferUrl(String referUrl) {
		this.referUrl = referUrl;
	}
	
	@Length(min=0, max=20, message="教育程度(暂时不用)长度必须介于 0 和 20 之间")
	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}
	
	@Length(min=0, max=20, message="职业(暂时不用)长度必须介于 0 和 20 之间")
	public String getVocation() {
		return vocation;
	}

	public void setVocation(String vocation) {
		this.vocation = vocation;
	}
	
	@Length(min=0, max=255, message="扩展信息里的爱好(暂时不用)长度必须介于 0 和 255 之间")
	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}
	
	@Length(min=0, max=255, message="注册时IP地址(暂时不用)长度必须介于 0 和 255 之间")
	public String getRegIp() {
		return regIp;
	}

	public void setRegIp(String regIp) {
		this.regIp = regIp;
	}
	
	@Length(min=0, max=1, message="平台来源（暂不使用）长度必须介于 0 和 1 之间")
	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}
	
	@Length(min=0, max=100, message="备用字段1长度必须介于 0 和 100 之间")
	public String getBak1() {
		return bak1;
	}

	public void setBak1(String bak1) {
		this.bak1 = bak1;
	}
	
	@Length(min=0, max=100, message="备用字段2长度必须介于 0 和 100 之间")
	public String getBak2() {
		return bak2;
	}

	public void setBak2(String bak2) {
		this.bak2 = bak2;
	}
	
	@Length(min=0, max=100, message="备用字段3长度必须介于 0 和 100 之间")
	public String getBak3() {
		return bak3;
	}

	public void setBak3(String bak3) {
		this.bak3 = bak3;
	}
	
	@Length(min=0, max=100, message="备用字段4长度必须介于 0 和 100 之间")
	public String getBak4() {
		return bak4;
	}

	public void setBak4(String bak4) {
		this.bak4 = bak4;
	}
	
	@Length(min=0, max=100, message="备用字段5长度必须介于 0 和 100 之间")
	public String getBak5() {
		return bak5;
	}

	public void setBak5(String bak5) {
		this.bak5 = bak5;
	}
	
}