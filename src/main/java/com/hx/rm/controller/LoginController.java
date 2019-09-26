package com.hx.rm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hx.rm.entity.User;
import com.hx.rm.exception.MyException;
import com.hx.rm.service.UserService;

@Controller
@RequestMapping("/login")
public class LoginController{
	@Autowired
	private UserService userService;
	//登录页面
	@RequestMapping("/login")
	public String login(){
		return "login/login";
	}
	//执行登录操作
	@RequestMapping("/loginForm")
	@ResponseBody
	public Map loginForm(User user,HttpServletRequest req){
		HttpSession session=req.getSession();
		User user1=userService.login(user);
		if(user1!=null) {
			session.setAttribute("user", user1);
			Map map=new HashMap();
			map.put("message",1);
			return map;
			//return "redirect:/permission/index";
		}else {
			throw new MyException("用户名或密码错误！！！！");
		}
	}
	//异常处理
	@ExceptionHandler(value= {MyException.class})//只能在当前类生效
	@ResponseBody
	public Map handlerException(MyException e) {
		Map map=new HashMap();
		map.put("e",e);
		return map;
	}
	@GetMapping("/loginOut")
	public String loginOut(HttpServletRequest req) {
		HttpSession session=req.getSession();
		session.removeAttribute("user");
		return "redirect:login";
	}
}
