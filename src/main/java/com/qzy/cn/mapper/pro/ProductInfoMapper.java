package com.qzy.cn.mapper.pro;

import com.qzy.cn.entity.pro.ProductInfo;
import com.qzy.cn.mapper.BaseMapper;

public interface ProductInfoMapper extends BaseMapper<ProductInfo, Integer>{
    int deleteByPrimaryKey(Integer id);

    int insert(ProductInfo record);

    int insertSelective(ProductInfo record);

    ProductInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProductInfo record);

    int updateByPrimaryKeyWithBLOBs(ProductInfo record);

    int updateByPrimaryKey(ProductInfo record);
}