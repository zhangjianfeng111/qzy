package com.qzy.cn.conf.enums;

public enum AdvertiseEnum {
	
	MOBILE_HP("手机版首页广告","mobile_hp"),
    PC_HP("pc版首页轮播广告","pc_hp"),
	PC_ADV1("pc版首页广告1","adv1"),
	PC_ADV2("pc版首页广告2","adv2"),
	PC_ADV3("pc版首页广告3","adv3"),
	PC_ADV4("pc版首页广告4","adv4"),
	PC_ADV5("pc版首页广告5","adv5"),
	PC_ADV6("pc版首页广告6","adv6");

    private String advertiseDesc;
    
    private String advertiseCode;
    
    private AdvertiseEnum(String advertiseDesc,String advertiseCode) {
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

	public static AdvertiseEnum getPayEnum(String code) {
        for (AdvertiseEnum pe : AdvertiseEnum.values()) {
            if (pe.getAdvertiseCode().equals(code)) {
                return pe;
            }
        }
        return null;
    }
    
    
}

