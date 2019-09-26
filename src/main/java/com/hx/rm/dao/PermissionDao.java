package com.hx.rm.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hx.rm.entity.Permission;
@Repository("permissionDao")
public interface PermissionDao extends BaseDao<Permission> {
	List<Permission> notList(List<Integer> ids);
	List<Permission> listParent();
}
