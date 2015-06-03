package com.qzy.cn.bean.sys;

import com.qzy.cn.bean.SearchBean;
import com.qzy.cn.utils.MyTable;

/**
 * 
 * @author jiangjianlong
 *
 */
@MyTable(name="lh_sys_account")
public class SysUserBean extends SearchBean{
   
	
	private static final long serialVersionUID = 5232623356464982008L;

	private Long accountId;

    private String realName;
    
    /** 账号**/
    private String userName;

    private String password;

    private String mobile;

    private String email;

    /** o冻结  , 1: 正常**/
    private Boolean accountStatus;

    private Integer compId;

    private Long qfcAccountId;
    
    private Integer roleId;

    public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Long getAccountId() {
        return accountId;
    }

    public void setAccountId(Long accountId) {
        this.accountId = accountId;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName == null ? null : realName.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Boolean getAccountStatus() {
        return accountStatus;
    }

    public void setAccountStatus(Boolean accountStatus) {
        this.accountStatus = accountStatus;
    }

    public Integer getCompId() {
        return compId;
    }

    public void setCompId(Integer compId) {
        this.compId = compId;
    }

    public Long getQfcAccountId() {
        return qfcAccountId;
    }

    public void setQfcAccountId(Long qfcAccountId) {
        this.qfcAccountId = qfcAccountId;
    }
}