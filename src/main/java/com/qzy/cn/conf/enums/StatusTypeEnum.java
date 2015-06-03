package com.qzy.cn.conf.enums;

public enum StatusTypeEnum {
	UN("未确认", "un"),
	OK("已确认","ok"),
	NO("已取消","no");
	
	private String name;

	private String value;
	
	private StatusTypeEnum(String name, String value) {
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
