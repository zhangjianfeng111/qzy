package com.qzy.cn.conf.enums;

public enum AuditeStatusTypeEnum {
	UN("未审核", "un"),
	OK("审核通过","ok"),
	NO("审核失败","no");
	
	private String name;

	private String value;
	
	private AuditeStatusTypeEnum(String name, String value) {
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
