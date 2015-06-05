package com.qzy.cn.mapper.sys;

import com.qzy.cn.entity.sys.Operator;
import com.qzy.cn.mapper.BaseMapper;

public interface OperatorMapper extends BaseMapper<Operator, Integer>{
    int deleteByPrimaryKey(Integer id);

	int insert(Operator record);

	int insertSelective(Operator record);

	Operator selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Operator record);

	int updateByPrimaryKeyWithBLOBs(Operator record);

	int updateByPrimaryKey(Operator record);


}