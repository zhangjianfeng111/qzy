package com.qzy.cn.bean.advertise;

import java.util.Date;

import com.qzy.cn.bean.SearchBean;

@SuppressWarnings("serial")
public class LhRecPlaceBean extends SearchBean{
    private Integer id;

    private String placeTitle;

    private String recPlaceCode;

    private Integer placeStatus;

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

    public String getPlaceTitle() {
        return placeTitle;
    }

    public void setPlaceTitle(String placeTitle) {
        this.placeTitle = placeTitle == null ? null : placeTitle.trim();
    }

    public String getRecPlaceCode() {
        return recPlaceCode;
    }

    public void setRecPlaceCode(String recPlaceCode) {
        this.recPlaceCode = recPlaceCode == null ? null : recPlaceCode.trim();
    }

    public Integer getPlaceStatus() {
        return placeStatus;
    }

    public void setPlaceStatus(Integer placeStatus) {
        this.placeStatus = placeStatus;
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