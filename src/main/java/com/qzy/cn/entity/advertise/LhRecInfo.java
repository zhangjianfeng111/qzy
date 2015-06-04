package com.qzy.cn.entity.advertise;

import java.util.Date;

import com.qzy.cn.entity.BaseEntity;

@SuppressWarnings("serial")
public class LhRecInfo extends BaseEntity<Integer>{
    private Integer recId;

    private String recTitle;

    private Integer recRefinfoId;

    private Integer recType;

    private String recComment;

    private String recImg;

    private String recUrl;

    private Integer recOrder;

    private Integer recStatus;

    private Date recAvailableTime;

    private Date recExpireTime;

    private Date createTime;

    private String createUser;

    private Date updateTime;

    private String recWebsite;

    private String recKeyword;

    private Integer clickCount;

    private Integer orderType;
    
    private Integer placeId;

    public Integer getPlaceId() {
		return placeId;
	}

	public void setPlaceId(Integer placeId) {
		this.placeId = placeId;
	}

	public Integer getRecId() {
        return recId;
    }

    public void setRecId(Integer recId) {
        this.recId = recId;
    }

    public String getRecTitle() {
        return recTitle;
    }

    public void setRecTitle(String recTitle) {
        this.recTitle = recTitle == null ? null : recTitle.trim();
    }

    public Integer getRecRefinfoId() {
        return recRefinfoId;
    }

    public void setRecRefinfoId(Integer recRefinfoId) {
        this.recRefinfoId = recRefinfoId;
    }

    public Integer getRecType() {
        return recType;
    }

    public void setRecType(Integer recType) {
        this.recType = recType;
    }

    public String getRecComment() {
        return recComment;
    }

    public void setRecComment(String recComment) {
        this.recComment = recComment == null ? null : recComment.trim();
    }

    public String getRecImg() {
        return recImg;
    }

    public void setRecImg(String recImg) {
        this.recImg = recImg == null ? null : recImg.trim();
    }

    public String getRecUrl() {
        return recUrl;
    }

    public void setRecUrl(String recUrl) {
        this.recUrl = recUrl == null ? null : recUrl.trim();
    }

    public Integer getRecOrder() {
        return recOrder;
    }

    public void setRecOrder(Integer recOrder) {
        this.recOrder = recOrder;
    }

    public Integer getRecStatus() {
        return recStatus;
    }

    public void setRecStatus(Integer recStatus) {
        this.recStatus = recStatus;
    }

    public Date getRecAvailableTime() {
        return recAvailableTime;
    }

    public void setRecAvailableTime(Date recAvailableTime) {
        this.recAvailableTime = recAvailableTime;
    }

    public Date getRecExpireTime() {
        return recExpireTime;
    }

    public void setRecExpireTime(Date recExpireTime) {
        this.recExpireTime = recExpireTime;
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

    public String getRecWebsite() {
        return recWebsite;
    }

    public void setRecWebsite(String recWebsite) {
        this.recWebsite = recWebsite == null ? null : recWebsite.trim();
    }

    public String getRecKeyword() {
        return recKeyword;
    }

    public void setRecKeyword(String recKeyword) {
        this.recKeyword = recKeyword == null ? null : recKeyword.trim();
    }

    public Integer getClickCount() {
        return clickCount;
    }

    public void setClickCount(Integer clickCount) {
        this.clickCount = clickCount;
    }

    public Integer getOrderType() {
        return orderType;
    }

    public void setOrderType(Integer orderType) {
        this.orderType = orderType;
    }

	/* (non-Javadoc)
	 * @see com.carbon.cn.entity.BaseEntity#getId()
	 */
	@Override
	public Integer getId() {
		return null;
	}
}