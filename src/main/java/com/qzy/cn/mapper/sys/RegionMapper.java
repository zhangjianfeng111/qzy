package com.qzy.cn.mapper.sys;

import com.qzy.cn.entity.sys.Region;
import com.qzy.cn.mapper.BaseMapper;

public interface RegionMapper extends BaseMapper<Region, Integer>{
    int deleteByPrimaryKey(Integer id);

	int insert(Region record);

	int insertSelective(Region record);

	Region selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Region record);

	int updateByPrimaryKey(Region record);

}