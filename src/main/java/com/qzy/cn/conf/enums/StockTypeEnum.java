package com.qzy.cn.conf.enums;

public enum StockTypeEnum {
	BUY("采购进货", "buy"),
	SALE("销售订单","sale"),
	BUY_REFUND("采购退货","sale_refund"),
	SAL_REFUND("销售退货","buy_refund"),
	CHECK("盘点","check");
	
	private String name;

	private String value;
	
	private StockTypeEnum(String name, String value) {
		this.name = name;
		this.value = value;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
