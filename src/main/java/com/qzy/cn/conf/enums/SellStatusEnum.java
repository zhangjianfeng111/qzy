package com.qzy.cn.conf.enums;

public enum SellStatusEnum {

	TINGSHOU("停售","0"),
	CHUSHOU("出售","1");

    private String typeName;
    private String typeCode;
//    
    
    private SellStatusEnum(String typeName,String typeCode) {
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
    
    public static SellStatusEnum getPayEnum(String code) {
        for (SellStatusEnum pe : SellStatusEnum.values()) {
            if (pe.getTypeCode().equals(code)) {
                return pe;
            }
        }
        return null;
    }
    
    
}

