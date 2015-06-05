package com.qzy.cn.service.pro;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qzy.cn.bean.pro.CategoryBean;
import com.qzy.cn.entity.pro.Category;
import com.qzy.cn.mapper.pro.CategoryMapper;
import com.qzy.cn.service.BaseService;
import com.qzy.cn.service.SequenceService;

/**
 * 
 * @author zhangjianfeng
 *
 */
@Service
public class CategoryService extends BaseService<Category, Integer>{

	@Autowired
	private CategoryMapper categoryMapper;
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
	
	public String cateNo(){
		return "CATE"+ymdFormat().format(Calendar.getInstance().getTime()) + StringUtils.leftPad(sequenceService.nextSequence("check_number", true).getValue().toString(), 6, "0");
	}
	public List<Category> findByParentId(Integer parentId){
		CategoryBean cate = new CategoryBean();
		cate.setParentId(parentId);
		return categoryMapper.query(cate);
	}
}
