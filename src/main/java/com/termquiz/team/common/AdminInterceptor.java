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
		
		if (session!=null && session.getAttribute("nick")!=null) {
			return true;
		}else {
			session.setAttribute("alertMessage", "관리자만 이용 가능합니다");
			
			response.sendRedirect("home");
			return false;
		}
	}
} //class
