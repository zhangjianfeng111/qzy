package com.qzy.cn.service.sys;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qzy.cn.entity.sys.Operator;
import com.qzy.cn.mapper.sys.OperatorMapper;
import com.qzy.cn.service.BaseService;

@Service
public class OperatorService extends BaseService<Operator, Integer>{
	@Autowired
	private OperatorMapper operatorMapper;
}
