package com.hx.rm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hx.rm.entity.Permission;
import com.hx.rm.entity.User;
import com.hx.rm.service.PermissionService;
import com.hx.rm.service.UserService;
@Controller
@RequestMapping("/permission")
public class PermissionController{
	
	@Autowired
	private UserService userService;
	@Resource
	private PermissionService permissionService;
	//权限首页====》也做登录调过来的ModelAndV
	@RequestMapping("/index")//Stirng 为返回当视图，model为返回当模型，也就是HanlerAdatper,处理适配器返回对ModelAndView
	public String index(HttpServletRequest req,Model model){
		HttpSession session=req.getSession();
		User user=new User();
		user=(User) session.getAttribute("user");
		if(user!=null) {
			user=userService.getPermissionById(user.getId());
			model.addAttribute("user", user);
		}
		return "permission/index";
	}
	//分页查询====》mybatis分页器
	@RequestMapping("/list")
	public String list(
		@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
		@RequestParam(value="pageSize",defaultValue="5") int pageSize,Model model) {
		PageHelper.startPage(pageNum,pageSize);
		List<Permission> List=permissionService.list();
		PageInfo pageInfo = new PageInfo(List);
		model.addAttribute("pageInfo",pageInfo);
		return "permission/list";
	}
	//分页查询====》mybatis中分页器数据接口
	@RequestMapping(value="/list",params = "js")
	@ResponseBody
	public PageInfo list() {
		PageHelper.startPage(1,5);
		List<Permission> List=permissionService.list();
		PageInfo pageInfo = new PageInfo(List);
		System.out.println(pageInfo.getList());
		return pageInfo;
	}
	
	//查看====》通过ID查询
	@PostMapping("/show/{id}")
	@ResponseBody
	public Map show(@PathVariable int id) {
		Map map=new HashMap();
		Permission permission=permissionService.load(id);
		map.put("per",permission);
		return map;
	}
	//修改前工作==》获取值根据ID获取permission以及其父权限
	@GetMapping(value="/update/{id}")
	@ResponseBody
	public Map update(@PathVariable int id) {
		Map map=new HashMap();
		Permission per=permissionService.load(id);
		List<Permission> pers=new ArrayList<Permission>();
		pers=permissionService.listParent();
		map.put("pers",pers);
		map.put("per", per);
		return map; 
	}
	//执行修改
	@PostMapping(value="/update")
	@ResponseBody
	public Map update(Permission permission,String id) {
		Map map=new HashMap();
		int i=0;//permissionService.update(permission);
		if(id!=null&&!"".equals(id)) {
			permission.setId(Integer.valueOf(id));
			i=permissionService.update(permission);
			if(i>0) {
				map.put("message", 1);
			}else {
				map.put("message", 0);
			}
		}
		return map;
	}
	//增加前工作===过去父级权限列表
	@GetMapping(value="/add",params="json")
	@ResponseBody
	public Map add() {
		Map map=new HashMap();
		map.put("parentPers",permissionService.listParent());
		return map;
	}
	//执行增加
	@PostMapping("/add")
	@ResponseBody
	public Map add(@RequestBody Permission permission) {
		Map map=new HashMap();
		int i=0;
		//int i=permissionService.add(permission);
		if(i>0) {
			map.put("message", 1);
		}else{
			map.put("message", 0);
		}
		return map;
	}
	//删除执行
	@GetMapping(value="/delete/{id}",params="json")
	@ResponseBody
	public Map delete(@PathVariable int id) {
		Map map=new HashMap();
		int i=0;if(id>0) i=1;//测试前端使用
		//int i=permissionService.delete(id);
		if(i>0) {
			map.put("message",1);
		}else {
			map.put("message", 0);
		}
		return map;
	}
}
