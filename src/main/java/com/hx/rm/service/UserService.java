package com.hx.rm.service;

import com.hx.rm.entity.User;

public interface UserService extends BaseService<User> {
	User getPermissionById(int id);//关联查询获取权限
	User login(User user);//用户登录查询
	int update(User user, int[] roles);
}
