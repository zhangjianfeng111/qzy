package com.qzy.cn.action.advertise;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qzy.cn.bean.ResultBean;
import com.qzy.cn.bean.advertise.LhRecInfoBean;
import com.qzy.cn.conf.DataConfig;
import com.qzy.cn.entity.advertise.LhRecInfo;
import com.qzy.cn.service.advertise.LhRecInfoService;
import com.qzy.cn.utils.JsonMapper;
import com.qzy.cn.web.action.BaseCRUDController;
import com.qzy.cn.web.interceptor.AdminUserLogin;

/**
 * @ClassName: AdminLhRecInfoAction.java
 * @Description: TODO 
 * @author  xuhj
 * @version V1.0  
 * @Date  2015-1-25 下午10:05:32 
 */
@AdminUserLogin
@Controller
@RequestMapping(value="admin/rec")
public class AdminLhRecInfoAction extends BaseCRUDController<LhRecInfoBean, LhRecInfo, Integer> {
	@Autowired
	private LhRecInfoService LhRecInfoService;
	
	 @RequestMapping(value = "/input/{id}", method = RequestMethod.GET)
	    public String input(@PathVariable("id")
	    Integer id, Model model) {

	        if (permissionList != null) {
	            this.permissionList.assertHasUpdatePermission();
	        }
	        LhRecInfo info = LhRecInfoService.findOne(id);
	        String content = "";
			if (info.getRecComment() != null && info.getRecComment() != "") {
				content = LhRecInfoService.showEditor(info.getRecComment());
			}
			info.setRecComment(content);

	        setCommonData(model);
	        model.addAttribute(DataConfig.OP_NAME, "修改");
	        model.addAttribute("info", info);
	        model.addAttribute("bean", info.getPlaceId());
	       
	        return viewName("input");
	    }
	 
	 	@ResponseBody
	    @RequestMapping(value = "/save", method = RequestMethod.POST)
	    public Map<String, Object> save(@Valid
	    		LhRecInfo m,HttpServletRequest request) {
	    	ResultBean b = new ResultBean();
	        if (permissionList != null) {
	            this.permissionList.assertHasUpdatePermission();
	        }
	        if(m.getRecId() != null){
	        b.setIsSuccess(LhRecInfoService.isUpdate(m));
	        }else{
	        	b.setIsSuccess(LhRecInfoService.isSave(m));	
	        }
	        return JsonMapper.beanToMap(b);
	    }
}
