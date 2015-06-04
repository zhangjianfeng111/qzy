package com.qzy.cn.mapper.advertise;

import com.qzy.cn.entity.advertise.LhRecInfo;
import com.qzy.cn.mapper.BaseMapper;

public interface LhRecInfoMapper extends BaseMapper<LhRecInfo, Integer>{
    int deleteByPrimaryKey(Integer recId);

    int insert(LhRecInfo record);

    int insertSelective(LhRecInfo record);

    LhRecInfo selectByPrimaryKey(Integer recId);

    int updateByPrimaryKeySelective(LhRecInfo record);

    int updateByPrimaryKey(LhRecInfo record);
}