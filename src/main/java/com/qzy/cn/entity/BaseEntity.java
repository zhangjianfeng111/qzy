/**
 * @author zgdcool
 * @version 2015年1月21日 下午3:51:13
 *   
 */

package com.qzy.cn.entity;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.qzy.cn.bean.SearchBean;
import com.qzy.cn.utils.JsonMapper;

/**
 * ClassName:BaseEntity
 * 
 * @Function: 实体父类.
 * @Date: 2014-3-18 下午3:42:31
 * @author zengxiangzhu
 * @version
 * @since JDK 1.6
 * @see
 */
public abstract class BaseEntity<ID extends Serializable> extends SearchBean implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    
    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 创建者
     */
    private String createUser;
    
    
    /**
     * 更新时间
     */
    private Date updateTime;
    
    /**
     * 更新者
     */
    private String updateUser;

    public abstract ID  getId() ;

    public void setId(ID id) {
        
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser;
    }

    @JsonIgnore
    public String getJsonObject() {
        return JsonMapper.toJsonStr(this);
    }
  
}
