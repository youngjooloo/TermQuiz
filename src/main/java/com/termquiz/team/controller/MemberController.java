package com.termquiz.team.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@RequestMapping(value = "/mloginf")
	public ModelAndView mloginf(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

    	mv.setViewName("member/login");
    	return mv;
	}
	
	@RequestMapping(value = "/mlogin")
	public ModelAndView mlogin(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

    	mv.setViewName("redirect:home");
    	return mv;
	}
	
	@RequestMapping(value = "/mjoinf")
	public ModelAndView mjoinf(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

    	mv.setViewName("member/join");
    	return mv;
	}
	
	@RequestMapping(value = "/mjoin")
	public ModelAndView mjoin(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

    	mv.setViewName("redirect:home");
    	return mv;
	}
}
