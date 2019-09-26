package com.hx.rm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hx.rm.dao.RoleDao;
import com.hx.rm.dao.UserDao;
import com.hx.rm.entity.Page;
import com.hx.rm.entity.User;
import com.hx.rm.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private RoleDao roleDao;
	
	public User load(int id) {
		return userDao.load(id);
	}

	public List<User> list() {
		return userDao.list();
	}
	
	//查询不用启用事务
	public Page<User> find(int cPage, int pageNum, String condition) {
		Page<User> page=new Page<User>();
		Map map=new HashMap();
		page.setCurrentPage(cPage);
		page.setPageNum(pageNum);
		if(cPage<=0) cPage=1;
		int offSet=(cPage-1)*pageNum;
		map.put("pageNum", pageNum);
		map.put("offSet", offSet);
		map.put("condition",condition);
		List<User> users=userDao.find(map);
		page.setDatas(users);
		int totalNum=userDao.count(map);//一定不要忘记传参
		page.setTotalNum(totalNum);
		int totalPage=(totalNum-1)/pageNum+1;
		page.setTotalPage(totalPage);
		return page;
	}

	public int add(User user) {
		
		return userDao.add(user);
	}

	public int delete(int id) {
		return userDao.delete(id);
	}

	public int update(User user) {
		return userDao.update(user);
	}

	public User getPermissionById(int id) {
		return userDao.getPermissionById(id);
	}

	public User login(User user) {
		return userDao.login(user);
	}
	
	//update启用事务
	public int update(User user, int[] ids) {
		int i=0;
		if(ids.length>0&&(user.getUserName()!=null&&!"".contains(user.getUserName()))) {
			i=userDao.update(user);
			if(i>0) i=0;
			Map map=new HashMap();
			map.put("uid",user.getId());
			map.put("ids",ids);
			i=userDao.assignRole(map);
		}
		return i;
	}

	@Override
	public int add(User user, int[] ids) {
		int i=0;
			if(ids.length>0){
				//通过返回的userid,得到中间表的userI
				i=userDao.add(user);
				Map map=new HashMap();
				map.put("uid",user.getId());
				map.put("ids",ids);
				if(i>0) i=0; 
				i=userDao.assignRole(map);
			}
		
		return i;
	}

}
