package com.hx.rm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hx.rm.dao.PermissionDao;
import com.hx.rm.entity.Page;
import com.hx.rm.entity.Permission;
import com.hx.rm.entity.Role;
import com.hx.rm.service.PermissionService;
@Service("permissionService")
public class PermissionServiceImpl implements PermissionService {
	
	@Resource
	private PermissionDao permissionDao;
	
	@Override
	public List<Permission> list() {
		return permissionDao.list();
	}

	@Override
	public Page<Permission> find(int cPage, int pageNum, String condition) {
		//Map map=new HashMap();
		return null;
	}

	@Override
	public Permission load(int id) {
		return permissionDao.load(id);
	}

	@Override
	public int add(Permission entity, int[] ids) {
		return 0;
	}

	@Override
	public int delete(int id) {
		return permissionDao.delete(id);
	}

	@Override
	public int update(Permission permission) {
		return permissionDao.update(permission);
	}

	@Override
	public List<Permission> notList(Role role) {
		List<Integer> ids=new ArrayList<Integer>();
		for(Permission per:role.getPers()) {
			ids.add(per.getId());
		}
		return permissionDao.notList(ids);
	}

	@Override
	public int add(Permission permission) {
		return permissionDao.add(permission);
	}

	@Override
	public List<Permission> listParent() {
		return permissionDao.listParent();
	}

}
