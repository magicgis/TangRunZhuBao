/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.product.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.User;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 我的收藏Entity
 * @author David
 * @version 2018-07-20
 */
public class UserProduct extends DataEntity<UserProduct> {
	
	private static final long serialVersionUID = 1L;
	/*private String productId;		// 产品id
*/	
	private Product product;
	private User user;		// 用户id
	private String bak1;		// bak1
	private String bak2;		// bak2
	private String bak3;		// bak3
	
	public UserProduct() {
		super();
	}

	public UserProduct(String id){
		super(id);
	}

/*	@Length(min=0, max=64, message="产品id长度必须介于 0 和 64 之间")
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}
	*/
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=1, max=255, message="bak1长度必须介于 1 和 255 之间")
	public String getBak1() {
		return bak1;
	}

	public void setBak1(String bak1) {
		this.bak1 = bak1;
	}
	
	@Length(min=1, max=255, message="bak2长度必须介于 1 和 255 之间")
	public String getBak2() {
		return bak2;
	}

	public void setBak2(String bak2) {
		this.bak2 = bak2;
	}
	
	@Length(min=1, max=255, message="bak3长度必须介于 1 和 255 之间")
	public String getBak3() {
		return bak3;
	}

	public void setBak3(String bak3) {
		this.bak3 = bak3;
	}
	
}