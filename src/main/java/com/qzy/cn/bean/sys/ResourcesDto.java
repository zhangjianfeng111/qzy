package com.qzy.cn.bean.sys;

import com.qzy.cn.entity.sys.Resources;

@SuppressWarnings("serial")
public class ResourcesDto extends Resources {
	
	Boolean hasRole = false;

	public Boolean getHasRole() {
		return hasRole;
	}

	public void setHasRole(Boolean hasRole) {
		this.hasRole = hasRole;
	}
	
}