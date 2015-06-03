package com.qzy.cn.conf.enums;

public enum GiftStatusEnum {

    // 未兑换
    NO_EXCHANGE("未兑换","no_exchange"),
    // 已兑换
    EXCHANGE_OK("已兑换","exchange_ok");

    private String exchangeStatus;
    
    private String exchangeCode;
    
    private GiftStatusEnum(String exchangeStatus,String exchangeCode) {
        this.exchangeStatus = exchangeStatus;
        this.exchangeCode = exchangeCode;
    }
    
    public String getExchangeStatus() {
		return exchangeStatus;
	}

	public void setExchangeStatus(String exchangeStatus) {
		this.exchangeStatus = exchangeStatus;
	}

	public String getExchangeCode() {
		return exchangeCode;
	}

	public void setExchangeCode(String exchangeCode) {
		this.exchangeCode = exchangeCode;
	}

	public static GiftStatusEnum getPayEnum(String code) {
        for (GiftStatusEnum pe : GiftStatusEnum.values()) {
            if (pe.getExchangeCode().equals(code)) {
                return pe;
            }
        }
        return null;
    }
    
    
}

