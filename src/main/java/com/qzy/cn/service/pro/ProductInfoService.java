package com.qzy.cn.service.pro;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qzy.cn.entity.pro.ProductInfo;
import com.qzy.cn.mapper.pro.ProductInfoMapper;
import com.qzy.cn.service.BaseService;

/**
 * 
 * @author zhangjianfeng
 *
 */
@Service
public class ProductInfoService extends BaseService<ProductInfo, Integer>{

	@Autowired
	private ProductInfoMapper productInfoMapper;
	
}
