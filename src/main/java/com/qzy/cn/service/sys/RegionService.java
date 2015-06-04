package com.qzy.cn.service.sys;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qzy.cn.service.SequenceService;
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
	@Autowired
	private SequenceService sequenceService;
	
	private static ThreadLocal<SimpleDateFormat> TRADE_DATE_FORMATs = new ThreadLocal<SimpleDateFormat>();
	public static  SimpleDateFormat ymdFormat() {
		SimpleDateFormat simpleDateFormat = TRADE_DATE_FORMATs.get();
		if(simpleDateFormat == null){
			simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
			TRADE_DATE_FORMATs.set(simpleDateFormat);
		}
		return simpleDateFormat;
	}
	
	public String regionNo(){
		return "REGION"+ymdFormat().format(Calendar.getInstance().getTime()) + StringUtils.leftPad(sequenceService.nextSequence("check_number", true).getValue().toString(), 6, "0");
	}
	
	public void regionSave(){
		
	}
	
	public List<Region> findByParentId(Integer parentId){
		RegionBean region = new RegionBean();
		region.setParentId(parentId);
		return regionMapper.query(region);
	}
}
