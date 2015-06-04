package com.qzy.cn.entity.sys;

import com.qzy.cn.entity.BaseEntity;

import java.util.Date;

@SuppressWarnings("serial")
public class Region extends BaseEntity<Integer>{
    private Integer id;

	private Integer regionId;

	private String name;

	private String regionCode;

	private Integer parentId;

	private Integer orderSort;

	private String imageLogo;

	private String images;

	private Integer quantity;

	private Byte isUse;

	private Date createTime;

	private String createUser;

	private Date updateTime;

	private String updateUser;

	private String more1;

	private Integer more2;

	private String more3;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRegionId() {
		return regionId;
	}

	public void setRegionId(Integer regionId) {
		this.regionId = regionId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getRegionCode() {
		return regionCode;
	}

	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode == null ? null : regionCode.trim();
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getOrderSort() {
		return orderSort;
	}

	public void setOrderSort(Integer orderSort) {
		this.orderSort = orderSort;
	}

	public String getImageLogo() {
		return imageLogo;
	}

	public void setImageLogo(String imageLogo) {
		this.imageLogo = imageLogo == null ? null : imageLogo.trim();
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images == null ? null : images.trim();
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Byte getIsUse() {
		return isUse;
	}

	public void setIsUse(Byte isUse) {
		this.isUse = isUse;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser == null ? null : createUser.trim();
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser == null ? null : updateUser.trim();
	}

	public String getMore1() {
		return more1;
	}

	public void setMore1(String more1) {
		this.more1 = more1 == null ? null : more1.trim();
	}

	public Integer getMore2() {
		return more2;
	}

	public void setMore2(Integer more2) {
		this.more2 = more2;
	}

	public String getMore3() {
		return more3;
	}

	public void setMore3(String more3) {
		this.more3 = more3 == null ? null : more3.trim();
	}

	
	
}