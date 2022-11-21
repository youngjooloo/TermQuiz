package com.termquiz.team.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter   {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(false);
		
		System.out.println(session.getAttribute("admin"));
		if (session!=null && session.getAttribute("nick")!=null) {
			return true;
		}else {
			request.setAttribute("message", "관리자가 아닙니다");
			response.sendRedirect("home");
			return false;
		}
	}
} //class
