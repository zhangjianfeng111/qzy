package com.qzy.cn.bean.pro;

import java.util.Date;

import com.qzy.cn.bean.SearchBean;

@SuppressWarnings("serial")
public class ProductInfoBean extends SearchBean{
    private Integer id;

    private Integer productId;

    private String productName;

    private String productFrom;

    private String imageLogo;

    private String images;

    private String bookingRequired;

    private Double retailPrice;

    private Date hotDealExpiryDate;

    private Integer orderSort;

    private String status;

    private String auditStatus;

    private Byte isUse;

    private Double backPrice;

    private Double intoPrice;

    private Integer stock;

    private Integer country;

    private Integer state;

    private Integer city;

    private String address;

    private String cate;

    private Date createTime;

    private String createUser;

    private Date updateTime;

    private String updateUser;

    private String more1;

    private String more2;

    private Integer more3;

    private String bookingNotesRequired;

    private String description;

    private String hotDealMessage;

    private String moreInfo;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName == null ? null : productName.trim();
    }

    public String getProductFrom() {
        return productFrom;
    }

    public void setProductFrom(String productFrom) {
        this.productFrom = productFrom == null ? null : productFrom.trim();
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

    public String getBookingRequired() {
        return bookingRequired;
    }

    public void setBookingRequired(String bookingRequired) {
        this.bookingRequired = bookingRequired == null ? null : bookingRequired.trim();
    }

    public Double getRetailPrice() {
        return retailPrice;
    }

    public void setRetailPrice(Double retailPrice) {
        this.retailPrice = retailPrice;
    }

    public Date getHotDealExpiryDate() {
        return hotDealExpiryDate;
    }

    public void setHotDealExpiryDate(Date hotDealExpiryDate) {
        this.hotDealExpiryDate = hotDealExpiryDate;
    }

    public Integer getOrderSort() {
        return orderSort;
    }

    public void setOrderSort(Integer orderSort) {
        this.orderSort = orderSort;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getAuditStatus() {
        return auditStatus;
    }

    public void setAuditStatus(String auditStatus) {
        this.auditStatus = auditStatus == null ? null : auditStatus.trim();
    }

    public Byte getIsUse() {
        return isUse;
    }

    public void setIsUse(Byte isUse) {
        this.isUse = isUse;
    }

    public Double getBackPrice() {
        return backPrice;
    }

    public void setBackPrice(Double backPrice) {
        this.backPrice = backPrice;
    }

    public Double getIntoPrice() {
        return intoPrice;
    }

    public void setIntoPrice(Double intoPrice) {
        this.intoPrice = intoPrice;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getCountry() {
        return country;
    }

    public void setCountry(Integer country) {
        this.country = country;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getCity() {
        return city;
    }

    public void setCity(Integer city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getCate() {
        return cate;
    }

    public void setCate(String cate) {
        this.cate = cate == null ? null : cate.trim();
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

    public String getMore2() {
        return more2;
    }

    public void setMore2(String more2) {
        this.more2 = more2 == null ? null : more2.trim();
    }

    public Integer getMore3() {
        return more3;
    }

    public void setMore3(Integer more3) {
        this.more3 = more3;
    }

    public String getBookingNotesRequired() {
        return bookingNotesRequired;
    }

    public void setBookingNotesRequired(String bookingNotesRequired) {
        this.bookingNotesRequired = bookingNotesRequired == null ? null : bookingNotesRequired.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getHotDealMessage() {
        return hotDealMessage;
    }

    public void setHotDealMessage(String hotDealMessage) {
        this.hotDealMessage = hotDealMessage == null ? null : hotDealMessage.trim();
    }

    public String getMoreInfo() {
        return moreInfo;
    }

    public void setMoreInfo(String moreInfo) {
        this.moreInfo = moreInfo == null ? null : moreInfo.trim();
    }
}