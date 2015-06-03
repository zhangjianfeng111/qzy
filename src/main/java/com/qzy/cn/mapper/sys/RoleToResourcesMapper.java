package com.qzy.cn.mapper.sys;

import com.qzy.cn.entity.sys.RoleToResources;
import com.qzy.cn.mapper.BaseMapper;

public interface RoleToResourcesMapper extends BaseMapper<RoleToResources, Integer>{
    int deleteByPrimaryKey(Integer id);

	int insert(RoleToResources record);

	int insertSelective(RoleToResources record);

	RoleToResources selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(RoleToResources record);

	int updateByPrimaryKey(RoleToResources record);
}