package com.qzy.cn.mapper.advertise;

import com.qzy.cn.entity.advertise.LhAdvertise;
import com.qzy.cn.mapper.BaseMapper;

public interface LhAdvertiseMapper extends BaseMapper<LhAdvertise, Integer>{
    int deleteByPrimaryKey(Integer id);

    int insert(LhAdvertise record);

    int insertSelective(LhAdvertise record);

    LhAdvertise selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LhAdvertise record);

    int updateByPrimaryKey(LhAdvertise record);
}