package com.qzy.cn.service.sys;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qzy.cn.entity.sys.Resources;
import com.qzy.cn.mapper.sys.ResourcesMapper;
import com.qzy.cn.service.BaseService;

@Service
public class ResourcesService extends BaseService<Resources, java.lang.Integer> {

	@Autowired
	private   ResourcesMapper  resourcesMapper;
	
	public List<Resources> findByRoleId(Integer roleId) {
		return resourcesMapper.findByRoleId(roleId);
	}

	public List<Resources> loadAll() {
		
		return super.findAll();
	}

}
