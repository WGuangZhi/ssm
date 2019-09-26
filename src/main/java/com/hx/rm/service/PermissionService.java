package com.hx.rm.service;

import java.util.List;

import com.hx.rm.entity.Permission;
import com.hx.rm.entity.Role;

public interface PermissionService extends BaseService<Permission> {
	List<Permission> notList(Role role);
	int add(Permission permission);
	List<Permission> listParent();
}
