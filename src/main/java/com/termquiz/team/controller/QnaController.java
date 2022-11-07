package com.termquiz.team.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QnaController {
	
	@RequestMapping(value = "/qnaboardlist")
	public ModelAndView qnaBoardList(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

    	mv.setViewName("/board/qnaBoardList");
    	return mv;
	}
	
	@RequestMapping(value = "/qnadetail")
	public ModelAndView qnadetail(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

    	mv.setViewName("/board/qnaDetail");
    	return mv;
	}
}
