package com.qzy.cn.conf.enums;

public enum GiftEnum {

	ELECTRONIC_COUPONS("电子券","ele"),
	ENTITY_COUPONS("实体券","pap");

    private String typeName;
    private String typeCode;
//    
    
    private GiftEnum(String typeName,String typeCode) {
        this.typeName = typeName;
        this.typeCode = typeCode;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode;
    }
    
    public static GiftEnum getPayEnum(String code) {
        for (GiftEnum pe : GiftEnum.values()) {
            if (pe.getTypeCode().equals(code)) {
                return pe;
            }
        }
        return null;
    }
    
    
}

