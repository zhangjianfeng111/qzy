package com.qzy.cn.mapper.sys;

import com.qzy.cn.entity.sys.Region;
import com.qzy.cn.mapper.BaseMapper;

public interface RegionMapper extends BaseMapper<Region, Integer>{
    int deleteByPrimaryKey(Integer regionId);

    int insert(Region record);

    int insertSelective(Region record);

    Region selectByPrimaryKey(Integer regionId);

    int updateByPrimaryKeySelective(Region record);

    int updateByPrimaryKey(Region record);
}