package com.qzy.cn.mapper.advertise;

import com.qzy.cn.entity.advertise.LhRecPlace;
import com.qzy.cn.mapper.BaseMapper;

public interface LhRecPlaceMapper extends BaseMapper<LhRecPlace, Integer>{
    int deleteByPrimaryKey(Integer id);

    int insert(LhRecPlace record);

    int insertSelective(LhRecPlace record);

    LhRecPlace selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LhRecPlace record);

    int updateByPrimaryKey(LhRecPlace record);
}