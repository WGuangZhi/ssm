//package com.hx.rm.test;
//
//
//import java.util.List;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import com.hx.rm.entity.User;
//import com.hx.rm.service.UserService;
//
////@RunWith这个注解只有在导包了之后才有
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
//public class UserTest {
//	@Autowired
//	private UserService userService;
//	@Test
//	public void uTest() {
//		List<User> users=userService.list();
//		System.out.println(userService.load(1));
//	}
//}