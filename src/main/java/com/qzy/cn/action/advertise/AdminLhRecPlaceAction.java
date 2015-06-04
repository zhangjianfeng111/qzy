package com.qzy.cn.action.advertise;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qzy.cn.bean.advertise.LhRecPlaceBean;
import com.qzy.cn.entity.advertise.LhRecPlace;
import com.qzy.cn.web.action.BaseCRUDController;
import com.qzy.cn.web.interceptor.AdminUserLogin;

/**
 * @ClassName: AdminLhRecPlaceAction.java
 * @Description: TODO 
 * @author  xuhj
 * @version V1.0  
 * @Date  2015-1-25 下午10:06:05 
 */
@AdminUserLogin
@Controller
@RequestMapping(value="admin/recplace")
public class AdminLhRecPlaceAction extends BaseCRUDController<LhRecPlaceBean, LhRecPlace, Integer>{

}
