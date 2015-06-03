package com.qzy.cn.conf.enums;

public enum PayTypeEnum {

	ALIPAY("支付宝", "alipay"),
	// 已付款
	WEIXING("微信", "weixing");

	private String name;

	private String value;

	private PayTypeEnum(String name, String value) {
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
