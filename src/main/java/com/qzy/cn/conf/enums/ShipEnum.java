package com.qzy.cn.conf.enums;

public enum ShipEnum {
     // 未发货
     NOSEND("未发货","nosend", 0),
     // 已发货
     SENDED("已发货","sended", 1),
     // 已收货
     RECEIVE("已收货","received", 2);
     
    private String shipStatus;
    
    private String shipCode;
    
//    private Integer shipValue;

    private ShipEnum(String shipStatus, String shipCode, Integer shipValue) {
        this.shipStatus = shipStatus;
        this.shipCode = shipCode;
//        this.shipValue = shipValue;
    }

    public String getShipStatus() {
        return shipStatus;
    }

    public void setShipStatus(String shipStatus) {
        this.shipStatus = shipStatus;
    }

    public String getShipCode() {
        return shipCode;
    }

    public void setShipCode(String shipCode) {
        this.shipCode = shipCode;
    }

//    public Integer getShipValue() {
//        return shipValue;
//    }
//
//    public void setShipValue(Integer shipValue) {
//        this.shipValue = shipValue;
//    }
    
    public static ShipEnum getShipEnum(String code) {
        for (ShipEnum se : ShipEnum.values()) {
            if (se.getShipCode().equals(code)) {
                return se;
            }
        }
        return null;
    }
    
}

