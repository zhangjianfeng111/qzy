package com.qzy.cn.mapper.sys;

import com.qzy.cn.entity.sys.ManagerToRole;
import com.qzy.cn.mapper.BaseMapper;

public interface ManagerToRoleMapper extends BaseMapper<ManagerToRole, Integer>{
    int deleteByPrimaryKey(Integer id);

    int insert(ManagerToRole record);

    int insertSelective(ManagerToRole record);

    ManagerToRole selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ManagerToRole record);

    int updateByPrimaryKey(ManagerToRole record);
}