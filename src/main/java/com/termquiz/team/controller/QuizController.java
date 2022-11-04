package com.termquiz.team.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class QuizController {
	
	@RequestMapping(value = "/moviequiz")
	public ModelAndView moviequiz(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

    	mv.setViewName("/quiz/quizList");
    	return mv;
	}
	
	@RequestMapping(value = "/musicquiz")
	public ModelAndView musicquiz(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

    	mv.setViewName("/quiz/quizList");
    	return mv;
	}
	
}
