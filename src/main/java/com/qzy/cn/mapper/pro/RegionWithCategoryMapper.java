package com.qzy.cn.mapper.pro;

import com.qzy.cn.entity.pro.RegionWithCategory;
import com.qzy.cn.mapper.BaseMapper;

public interface RegionWithCategoryMapper extends BaseMapper<RegionWithCategory, Integer>{
    int deleteByPrimaryKey(Integer cateId);

    int insert(RegionWithCategory record);

    int insertSelective(RegionWithCategory record);

    RegionWithCategory selectByPrimaryKey(Integer cateId);

    int updateByPrimaryKeySelective(RegionWithCategory record);

    int updateByPrimaryKey(RegionWithCategory record);
}