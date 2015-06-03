package com.qzy.cn.action.sys;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lianhai.spring.security.util.SpringSecurityContent;
import com.qzy.cn.bean.sys.RoleBean;
import com.qzy.cn.bean.sys.SysUserBean;
import com.qzy.cn.conf.DataConfig;
import com.qzy.cn.entity.sys.Role;
import com.qzy.cn.entity.sys.SysUser;
import com.qzy.cn.service.sys.ManagerToRoleService;
import com.qzy.cn.service.sys.RoleService;
import com.qzy.cn.service.sys.SysUserService;
import com.qzy.cn.utils.PasswordUtils;
import com.qzy.cn.web.action.BaseCRUDController;
import com.qzy.cn.web.interceptor.AdminUserLogin;

/**
 * @author zgdcool
 * @version 2015年3月14日 下午4:56:23
 *   
 */
@Controller
@RequestMapping(value="admin/manager")
public class ManagerAction extends BaseCRUDController<SysUserBean, SysUser, Long>{
	@Autowired
	RoleService roleService;
	@Autowired
	ManagerToRoleService  managerToRoleService;
	
	@Override
	protected String _loadPrefix() {
		return "manager_";
	}
	@Autowired
	private SysUserService managerService;
	
	@RequestMapping("login")
	public  String login(Model model){
		return  "admin/login";
	}

	/**
	 * 登入动作
	 */
	@ResponseBody
	@RequestMapping("loginIn")
	public Map<String, Object> loginIn(Model model, String account,
			String password, String yzm, HttpServletRequest request) {
		
		SysUser  adminInfo = managerService.loadByUserName(account);
		if(StringUtils.isEmpty(yzm) || !yzm.equalsIgnoreCase(String.valueOf(request.getSession().getAttribute("yanzhengma")))){
			return fail("Verification code is wrong!");
		}
		
		if(adminInfo!=null){
			if(PasswordUtils.validPassword(adminInfo.getPassword(), password)){
				request.getSession().setAttribute(DataConfig.CURRENT_ADMIN_USER, adminInfo);
				logger.debug("===========================================================");
				request.getSession().removeAttribute("yanzhengma");
				return suc(SUCCESS);
			}else{
				return fail("Password wrong！");
			}
		}else{
			return fail("UserName not exist！");
		}
		
	}
	
	
	@RequestMapping("index")
	public String  index(){
		SysUser  manager = SpringSecurityContent.getUser();
		request.getSession().setAttribute(DataConfig.CURRENT_ADMIN_USER, manager);
		return  "admin/manager/index";
	}
	

	@AdminUserLogin
	@Override
	public String add(SysUser m, Model model) {
		model.addAttribute("roles", roleService.queryAll( new RoleBean() ));
		return super.add(m, model);
	}
	@AdminUserLogin
	@Override
	public String input(@PathVariable Long id, Model model) {
		Role role = roleService.loadOneRole(id.intValue());
		if(role!= null){
			model.addAttribute("roleId", role.getId());
		}
		
		model.addAttribute("roles", roleService.queryAll( new RoleBean() ));
		return super.input(id, model);
	}
	
	@AdminUserLogin
	@Override
	public Map<String, Object> save(SysUser m, HttpServletRequest request) {
		//if(StringUtils.isBlank(m.getPassword()))
		Map<String, Object>  back = super.save(m, request);
		managerToRoleService.build(m, m.getRoleId());
		return back;
	}
	@AdminUserLogin
	@RequestMapping("defaultPwd")
	@ResponseBody
	public Object defaultPwd(SysUser  m){
		try {
			m.setPassword(PasswordUtils.encrypt("123456"));
			baseService.save(m);
			return suc(SUCCESS);
		} catch (Exception e) {
			return fail(FAIL);
		}
	}
	
	
	@RequestMapping("toModifyPwd")
	@AdminUserLogin
	public String toModifyPwd(){
		return viewName("modifyPwd");
	}
	
	@RequestMapping("modifyPwd")
	@ResponseBody
	@AdminUserLogin
	public Object  modifyPwd(Model moedl, String password,
			String oldPassword, HttpServletRequest request) throws Exception {
		SysUser manager = SpringSecurityContent.getUser();
		manager = managerService.findOne(manager.getId());
		if(PasswordUtils.validPassword(manager.getPassword(), oldPassword)){
			manager.setPassword(PasswordUtils.encrypt(password));
			managerService.update(manager);
			return suc("密码修改成功");
		}else {
			return  fail("原密码不正确");
		}
	}
	
}
