package com.qzy.cn.mapper.pro;

import com.qzy.cn.entity.pro.Category;
import com.qzy.cn.mapper.BaseMapper;

public interface CategoryMapper extends BaseMapper<Category, Integer>{
    int deleteByPrimaryKey(Integer cateId);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer cateId);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
}