package com.qzy.cn.service.sys;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qzy.cn.bean.sys.RegionBean;
import com.qzy.cn.entity.sys.Region;
import com.qzy.cn.mapper.sys.RegionMapper;
import com.qzy.cn.service.BaseService;

/**
 * @author zgdcool
 * @version 2015年1月31日 下午10:34:23
 *   
 */
@Service
public class RegionService extends BaseService<Region, Integer>{

	@Autowired
	private RegionMapper regionMapper;
	
	public List<Region> findByParentId(Integer parentId){
		RegionBean region = new RegionBean();
		region.setParentId(parentId);
		return regionMapper.query(region);
	}
}
