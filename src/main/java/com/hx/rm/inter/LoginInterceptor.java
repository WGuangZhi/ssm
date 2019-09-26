package com.hx.rm.inter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.hx.rm.entity.User;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//进入控制器之前的拦截
		System.out.println("进入控制器之前的拦截==========");
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		if(user!=null) {
			return true;
		}else {
			request.getRequestDispatcher("/WEB-INF/jsp/login/login.jsp").forward(request, response);
		}
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//进入控制器之后的拦截
		System.out.println("进入控制器之后的拦截==========");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		//返回控制器之后
		System.out.println("返回控制器之后==========");
	}

}
