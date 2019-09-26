package com.hx.rm.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hx.rm.dao.RoleDao;
import com.hx.rm.entity.Page;
import com.hx.rm.entity.Permission;
import com.hx.rm.entity.Role;
import com.hx.rm.entity.User;
import com.hx.rm.service.PermissionService;
import com.hx.rm.service.RoleService;
import com.hx.rm.service.impl.RoleServiceImpl;

@Controller
@RequestMapping("/role")
public class RoleController{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private RoleService roleService;
	@Resource
	private PermissionService permissionService;
	
	@RequestMapping("/index")
	public String index(@RequestParam(value = "currentPage",defaultValue = "1") int currentPage,
		@RequestParam(value="pageNum",defaultValue="5") int pageNum,
		@RequestParam(value="condition",defaultValue="") String condition,Model model){
		Page<Role> page=new Page<Role>();
		page=roleService.find(currentPage, pageNum, condition);
		model.addAttribute(page);
		return "role/index";
	}
	
	@PostMapping(value="/getShowMassage/{id}",params="json")
	@ResponseBody
	public Map getShowMassage(@PathVariable int id) {
		Map map=new HashMap();
		Role role=roleService.getShowMassage(id);
		map.put("role",role);
		return map;
	}
	
	@PostMapping(value="/getUpdateMassage/{id}",params="json")
	@ResponseBody
	public Map getUpdateMassage(@PathVariable int id) {
		Map map=new HashMap();
		Role role=roleService.getShowMassage(id);
		List<Permission> pers=new ArrayList<Permission>();
		pers=permissionService.notList(role);
		map.put("pers",pers);
		map.put("role", role);
		return map;
	}
	
	@PostMapping(value="/updateForm",params="json")
	@ResponseBody
	public Map updateForm(Role role,@RequestParam("permission") int[] ids) {
		Map<String, Integer> map=new HashMap();
		int i=roleService.update(role,ids);
		if(i>0) {
			map.put("message",1);
		}else {
			map.put("message",0);
		}
		return map;
	}
	
	@PostMapping(value="/getAddMassage",params="json")
	@ResponseBody
	public Map getAddMassage() {
		Map map=new HashMap();
		map.put("pers",permissionService.list());
		return map;
	}
	
	@PostMapping(value="/addForm",params="json")
	@ResponseBody
	public Map addForm(Role role,@RequestParam("permission") int[] ids) {
		Map map = new HashMap();
		int i=roleService.add(role, ids);
		if(i>0) {
			map.put("message",1);
		}else {
			map.put("message",0);
		}
		return map;
	}
	
	@PostMapping(value="/delete/{id}",params="json")
	@ResponseBody
	public Map delete(@PathVariable("id") int id) {
		Map map=new HashMap();
		int i=roleService.delete(id);
		if(i>0) {
			map.put("message",1);
		}else {
			map.put("message",0);
		}
		return map;
	}
}
