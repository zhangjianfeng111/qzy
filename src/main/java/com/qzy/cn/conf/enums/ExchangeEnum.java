package com.qzy.cn.conf.enums;
/**
 * @author zgdcool
 * @version 2015年2月3日 上午2:34:42
 *   
 */
public enum ExchangeEnum {
	TEST_HUNDRED(210d, 0.01d),
	TWO_HUNDRED(210d, 200d),
	FIVE_HUNDRED(540d,500d),
	TEN_HUNDRED(1100d,1000d),

	;
	private Double giftValue;
	
	private Double giftPrice;
	
	private ExchangeEnum(Double giftValue, Double giftPrice){
		this.giftValue = giftValue;
		this.giftPrice = giftPrice;
	}

	public Double getGiftValue() {
		return giftValue;
	}

	public void setGiftValue(Double giftValue) {
		this.giftValue = giftValue;
	}

	public Double getGiftPrice() {
		return giftPrice;
	}

	public void setGiftPrice(Double giftPrice) {
		this.giftPrice = giftPrice;
	}
	
	public static ExchangeEnum getExchangeEnum(Double giftPrice) {
        for (ExchangeEnum pe : ExchangeEnum.values()) {
            if (pe.getGiftPrice().doubleValue() == giftPrice.doubleValue()) {
                return pe;
            }
        }
        return null;
    }
	
}
