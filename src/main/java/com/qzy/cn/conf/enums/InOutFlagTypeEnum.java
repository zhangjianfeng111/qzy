package com.qzy.cn.conf.enums;

public enum InOutFlagTypeEnum {
	STOCK_IN("入库单", "stock_in"),
	STOCK_OUT("出库单","stock_out");
	
	private String name;

	private String value;
	
	private InOutFlagTypeEnum(String name, String value) {
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
