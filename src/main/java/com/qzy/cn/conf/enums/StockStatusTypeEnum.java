package com.qzy.cn.conf.enums;

public enum StockStatusTypeEnum {
	NORMAL("正常", "normal"),
	SCRAP("报废","scrap");
	
	private String name;

	private String value;
	
	private StockStatusTypeEnum(String name, String value) {
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
