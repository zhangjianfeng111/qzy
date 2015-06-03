package com.qzy.cn.conf.enums;

public enum RemarkTypeEnum {
	IN("入库", "in"),
	OUT("出库","out"),
	STOCK("盘点修正","check");
	
	private String name;

	private String value;
	
	private RemarkTypeEnum(String name, String value) {
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
