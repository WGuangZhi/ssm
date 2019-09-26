package com.hx.rm.service;

import java.util.List;

import com.hx.rm.entity.Role;
import com.hx.rm.entity.User;

public interface RoleService extends BaseService<Role> {
	List<Role> notList(User user);
	Role getShowMassage(int id);
	int update(Role role, int[] ids);
}
