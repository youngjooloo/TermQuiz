package com.termquiz.team.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.termquiz.team.service.MemberService;
import com.termquiz.team.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	@RequestMapping(value = "/mloginf")
	public ModelAndView mloginf(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

    	mv.setViewName("member/login");
    	return mv;
	}
	
	@RequestMapping(value = "/mlogin", method = RequestMethod.POST)
	public ModelAndView mlogin(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

    	mv.setViewName("redirect:home");
    	return mv;
	}
	
	@RequestMapping(value = "/mjoinf")
	public ModelAndView mjoinf(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

    	mv.setViewName("member/join");
    	return mv;
	}
	
	@RequestMapping(value = "/mjoin", method = RequestMethod.POST)
	public ModelAndView mjoin(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, MemberVO vo) {
		
		String uri = "redirect:home";
		
		System.out.println(vo.getName());
		
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		
		if (service.insert(vo) > 0) {
			mv.addObject("join", true);
		} else {
			uri = "member/join";
		}

		
    	mv.setViewName(uri);
    	return mv;
	}
}
