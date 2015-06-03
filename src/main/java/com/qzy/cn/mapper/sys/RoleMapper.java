package com.qzy.cn.mapper.sys;

import java.util.List;
import java.util.Set;

import com.qzy.cn.entity.sys.Role;
import com.qzy.cn.mapper.BaseMapper;

public interface RoleMapper extends BaseMapper<Role, Integer> {
    int deleteByPrimaryKey(Integer id);

	int insert(Role record);

	int insertSelective(Role record);

	Role selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Role record);

	int updateByPrimaryKey(Role record);

	Set<Role> loadRolesByUser(Integer userId);

	List<Role> loadByResources(Integer resourceId);

}