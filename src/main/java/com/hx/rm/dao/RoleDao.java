package com.hx.rm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hx.rm.entity.Role;

/**
 * @ClassName: RoleDao
 * @Description: 描述这个类的作用
 * @author: 王光智
 * @date: 2019年8月9日 下午12:25:15
 * @param: @param <E>
 *
 */
@Repository("roleDao")
public interface RoleDao extends BaseDao<Role> {
	//这里的方法名必须和就具体的映射文件的sql   ID 保持对应
	List<Role> notList(List<Integer> ids);
	int assignPermission(Map map);
	Role getShowMassage(@Param("id")int id);
	int updatePermission(Map map);
}
