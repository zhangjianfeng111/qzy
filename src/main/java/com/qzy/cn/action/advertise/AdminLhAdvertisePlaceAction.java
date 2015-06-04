package com.qzy.cn.action.advertise;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qzy.cn.bean.ResultBean;
import com.qzy.cn.bean.advertise.LhAdvertisePlaceBean;
import com.qzy.cn.entity.advertise.LhAdvertisePlace;
import com.qzy.cn.service.advertise.LhAdvertisePlaceService;
import com.qzy.cn.utils.JsonMapper;
import com.qzy.cn.web.action.BaseCRUDController;
import com.qzy.cn.web.interceptor.AdminUserLogin;

/**
 * @ClassName: AdminLhAdvertisePlaceAction.java
 * @Description: TODO 
 * @author  xuhj
 * @version V1.0  
 * @Date  2015-1-25 下午10:02:45 
 */
@AdminUserLogin
@Controller
@RequestMapping(value="admin/advertiseplace")
public class AdminLhAdvertisePlaceAction extends BaseCRUDController<LhAdvertisePlaceBean, LhAdvertisePlace, Integer>{

	@Autowired
	private LhAdvertisePlaceService LhAdvertisePlaceService;
	@ResponseBody
	    @RequestMapping(value = "/updata", method = RequestMethod.POST)
	    public Map<String, Object> save(@Valid
	    		LhAdvertisePlace m,HttpServletRequest request) {
	    	ResultBean b = new ResultBean();
	        if (permissionList != null) {
	            this.permissionList.assertHasUpdatePermission();
	        }
	        if(m.getAreaId()!=null){
	        b.setIsSuccess(LhAdvertisePlaceService.isUpdate(m));
	        }else{
	        	b.setIsSuccess(LhAdvertisePlaceService.isSave(m));
	        }
	        return JsonMapper.beanToMap(b);
	    }
}
