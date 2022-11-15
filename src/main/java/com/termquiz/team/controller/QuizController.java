package com.termquiz.team.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.termquiz.team.service.QuizService;
import com.termquiz.team.vo.MovieQuizVO;
import com.termquiz.team.vo.QuizVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class QuizController {
	
	@Autowired
	QuizService service;
	
	@RequestMapping(value = "/moviequiz")
	public ModelAndView moviequiz(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, MovieQuizVO vo) {
		String login = (String)request.getSession().getAttribute("nick");
		
		List<MovieQuizVO> list = new ArrayList<MovieQuizVO>();
		
		if (login != null) {
			vo.setMovieqId(login);
			list = service.movieLoginQuizList(vo);
			System.out.println(list);
		}else {
			list = service.movieQuizList(vo);
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
		int qno = Integer.parseInt((String)request.getParameter("qNo"));
		
		if (type == "movie" || "movie".equals(type)) {
			MovieQuizVO vo = new MovieQuizVO();
			vo.setMovieqNo(qno);
			vo = service.movieQuizDetail(vo);
			mv.addObject("quiz", vo);
		}else if(type == "music" || "music".equals(type)) {
			
		}else {
			
		}
		
		mv.setViewName("/quiz/quizDetail");
		return mv;
	}
	
	@RequestMapping(value = "/quizuploadf")
	public ModelAndView quizuploadf(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

    	mv.setViewName("/quiz/quizUpload");
    	return mv;
	}
	
	@RequestMapping(value = "/quizupload", method = RequestMethod.POST)
	public ModelAndView quizupload(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, QuizVO vo) throws IOException{
		
		String realPath = request.getSession().getServletContext().getRealPath("/"); 
	
		String type = vo.getQuizType();
		int quizNo = 1;
		if (type == "movie") {
			if (service.movieMaxNo()>0) {
				quizNo = service.movieMaxNo() + 1;
			}
		}else if(type == "music") {
		}
		
		String hintPath = type+quizNo;
		
		
		if (realPath.contains("wtpwebapps")) {
			realPath = "E:\\HiKim\\back\\MyWork\\TeamTermQuiz\\src\\main\\webapp\\resources\\quizhint\\" + type + "\\" + hintPath + "\\";
		}else {
			realPath += "resources\\quizhint\\" + type + "\\" + hintPath + "\\";
		}
		
		File f1 = new File(realPath);
		if (!f1.exists()) {
			f1.mkdir();
			
		}
		
		MultipartFile hint1up = vo.getHint1up();
		MultipartFile hint2up = vo.getHint2up();
		MultipartFile hint3up = vo.getHint3up();
		MultipartFile hint4up = vo.getHint4up();
		MultipartFile hint5up = vo.getHint5up();
		
		String hint1;
		String hint2;
		String hint3;
		String hint4;
		String hint5;

		String hint1url = "resources/quizhint/" + type + "/" + hintPath + "/";
		String hint2url = "resources/quizhint/" + type + "/" + hintPath + "/";
		String hint3url = "resources/quizhint/" + type + "/" + hintPath + "/";
		String hint4url = "resources/quizhint/" + type + "/" + hintPath + "/";
		String hint5url = "resources/quizhint/" + type + "/" + hintPath + "/";
		
		if (hint1up != null && !hint1up.isEmpty()) {
			hint1 = realPath + hint1up.getOriginalFilename(); // 경로완성
			hint1up.transferTo(new File(hint1)); // Image저장
			hint1url = "resources/quizhint/" + type + "/" + hintPath + "/" + hint1up.getOriginalFilename();
		}
		vo.setHint1(hint1url);
		
		if (hint2up != null && !hint2up.isEmpty()) {
			hint2 = realPath + hint2up.getOriginalFilename(); // 경로완성
			hint2up.transferTo(new File(hint2)); // Image저장
			hint2url = "resources/quizhint/" + type + "/" + hintPath + "/" + hint2up.getOriginalFilename();
		}
		vo.setHint2(hint2url);
		
		if (hint3up != null && !hint3up.isEmpty()) {
			hint3 = realPath + hint3up.getOriginalFilename(); // 경로완성
			hint3up.transferTo(new File(hint3)); // Image저장
			hint3url = "resources/quizhint/" + type + "/" + hintPath + "/" + hint3up.getOriginalFilename();
		}
		vo.setHint3(hint3url);
		
		if (hint4up != null && !hint4up.isEmpty()) {
			hint4 = realPath + hint4up.getOriginalFilename(); // 경로완성
			hint4up.transferTo(new File(hint4)); // Image저장
			hint4url = "resources/quizhint/" + type + "/" + hintPath + "/" + hint4up.getOriginalFilename();
		}
		vo.setHint4(hint4url);
		
		if (hint5up != null && !hint5up.isEmpty()) {
			hint5 = realPath + hint5up.getOriginalFilename(); // 경로완성
			hint5up.transferTo(new File(hint5)); // Image저장
			hint5url = "resources/quizhint/" + type + "/" + hintPath + "/" + hint5up.getOriginalFilename();
		}
		vo.setHint5(hint5url);
		
		if (type == "movie" || "movie".equals(type)) {
			if (service.movieQuizInsert(vo)>0) {
			} 
		}else {
//			MusicQuizVO vo2 = service.musicQuizInsert(vo);
//			mv.addObject("quiz", vo2);
		}
		
    	mv.setViewName("redirect:home");
    	return mv;
	}

}
