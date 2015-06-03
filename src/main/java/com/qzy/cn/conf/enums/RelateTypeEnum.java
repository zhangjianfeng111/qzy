package com.qzy.cn.conf.enums;

public enum RelateTypeEnum {
	ORDER("订单", "order"),
	REFUND("退单","refund");
	
	private String name;

	private String value;
	
	private RelateTypeEnum(String name, String value) {
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
