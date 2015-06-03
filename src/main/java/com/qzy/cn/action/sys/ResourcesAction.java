package com.qzy.cn.action.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qzy.cn.bean.sys.ResourcesBean;
import com.qzy.cn.entity.sys.Resources;
import com.qzy.cn.web.action.BaseCRUDController;
import com.qzy.cn.web.interceptor.AdminUserLogin;

@RequestMapping("admin/resources")
@AdminUserLogin
@Controller
public class ResourcesAction extends BaseCRUDController<ResourcesBean, Resources, java.lang.Integer> {
	
	@Override
	protected String _loadPrefix() {
		return "resources_";
	}

}
