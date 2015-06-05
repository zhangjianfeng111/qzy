package com.qzy.cn.entity.pro;

import com.qzy.cn.entity.BaseEntity;

@SuppressWarnings("serial")
public class RegionWithCategory extends BaseEntity<Integer> {
    private Integer id;

	private Integer cateId;

	private Integer regionId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCateId() {
		return cateId;
	}

	public void setCateId(Integer cateId) {
		this.cateId = cateId;
	}

	public Integer getRegionId() {
		return regionId;
	}

	public void setRegionId(Integer regionId) {
		this.regionId = regionId;
	}

}