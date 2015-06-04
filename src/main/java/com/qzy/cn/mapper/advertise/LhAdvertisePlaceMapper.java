package com.qzy.cn.mapper.advertise;

import com.qzy.cn.entity.advertise.LhAdvertisePlace;
import com.qzy.cn.mapper.BaseMapper;

public interface LhAdvertisePlaceMapper extends BaseMapper<LhAdvertisePlace, Integer>{
    int deleteByPrimaryKey(Integer areaId);

    int insert(LhAdvertisePlace record);

    int insertSelective(LhAdvertisePlace record);

    LhAdvertisePlace selectByPrimaryKey(Integer areaId);

    int updateByPrimaryKeySelective(LhAdvertisePlace record);

    int updateByPrimaryKey(LhAdvertisePlace record);
}