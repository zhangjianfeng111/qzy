package com.qzy.cn.service.pro;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qzy.cn.entity.pro.RegionWithCategory;
import com.qzy.cn.mapper.pro.RegionWithCategoryMapper;
import com.qzy.cn.service.BaseService;

/**
 * 
 * @author zhangjianfeng
 *
 */
@Service
public class RegionWithCategoryService extends BaseService<RegionWithCategory, Integer>{
	@Autowired
	private RegionWithCategoryMapper regionWithCategoryMapper;
}
