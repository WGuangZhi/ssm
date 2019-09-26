package com.hx.rm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hx.rm.dao.RoleDao;
import com.hx.rm.dao.UserDao;
import com.hx.rm.entity.Page;
import com.hx.rm.entity.Permission;
import com.hx.rm.entity.Role;
import com.hx.rm.entity.User;
import com.hx.rm.service.RoleService;
@Service("roleService")
public class RoleServiceImpl implements RoleService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private RoleDao roleDao;
	
	@Override
	public List<Role> list() {
		return roleDao.list();
	}

	@Override
	public Page<Role> find(int cPage, int pageNum, String condition) {
		Page<Role> page=new Page<Role>();
		Map map=new HashMap();
		page.setCurrentPage(cPage);
		page.setPageNum(pageNum);
		if(cPage<=0) cPage=1;
		int offSet=(cPage-1)*pageNum;
		map.put("pageNum", pageNum);
		map.put("offSet", offSet);
		map.put("condition",condition);
		List<Role> roles=roleDao.find(map);
		page.setDatas(roles);
		int totalNum=roleDao.count(map);//一定不要忘记传参
		page.setTotalNum(totalNum);
		int totalPage=(totalNum-1)/pageNum+1;
		page.setTotalPage(totalPage);
		return page;
	}

	@Override
	public Role load(int id) {
		return roleDao.load(id);
	}

	@Override
	public int add(Role role, int[] ids) {
		int i=0;
			if(ids.length>0){
				//通过返回的userid,得到中间表的userI
				i=roleDao.add(role);
				Map map=new HashMap();
				map.put("rid", role.getId());
				map.put("ids",ids);
				if(i>0) i=0; 
				i=roleDao.assignPermission(map);
			}
		
		return i;
	}

	@Override
	public int delete(int id) {
		return roleDao.delete(id);
	}

	@Override
	public int update(Role entity) {
		return 0;
	}

	@Override
	public List<Role> notList(User user) {
		List<Role> notRoleId = new ArrayList<Role>();
		notRoleId = user.getRoles();
		List<Integer> ids = new ArrayList<Integer>();
		for (Role role : notRoleId) {
			ids.add(role.getId());
		}
		return roleDao.notList(ids);
	}

	@Override
	public Role getShowMassage(int id) {
		return roleDao.getShowMassage(id);
	}

	@Override
	public int update(Role role, int[] ids) {
		int i=0;
		i=roleDao.update(role);
		Map map=new HashMap();
		map.put("rid",role.getId());
		map.put("ids",ids);
		if(i>0) i=roleDao.updatePermission(map);
		return i;
	}

}
