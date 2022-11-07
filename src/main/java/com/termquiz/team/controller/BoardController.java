package com.termquiz.team.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@RequestMapping(value = "/boardlist")
	public ModelAndView boardList(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

    	mv.setViewName("/board/boardList");
    	return mv;
	}
	
	
	
}
