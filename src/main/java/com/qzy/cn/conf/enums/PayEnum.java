package com.qzy.cn.conf.enums;

public enum PayEnum {

    // 付款状态
    // 未付款
    NO_PAY("未付款","no_pay", 0),
    // 已付款
    PAY_OK("已付款","pay_ok", 1),
    // 部分付款
    PAYING("部分付款","paying", 3);

    private String payStatus;
    
    private String payCode;
//    
//    private Integer payValue;
    
    private PayEnum(String payStatus,String payCode, Integer payValue) {
        this.payStatus = payStatus;
        this.payCode = payCode;
//        this.payValue = payValue;
    }

    public String getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus;
    }

    public String getPayCode() {
        return payCode;
    }

    public void setPayCode(String payCode) {
        this.payCode = payCode;
    }
//
//    public Integer getPayValue() {
//        return payValue;
//    }
//
//    public void setPayValue(Integer payValue) {
//        this.payValue = payValue;
//    }
    
    public static PayEnum getPayEnum(String code) {
        for (PayEnum pe : PayEnum.values()) {
            if (pe.getPayCode().equals(code)) {
                return pe;
            }
        }
        return null;
    }
    
    
}

