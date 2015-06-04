package com.qzy.cn.action.advertise;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.qzy.cn.bean.advertise.LhAdvertiseBean;
import com.qzy.cn.conf.DataConfig;
import com.qzy.cn.entity.advertise.LhAdvertise;
import com.qzy.cn.service.advertise.LhAdvertiseService;
import com.qzy.cn.web.action.BaseCRUDController;
import com.qzy.cn.web.interceptor.AdminUserLogin;

/**
 * @ClassName: AdminLhAdvertiseAction.java
 * @Description: TODO 
 * @author  xuhj
 * @version V1.0  
 * @Date  2015-1-25 下午9:58:46 
 */
@AdminUserLogin
@Controller
@RequestMapping(value="admin/advertise")
public class AdminLhAdvertiseAction extends BaseCRUDController<LhAdvertiseBean, LhAdvertise, Integer>{
	@Autowired
	private LhAdvertiseService LhAdvertiseService;
	
	 @RequestMapping(value = "/input/{id}", method = RequestMethod.GET)
	    public String input(@PathVariable("id")
	    Integer id, Model model) {

	        if (permissionList != null) {
	            this.permissionList.assertHasUpdatePermission();
	        }

	        setCommonData(model);
	        model.addAttribute(DataConfig.OP_NAME, "修改");
	        model.addAttribute("info", LhAdvertiseService.findOne(id));
	        model.addAttribute("bean", LhAdvertiseService.findOne(id).getAreaId());
	       
	        return viewName("input");
	    }
}
