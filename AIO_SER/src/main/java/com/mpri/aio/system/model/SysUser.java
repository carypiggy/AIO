package com.mpri.aio.system.model;

import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.mpri.aio.base.model.DataEntity;
/**
 * 用户实体类-JSR380校验
 * @author Cary
 * @Date  2018年7月31日
 */
public class SysUser extends DataEntity<SysUser> {

	private static final long serialVersionUID = 1L;

    private String orgId;

    @NotNull(message="用户名不能为空")
    @Size(min = 2, max = 64, message = "用户名长度必须大于 2 且小于 64 字")
    private String username;

    private String password;

    private String safecode;
    
    @NotNull(message="姓名不能为空")
    @Size(min = 2, max = 64, message = "姓名长度必须大于 2 且小于 64 字")
    private String name;

    private String idcard;
    
    private String photo;

    private String mobile;

    @Email(message="姓名不能为空")
    private String email;
    
    @NotNull(message="类型不能为空")
    private String type;
    
    private String orgName;
    
    
    public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	private List<SysRole> roleList;/*角色列表*/
    
    public List<SysRole> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<SysRole> roleList) {
		this.roleList = roleList;
	}

	public String getOrgId() {
        return orgId;
    }
    
    public void setOrgId(String orgId) {
        this.orgId = orgId == null ? null : orgId.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getSafecode() {
        return safecode;
    }

    public void setSafecode(String safecode) {
        this.safecode = safecode == null ? null : safecode.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo == null ? null : photo.trim();
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    
}