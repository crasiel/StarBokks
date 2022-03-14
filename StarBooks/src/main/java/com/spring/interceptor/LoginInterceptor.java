package com.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String requestURL = request.getRequestURL().toString();
		boolean flag = true;
		System.out.println("preHandle : " + requestURL);
		
		HttpSession session = request.getSession();
		if(session.getAttribute("login") == null) {
			System.out.println(false);
			response.sendRedirect(request.getContextPath() + "/member/login?url=" + requestURL);
			return false;
		}

		System.out.println(true);
		return true;
	}
}
