package com.hx.rm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hx.rm.dao.RoleDao;
import com.hx.rm.dao.UserDao;
import com.hx.rm.entity.Page;
import com.hx.rm.entity.Role;
import com.hx.rm.entity.User;
import com.hx.rm.entity.UserInfo;
import com.hx.rm.service.RoleService;
import com.hx.rm.service.UserService;
import com.hx.rm.service.impl.RoleServiceImpl;
import com.hx.rm.service.impl.UserServiceImpl;

@RequestMapping("/user")
@Controller//springMVC中自动为多例，不用设置了
public class UserController{
	
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	
	
	/**
	 * @responseBody注解的作用是将controller的方法返回的对象通过适当的转换器转换为指定的格式之后，
	 * 写入到response对象的body区，通常用来返回JSON数据或者是XML
	 *数据，需要注意的呢，在使用此注解之后不会再走试图处理器，而是直接将数据写入到输入流中，
	 *它的效果等同于通过response对象输出指定格式的数据。
	 */
	@RequestMapping("/index")//返回一个页面的时候就不需要指定参数params="json"，以及@ResponseBody
	public String index(
		@RequestParam(value = "currentPage",defaultValue = "1") int currentPage,
		@RequestParam(value="pageNum",defaultValue="5") int pageNum,
		@RequestParam(value="condition",defaultValue="") String condition,Model model){
		Page<User> page=new Page<User>();
		page=userService.find(currentPage, pageNum, condition);
		model.addAttribute(page);
		return "user/index";
	}
	
	//查看用户消息
	@PostMapping(value="/getShowMassage/{id}",params="json")
	@ResponseBody
	public User getShowMassage(@PathVariable int id){
		User user=new User();
		user=userService.load(id);
		return user; 
	}
	//修改消息开始
	/*返回的是json数据    如果整个Controller里面的方法都是做json数据接口的话，
	 *那在类上可以加入@RestController 这个注解，
	 *因为这个注解包含了@Controller和@ResponseBody
	 */
	@PostMapping(value="/getUpdateMassage/{id}",params="json")
	@ResponseBody
	public Map getUpdateMassage(@PathVariable int id){
		User user=new User();
		Map map=new HashMap();
		List<Role> roles2=new ArrayList<Role>();
		user = userService.load(id);
		roles2 = roleService.notList(user);
		map.put("user", user);
		map.put("roles2", roles2);
		return map; 
	}
	@RequestMapping(value="/updateForm",params="json")
	@ResponseBody
	public Map updateForm(User user,@RequestParam int[] role) {
		Map map=new HashMap();
		int i=userService.update(user,role);
		map.put("message", i);
		return map;
	}
	
	//添加消息开始
	//获取角色消息
	@PostMapping(value="/getAddMassage",params="json")
	@ResponseBody
	public List<Role> getAddMassage(){
		List<Role> roles=new ArrayList<Role>();
		roles=roleService.list();
		return roles;
	}
	@PostMapping(value="/addForm",params="json")
	@ResponseBody
	public Map addForm(User user,@RequestParam int[] role){
		//User赋值
		int i=0;
		if(user.getUserName()!=null&!"".equals(user.getUserName())) {
			i=userService.add(user,role);
		}
		Map map=new HashMap();
		map.put("message", i);
		return map;
	}
	
	
	@PostMapping(value="/delete/{id}",params="json")
	@ResponseBody
	public Map delete(@PathVariable int id) {
		int userid=0;
		userid=userService.delete(id);
		Map map=new HashMap();
		map.put("message",userid);
		return map;
	}
	
	@RequestMapping("/test")
	public void pageTest() {
		PageHelper.startPage(1,5);
		List<User> List=userService.list();
		PageInfo pageInfo = new PageInfo(List);
		System.out.println(pageInfo);
	}
}
