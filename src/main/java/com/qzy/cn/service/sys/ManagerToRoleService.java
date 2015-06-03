package com.qzy.cn.service.sys;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qzy.cn.bean.sys.ManagerToRoleBean;
import com.qzy.cn.entity.sys.ManagerToRole;
import com.qzy.cn.entity.sys.SysUser;
import com.qzy.cn.mapper.sys.ManagerToRoleMapper;
import com.qzy.cn.service.BaseService;

@Service
public class ManagerToRoleService extends BaseService<ManagerToRole, Integer> {

	@Autowired
	ManagerToRoleMapper managerToRoleMapper;
	
	public void build(SysUser m, Integer roleId) {
		ManagerToRoleBean managerToRoleBean = new ManagerToRoleBean();
		if(m.getId() != null){
			managerToRoleBean.setManagerId(m.getId().intValue());
			List<ManagerToRole>  managerToRoles = super.queryAll(managerToRoleBean);
			if(CollectionUtils.isNotEmpty(managerToRoles)){
				for (ManagerToRole managerToRole : managerToRoles) {
					super.delete(managerToRole.getId());
				}
			}
		}
		
		ManagerToRole managerToRole = new ManagerToRole();
		managerToRole.setManagerId(m.getId().intValue());
		managerToRole.setRoleId(roleId);
		super.save(managerToRole);
	}

}
