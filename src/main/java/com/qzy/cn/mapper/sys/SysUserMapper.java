package com.qzy.cn.mapper.sys;

import com.qzy.cn.entity.sys.SysUser;
import com.qzy.cn.mapper.BaseMapper;

public interface SysUserMapper extends BaseMapper<SysUser, Long> {
    int deleteByPrimaryKey(Long accountId);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(Long accountId);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);

	SysUser loadByUserName(String account);
}