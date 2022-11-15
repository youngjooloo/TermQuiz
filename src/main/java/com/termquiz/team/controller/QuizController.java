package com.termquiz.team.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.termquiz.team.service.QuizService;
import com.termquiz.team.vo.QuizVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class QuizController {
	
	@Autowired
	QuizService service;
	
	@RequestMapping(value = "/moviequiz")
	public ModelAndView moviequiz(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, QuizVO vo) {
		String login = (String)request.getSession().getAttribute("nick");
		
		List<QuizVO> list = new ArrayList<QuizVO>();
		
		if (login != null) {
			vo.setMovieqId(login);
			list = service.loginQuizList(vo);
			System.out.println(list);
		}else {
			list = service.quizList(vo);
		}
		mv.addObject("movieq", list);
    	mv.setViewName("/quiz/movieQuizList");
    	return mv;
	}
	
	@RequestMapping(value = "/musicquiz")
	public ModelAndView musicquiz(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

    	mv.setViewName("/quiz/musicQuizList");
    	return mv;
	}

	@RequestMapping(value = "/quizdetail")
	public ModelAndView quizdetail(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		String type = (String)request.getParameter("type");
		
		if (type == "movie") {
			
		}else if(type == "music") {
			
		}
		
		mv.setViewName("/quiz/quizDetail");
		return mv;
	}
	

}
