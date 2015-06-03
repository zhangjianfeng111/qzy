package com.lianhai.spring.security;

import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * @author zgdcool
 * @version 2015年3月12日 下午8:00:59
 * 
 */

@Service("userDetailsService")
public class MyUserDetailsService implements UserDetailsService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
//	@Autowired
//	SysUserService managerService;
//
//	@Autowired
//	RoleService roleService;
//	
//	@Autowired
//	ResourcesService resourcesService;

	// @Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.info("==============> UserDetailsService{}",username);
		Set<GrantedAuthority> auths = new HashSet<GrantedAuthority>();
		
		// 取得用户
//		SysUser manager = managerService.loadByUserName(username);
//		if (manager == null) {
//			String message = "用户" + username + "不存在";
//			logger.error(message);
//			throw new UsernameNotFoundException(message);
//		}
//
//		// 获得用户的角色
//		Map<String,Integer> map = new HashMap<String,Integer>();
//		Set<Role> roles = roleService.loadRolesByUser(manager.getId().intValue());
//		for (Role item : roles) {
//			SimpleGrantedAuthority simpleGrantedAuthority = new SimpleGrantedAuthority(item.getName());
//			if (logger.isDebugEnabled()) {
//				logger.debug("用户：[" + manager.getUserName() + "]拥有角色：[" + item.getName() + "],即spring security中的access");
//			}
//			List<Resources>  resources =  resourcesService.findByRoleId(item.getId());
//			for (Resources resources2 : resources) {
//				map.put(resources2.getMore2(), 1);
//			}
//			auths.add(simpleGrantedAuthority);
//		}
//		
		
		if (logger.isDebugEnabled()) {
			logger.debug("loadUserByUsername(String) - end"); //$NON-NLS-1$  
		}
//		manager.setAuthorities(auths);
//		manager.setToUrlMap(map);
//		return manager;
		return null;
		/**
		 * 以下manager 不用继承 userDetail
		 */
	//	User user = new User(username, manager.getPassword(), true, true, true, true, auths);
		//return user;
	}

//	public SysUser loadByUserName(String username) {
//		return managerService.loadByUserName(username);
//	}
//
//	public SysUserService getManagerService() {
//		return managerService;
//	}

//	public void setManagerService(SysUserService managerService) {
//		this.managerService = managerService;
//	}
//
//	public RoleService getRoleService() {
//		return roleService;
//	}
//
//	public void setRoleService(RoleService roleService) {
//		this.roleService = roleService;
//	}
	
	

}
