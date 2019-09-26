package com.hx.rm.entity;

import java.io.Serializable;
import java.util.List;
import java.util.Set;


public class User implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String userName;
	private String password;
	private String email;
	private String phone;
	private int status;
	private UserInfo userInfo;
	private List<Role> roles;//用户角色
	private Set<Permission> pers;//用户权限如果，多个角色又有重复的权限，就可以过滤掉
	
	public User() {
	}

	public User(int id, String userName, String password, String email, String phone, int status, UserInfo userInfo,
			List<Role> roles, Set<Permission> pers) {
		this.id = id;
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.status = status;
		this.userInfo = userInfo;
		this.roles = roles;
		this.pers = pers;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public Set<Permission> getPers() {
		return pers;
	}

	public void setPers(Set<Permission> pers) {
		this.pers = pers;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", password=" + password + ", email=" + email + ", phone="
				+ phone + ", status=" + status + ", userInfo=" + userInfo + ", roles=" + roles + ", pers=" + pers + "]";
	}
}
