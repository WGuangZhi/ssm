package com.hx.rm.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hx.rm.entity.User;
import com.hx.rm.entity.UserInfo;
@Repository("userDao")
public interface UserDao extends BaseDao<User> {
	//这里的方法名必须和就具体的映射文件的sql   ID 保持对应
	User getPermissionById(int id);
	User login(User user);//用于登录查询
	int assignRole(Map map);//给用户分配角色,在给xml传值的时候可以使用，实体对象，map，list对象；在这里就使用的是list对象
}
