package com.qzy.cn.bean.pro;

import com.qzy.cn.bean.SearchBean;

@SuppressWarnings("serial")
public class RegionWithCategoryBean extends SearchBean {
	private Integer Id;
	
    private Integer cateId;

    private Integer regionId;

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

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}
}