package com.qzy.cn.action.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lianhai.spring.security.util.SpringSecurityContent;
import com.qzy.cn.action.BaseController;
import com.qzy.cn.conf.DataConfig;
import com.qzy.cn.entity.sys.SysUser;
import com.qzy.cn.service.sys.SysUserService;
import com.qzy.cn.utils.PasswordUtils;

@Controller
@RequestMapping("admin/console")
public class ConsoleAction extends BaseController{

	@Autowired
	SysUserService				sysUserService;

	@RequestMapping("login")
	public String login( Model model ) {
		return "admin/login";
	}
	
	@RequestMapping("loginout")
	public String loginout( Model model ) {
		request.getSession().setAttribute(DataConfig.CURRENT_ADMIN_USER, null);
		return "admin/login";
	}

	@ResponseBody
	@RequestMapping("loginIn")
	public Object loginIn( Model model, String username, String password, String yzm ) {
		SysUser sysUser = sysUserService.loadByUserName(username);
		if (StringUtils.isEmpty(yzm)
				|| !yzm.equalsIgnoreCase(String.valueOf(request.getSession().getAttribute("yanzhengma")))) {
			return fail("Verification code is wrong");
		}

		if (sysUser != null) {
			if (sysUser.getAccountStatus() == null || !sysUser.getAccountStatus()) {
				return fail("The account is freeze！");
			}
			if (PasswordUtils.validPassword(sysUser.getPassword(), password)) {
				request.getSession().setAttribute(DataConfig.CURRENT_ADMIN_USER, sysUser);
				request.getSession().removeAttribute("yanzhengma");
				return suc("登录成功");
			} else {
				return fail("Password wrong！");
			}

		} else {
			return fail("UserName not exist！");
		}
	}
	
	
	@RequestMapping("index")
	public String index(Model model, HttpServletRequest request){
		SysUser sysUser = SpringSecurityContent.getUser();
		request.getSession().setAttribute(DataConfig.CURRENT_ADMIN_USER, sysUser);
		return  "admin/index";
	}

}
