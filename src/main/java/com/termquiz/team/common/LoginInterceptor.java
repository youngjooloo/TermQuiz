package com.termquiz.team.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter   {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(false);
		
		if (session!=null && session.getAttribute("nick")!=null) {
			return true;
		}else {
			session = request.getSession();
			session.setAttribute("alertMessage2", "로그인 후 이용하세요");

			response.sendRedirect("home");
			return false;
		}
	}
} //class
