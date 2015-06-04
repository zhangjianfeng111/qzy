package com.qzy.cn.conf.enums;

public enum AdvertiseTypeEnum {

    PRODUCDT_DETAIL("广告链接到产品详情","product-detail"),
    PAY_OK("广告链接到地区产品","product-city-list"),
    PAYING("广告链接到分类产品","product-cate-list");

    private String advertiseDesc;
    
    private String advertiseCode;
    
    private AdvertiseTypeEnum(String advertiseDesc,String advertiseCode) {
        this.advertiseDesc = advertiseDesc;
        this.advertiseCode = advertiseCode;
    }
    
    public String getAdvertiseDesc() {
		return advertiseDesc;
	}

	public void setAdvertiseDesc(String advertiseDesc) {
		this.advertiseDesc = advertiseDesc;
	}

	public String getAdvertiseCode() {
		return advertiseCode;
	}

	public void setAdvertiseCode(String advertiseCode) {
		this.advertiseCode = advertiseCode;
	}

	public static AdvertiseTypeEnum getPayEnum(String code) {
        for (AdvertiseTypeEnum pe : AdvertiseTypeEnum.values()) {
            if (pe.getAdvertiseCode().equals(code)) {
                return pe;
            }
        }
        return null;
    }
    
    
}

