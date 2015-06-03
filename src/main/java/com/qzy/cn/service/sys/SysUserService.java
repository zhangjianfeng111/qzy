package com.qzy.cn.service.sys;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.qzy.cn.bean.SearchBean;
import com.qzy.cn.entity.sys.SysUser;
import com.qzy.cn.mapper.sys.SysUserMapper;
import com.qzy.cn.service.BaseService;
import com.qzy.cn.utils.PasswordUtils;

/**
 * 后台管理员
 * @author jiangjianlong
 *
 */
@Service
public class SysUserService extends BaseService<SysUser, Long> {

	@Autowired
	SysUserMapper sysUserMapper;
	
	public Boolean saveOrUpdate(SysUser t) {
		if(t.getAccountId() == null){
			t.setAccountStatus(true);
			return super.isSave(t);
		}
		return  super.isUpdate(t);
	}
	
	@Override
	protected void initSave(SysUser m) {
		try {
			if(StringUtils.isBlank(m.getPassword())){
				m.setPassword(PasswordUtils.encrypt("123456"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public SysUser loadByUserName(String account) {
		return sysUserMapper.loadByUserName(account);
	}
	
	public SysUser findById(Long id){
		return sysUserMapper.selectByPrimaryKey(id);
	}
	
	@Override
	public PageList<SysUser> queryAllWithPage(SearchBean bean,
			PageBounds pageBounds) {
		// TODO Auto-generated method stub
		return sysUserMapper.query(bean, pageBounds);
	}
}
