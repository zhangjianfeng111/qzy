package com.qzy.cn.action.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qzy.cn.bean.sys.RegionBean;
import com.qzy.cn.entity.sys.Region;
import com.qzy.cn.web.action.BaseCRUDController;

/**
 * @author zgdcool
 * @version 2015年1月31日 下午10:48:58
 *   
 */
@Controller
@RequestMapping(value="region")
public class RegionAction extends BaseCRUDController<RegionBean, Region, Integer>{

}
