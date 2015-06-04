package com.qzy.cn.entity.advertise;

import java.util.Date;

import com.qzy.cn.entity.BaseEntity;

public class LhAdvertise extends BaseEntity<Integer>{
	private static final long	serialVersionUID	= -7289097777213741073L;

	private Integer id;

    private String advName;

    private String advBody;

    private String advLinkAddress;

    private Integer advrefId;

    private String advType;

    private Integer areaId;

    private String advDesc;

    private String advImg;
    
    private Integer orderSort;

    private Date createTime;

    private String createUser;

    private Date updateTime;

    private String updateUser;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAdvName() {
        return advName;
    }

    public void setAdvName(String advName) {
        this.advName = advName == null ? null : advName.trim();
    }

    public String getAdvBody() {
        return advBody;
    }

    public void setAdvBody(String advBody) {
        this.advBody = advBody == null ? null : advBody.trim();
    }

    public String getAdvLinkAddress() {
        return advLinkAddress;
    }

    public void setAdvLinkAddress(String advLinkAddress) {
        this.advLinkAddress = advLinkAddress == null ? null : advLinkAddress.trim();
    }

    public Integer getAdvrefId() {
        return advrefId;
    }

    public void setAdvrefId(Integer advrefId) {
        this.advrefId = advrefId;
    }

    public String getAdvType() {
        return advType;
    }

    public void setAdvType(String advType) {
        this.advType = advType == null ? null : advType.trim();
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public String getAdvDesc() {
        return advDesc;
    }

    public void setAdvDesc(String advDesc) {
        this.advDesc = advDesc == null ? null : advDesc.trim();
    }

    public String getAdvImg() {
        return advImg;
    }

    public void setAdvImg(String advImg) {
        this.advImg = advImg == null ? null : advImg.trim();
    }

    public Integer getOrderSort() {
		return orderSort;
	}

	public void setOrderSort(Integer orderSort) {
		this.orderSort = orderSort;
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
}