/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.product.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.cms.entity.Site;

/**
 * 产品管理Entity
 * @author David
 * @version 2018-03-30
 */
public class Product extends DataEntity<Product> {
    public static final String DEFAULT_TEMPLATE = "frontList";
	private static final long serialVersionUID = 1L;
	
	private Site site;		// 归属站点
	private Integer sort;		// 排序
	
	private String cost;		// 花费
	private String fullName;		// 商品名字全称
	private String name;		// 商品名字
	private Long hits;		// 产品点击的次数
	private String introduction;		// 产品介绍
	private String isTop;		// is_top  1 是  2 否
	private String keyword;		// 关键词
	private String marketPrice;		// 市场价
	private String price;		// 价格
	private Long sales;		// 销量
	private String seoDescription;		// seo_description
	private String seoKeywords;		// seo_keywords
	private String seoTitle;		// seo_title
	private String weight;		// 重量
	private String size;		// 尺寸
	private String technology;		// 工艺
	private String productCategory;		// 类别
	private String productMaterial;		// 材质
	private String productSpeciescolor;		// 种色
	private String isEnableGroup;		// 是否团购  1 是  2 否
	private String productGroup;		// 团购信息

	//2018-04-27 添加字段
	private String brand;		//品牌
	private Date timeToMarket;		//上市时间
	private String optimalProcessingMethod;//优化处理方式
	private String sameToMarket;	//是否商场同款(0是 1否)
	private String identificationMark;	//	鉴定标识	
	private String identificationCategory;	//鉴定类别(0 国家珠宝玉石质量监督检验中心 1 中国地质大学珠宝检测中心....)
	private String certificationMark;	//认证标识
	private String salesChannelType;	//销售渠道类型
	private String patternShape;	//图案/形状(0 其他)
	private String mosaicMaterial;	//镶嵌材质
	private String freightNumber;	//货号
	
	//2018-06-02 添加字段
	private String imageShare1;		//产品列表显示（图片尺寸：272.85×221.95 所有产品共用）
	private String imageShare2;		//产品详情显示（图片尺寸：613.59×383 图片张数：4张 所有产品共用）
	private String imageShare3;		//产品详情放大镜（图片尺寸：1920×1177 图片张数：4张 所有产品共用）
	private String imageShare4;		//产品详情显示（图片尺寸：551×541 图片张数：4张 所有产品共用）
	
	private String imageEmerald1;		//首页翡翠（图片尺寸：551×541）
	private String imageEmerald2;		//首页翡翠（图片尺寸：465×299.34）
	private String imageEmerald3;		//首页翡翠（图片尺寸：265×350）
	private String imageEmerald4;		//首页翡翠（图片尺寸：365×300）
	
	private String imageEmeraldNephrite1;		//产品详情中猜你喜欢（翡翠和田玉公用 图片尺寸：200×200）
	private String imageEmeraldNephrite2;		//个人信息中猜你喜欢（翡翠和田玉公用 图片尺寸：244.983×324）

	private String imageNephrite1;		//	首页和田玉（图片尺寸：366×301）
	private String imageNephrite2;		//	首页和田玉（图片尺寸：267×703）
	private String imageNephrite3;		//	首页和田玉（图片尺寸：260×283）
	private String imageDiamonds;		//	首页钻石（图片尺寸：339×320）
	
	
	private String bak1;		// bak1
	private String bak2;		// bak2
	private String bak3;		// bak3
	private String bak4;		// bak4
	private String bak5;		// bak5
	private String bak6;		// bak6
	
	public Product() {
		super();
	}

	public Product(String id){
		super(id);
	}

	public Site getSite() {
		return site;
	}

	public void setSite(Site site) {
		this.site = site;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}
	
	@Length(min=0, max=255, message="商品名字全称长度必须介于 0 和 255 之间")
	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
	@Length(min=0, max=255, message="商品名字长度必须介于 0 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Long getHits() {
		return hits;
	}

	public void setHits(Long hits) {
		this.hits = hits;
	}
	
	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	@Length(min=0, max=1, message="is_top长度必须介于 0 和 1 之间")
	public String getIsTop() {
		return isTop;
	}

	public void setIsTop(String isTop) {
		this.isTop = isTop;
	}
	
	@Length(min=0, max=255, message="关键词长度必须介于 0 和 255 之间")
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getMarketPrice() {
		return marketPrice;
	}

	public void setMarketPrice(String marketPrice) {
		this.marketPrice = marketPrice;
	}
	
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	public Long getSales() {
		return sales;
	}

	public void setSales(Long sales) {
		this.sales = sales;
	}
	
	@Length(min=0, max=255, message="seo_description长度必须介于 0 和 255 之间")
	public String getSeoDescription() {
		return seoDescription;
	}

	public void setSeoDescription(String seoDescription) {
		this.seoDescription = seoDescription;
	}
	
	@Length(min=0, max=255, message="seo_keywords长度必须介于 0 和 255 之间")
	public String getSeoKeywords() {
		return seoKeywords;
	}

	public void setSeoKeywords(String seoKeywords) {
		this.seoKeywords = seoKeywords;
	}
	
	@Length(min=0, max=255, message="seo_title长度必须介于 0 和 255 之间")
	public String getSeoTitle() {
		return seoTitle;
	}

	public void setSeoTitle(String seoTitle) {
		this.seoTitle = seoTitle;
	}
	
	@Length(min=0, max=11, message="重量长度必须介于 0 和 11 之间")
	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}
	
	@Length(min=0, max=255, message="尺寸长度必须介于 0 和 255 之间")
	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}
	
	@Length(min=0, max=255, message="工艺长度必须介于 0 和 255 之间")
	public String getTechnology() {
		return technology;
	}

	public void setTechnology(String technology) {
		this.technology = technology;
	}
	
	@Length(min=0, max=11, message="类别长度必须介于 0 和 11 之间")
	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	
	@Length(min=0, max=11, message="材质长度必须介于 0 和 11 之间")
	public String getProductMaterial() {
		return productMaterial;
	}

	public void setProductMaterial(String productMaterial) {
		this.productMaterial = productMaterial;
	}
	
	@Length(min=0, max=11, message="种色长度必须介于 0 和 11 之间")
	public String getProductSpeciescolor() {
		return productSpeciescolor;
	}

	public void setProductSpeciescolor(String productSpeciescolor) {
		this.productSpeciescolor = productSpeciescolor;
	}
	
	@Length(min=0, max=10, message="是否团购长度必须介于 0 和 10 之间")
	public String getIsEnableGroup() {
		return isEnableGroup;
	}

	public void setIsEnableGroup(String isEnableGroup) {
		this.isEnableGroup = isEnableGroup;
	}
	
	@Length(min=0, max=255, message="团购信息长度必须介于 0 和 255 之间")
	public String getProductGroup() {
		return productGroup;
	}

	public void setProductGroup(String productGroup) {
		this.productGroup = productGroup;
	}
	
	@Length(min=0, max=255, message="品牌名字长度必须介于 0 和 255 之间")
	public String getBrand() {
		return brand;
	}
	
	public void setBrand(String brand) {
		this.brand = brand;
	}

	public Date getTimeToMarket() {
		return timeToMarket;
	}
	
	public void setTimeToMarket(Date timeToMarket) {
		this.timeToMarket = timeToMarket;
	}

	@Length(min=0, max=255, message="优化处理方式长度必须介于 0 和 255 之间")
	public String getOptimalProcessingMethod() {
		return optimalProcessingMethod;
	}
	
	public void setOptimalProcessingMethod(String optimalProcessingMethod) {
		this.optimalProcessingMethod = optimalProcessingMethod;
	}
	
	@Length(min=0, max=2, message="是否商场同款(0是 1否)  长度必须介于 0 和 2 之间")
	public String getSameToMarket() {
		return sameToMarket;
	}
	
	public void setSameToMarket(String sameToMarket) {
		this.sameToMarket = sameToMarket;
	}

	@Length(min=0, max=255, message="鉴定标识 长度必须介于 0 和 255 之间")
	public String getIdentificationMark() {
		return identificationMark;
	}

	public void setIdentificationMark(String identificationMark) {
		this.identificationMark = identificationMark;
	}

	@Length(min=0, max=255, message="鉴定类别(0 国家珠宝玉石质量监督检验中心 1 中国地质大学珠宝检测中心....)   长度必须介于 0 和 255 之间")
	public String getIdentificationCategory() {
		return identificationCategory;
	}

	public void setIdentificationCategory(String identificationCategory) {
		this.identificationCategory = identificationCategory;
	}
	
	@Length(min=0, max=255, message="认证标识  长度必须介于 0 和 255 之间")
	public String getCertificationMark() {
		return certificationMark;
	}
	
	public void setCertificationMark(String certificationMark) {
		this.certificationMark = certificationMark;
	}

	@Length(min=0, max=255, message="销售渠道类型 长度必须介于 0 和 255 之间")
	public String getSalesChannelType() {
		return salesChannelType;
	}

	public void setSalesChannelType(String salesChannelType) {
		this.salesChannelType = salesChannelType;
	}
	
	@Length(min=0, max=255, message="图案/形状(0 其他) 长度必须介于 0 和 255 之间")
	public String getPatternShape() {
		return patternShape;
	}
	
	public void setPatternShape(String patternShape) {
		this.patternShape = patternShape;
	}
	
	@Length(min=0, max=255, message="镶嵌材质 长度必须介于 0 和 255 之间")
	public String getMosaicMaterial() {
		return mosaicMaterial;
	}

	public void setMosaicMaterial(String mosaicMaterial) {
		this.mosaicMaterial = mosaicMaterial;
	}
	@Length(min=0, max=255, message="货号 长度必须介于 0 和 255 之间")
	public String getFreightNumber() {
		return freightNumber;
	}
	
	public void setFreightNumber(String freightNumber) {
		this.freightNumber = freightNumber;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Length(min=0, max=255, message="imageShare1长度必须介于 0 和 255 之间")
	public String getImageShare1() {
		return imageShare1;
	}

	public void setImageShare1(String imageShare1) {
		this.imageShare1 = imageShare1;
	}

	@Length(min=0, max=1000, message="imageShare2长度必须介于 0 和 1000 之间")
	public String getImageShare2() {
		return imageShare2;
	}

	public void setImageShare2(String imageShare2) {
		this.imageShare2 = imageShare2;
	}
	
	@Length(min=0, max=1000, message="imageShare3长度必须介于 0 和 1000 之间")
	public String getImageShare3() {
		return imageShare3;
	}

	public void setImageShare3(String imageShare3) {
		this.imageShare3 = imageShare3;
	}

	@Length(min=0, max=1000, message="imageShare4长度必须介于 0 和 1000 之间")
	public String getImageShare4() {
		return imageShare4;
	}

	public void setImageShare4(String imageShare4) {
		this.imageShare4 = imageShare4;
	}
	
	@Length(min=0, max=255, message="imageEmerald1长度必须介于 0 和 255 之间")
	public String getImageEmerald1() {
		return imageEmerald1;
	}

	public void setImageEmerald1(String imageEmerald1) {
		this.imageEmerald1 = imageEmerald1;
	}

	@Length(min=0, max=255, message="imageEmerald2长度必须介于 0 和 3000 之间")
	public String getImageEmerald2() {
		return imageEmerald2;
	}

	public void setImageEmerald2(String imageEmerald2) {
		this.imageEmerald2 = imageEmerald2;
	}

	@Length(min=0, max=255, message="imageEmerald3长度必须介于 0 和 3000 之间")
	public String getImageEmerald3() {
		return imageEmerald3;
	}

	public void setImageEmerald3(String imageEmerald3) {
		this.imageEmerald3 = imageEmerald3;
	}

	@Length(min=0, max=255, message="imageEmerald4长度必须介于 0 和 3000 之间")
	public String getImageEmerald4() {
		return imageEmerald4;
	}

	public void setImageEmerald4(String imageEmerald4) {
		this.imageEmerald4 = imageEmerald4;
	}

	@Length(min=0, max=255, message="imageEmeraldNephrite1长度必须介于 0 和 255 之间")
	public String getImageEmeraldNephrite1() {
		return imageEmeraldNephrite1;
	}

	public void setImageEmeraldNephrite1(String imageEmeraldNephrite1) {
		this.imageEmeraldNephrite1 = imageEmeraldNephrite1;
	}

	@Length(min=0, max=255, message="imageEmeraldNephrite2长度必须介于 0 和 255 之间")
	public String getImageEmeraldNephrite2() {
		return imageEmeraldNephrite2;
	}

	public void setImageEmeraldNephrite2(String imageEmeraldNephrite2) {
		this.imageEmeraldNephrite2 = imageEmeraldNephrite2;
	}

	@Length(min=0, max=255, message="imageNephrite1长度必须介于 0 和 255 之间")
	public String getImageNephrite1() {
		return imageNephrite1;
	}

	public void setImageNephrite1(String imageNephrite1) {
		this.imageNephrite1 = imageNephrite1;
	}

	@Length(min=0, max=255, message="imageNephrite2长度必须介于 0 和 255 之间")
	public String getImageNephrite2() {
		return imageNephrite2;
	}

	public void setImageNephrite2(String imageNephrite2) {
		this.imageNephrite2 = imageNephrite2;
	}

	@Length(min=0, max=255, message="imageNephrite3长度必须介于 0 和 255 之间")
	public String getImageNephrite3() {
		return imageNephrite3;
	}

	public void setImageNephrite3(String imageNephrite3) {
		this.imageNephrite3 = imageNephrite3;
	}
	
	@Length(min=0, max=255, message="imageDiamonds长度必须介于 0 和 255 之间")
	public String getImageDiamonds() {
		return imageDiamonds;
	}

	public void setImageDiamonds(String imageDiamonds) {
		this.imageDiamonds = imageDiamonds;
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
	
	@Length(min=0, max=255, message="bak4长度必须介于 0 和 255 之间")
	public String getBak4() {
		return bak4;
	}

	public void setBak4(String bak4) {
		this.bak4 = bak4;
	}
	
	@Length(min=0, max=255, message="bak5长度必须介于 0 和 255 之间")
	public String getBak5() {
		return bak5;
	}

	public void setBak5(String bak5) {
		this.bak5 = bak5;
	}
	
	@Length(min=0, max=255, message="bak6长度必须介于 0 和 255 之间")
	public String getBak6() {
		return bak6;
	}

	public void setBak6(String bak6) {
		this.bak6 = bak6;
	}
	
}