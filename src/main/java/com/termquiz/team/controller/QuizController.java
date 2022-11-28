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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.termquiz.team.service.QuizService;
import com.termquiz.team.vo.MovieQuizVO;
import com.termquiz.team.vo.MusicQuizVO;
import com.termquiz.team.vo.QuizVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class QuizController {

	@Autowired
	QuizService service;

	@RequestMapping(value = "/moviequiz")
	public ModelAndView moviequiz(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			MovieQuizVO vo) {
		String login = (String) request.getSession().getAttribute("nick");

		List<MovieQuizVO> list = new ArrayList<MovieQuizVO>();

		if (login != null) {
			vo.setMovieqId(login);
			list = service.movieLoginQuizList(vo);
		} else {
			list = service.movieQuizList(vo);
		}
		mv.addObject("movieq", list);
		mv.setViewName("/quiz/movieQuizList");
		return mv;
	}

	@RequestMapping(value = "/musicquiz")
	public ModelAndView musicquiz(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			MusicQuizVO vo) {
		String login = (String) request.getSession().getAttribute("nick");

		List<MusicQuizVO> list = new ArrayList<MusicQuizVO>();

		if (login != null) {
			vo.setMusicqId(login);
			list = service.musicLoginQuizList(vo);
		} else {
			list = service.musicQuizList(vo);
		}

		mv.addObject("musicq", list);
		mv.setViewName("/quiz/musicQuizList");
		return mv;
	}

	@RequestMapping(value = "/quizdetail")
	public ModelAndView quizdetail(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			QuizVO vo) {
		String type = (String) request.getParameter("type");
		int qno = Integer.parseInt((String) request.getParameter("qNo"));

		if (type == "movie" || "movie".equals(type)) {
			MovieQuizVO vo2 = new MovieQuizVO();
			vo2.setMovieqNo(qno);
			vo2 = service.movieQuizDetail(vo2);

			vo.setAnswer(vo2.getMovieqAnswer());
			vo.setHint1(vo2.getMovieqHint1());
			vo.setHint2(vo2.getMovieqHint2());
			vo.setHint3(vo2.getMovieqHint3());
			vo.setHint4(vo2.getMovieqHint4());
			vo.setHint5(vo2.getMovieqHint5());
			mv.addObject("quiz", vo);
		} else if (type == "music" || "music".equals(type)) {
			MusicQuizVO vo2 = new MusicQuizVO();
			vo2.setMusicqNo(qno);
			vo2 = service.musicQuizDetail(vo2);
			
			vo.setAnswer(vo2.getMusicqAnswer());
			vo.setHint1(vo2.getMusicqHint1());
			vo.setHint2(vo2.getMusicqHint2());
			vo.setHint3(vo2.getMusicqHint3());
			vo.setHint4(vo2.getMusicqHint4());
			vo.setHint5(vo2.getMusicqHint5());
			mv.addObject("quiz", vo);
		} else {
		}

		mv.setViewName("/quiz/quizDetail");
		return mv;
	}

	@RequestMapping(value = "/quizafter")
	public ModelAndView quizafter(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			QuizVO vo) {
		String type = (String) request.getParameter("type");
		int qno = Integer.parseInt((String) request.getParameter("qNo"));

		if (type == "movie" || "movie".equals(type)) {
			MovieQuizVO vo2 = new MovieQuizVO();
			vo2.setMovieqNo(qno);
			vo2 = service.movieQuizDetail(vo2);

			vo.setAnswer(vo2.getMovieqAnswer());
			vo.setHint1(vo2.getMovieqHint1());
			vo.setHint2(vo2.getMovieqHint2());
			vo.setHint3(vo2.getMovieqHint3());
			vo.setHint4(vo2.getMovieqHint4());
			vo.setHint5(vo2.getMovieqHint5());
			mv.addObject("quiz", vo);
		} else if (type == "music" || "music".equals(type)) {
			MusicQuizVO vo2 = new MusicQuizVO();
			vo2.setMusicqNo(qno);
			vo2 = service.musicQuizDetail(vo2);

			vo.setAnswer(vo2.getMusicqAnswer());
			vo.setHint1(vo2.getMusicqHint1());
			vo.setHint2(vo2.getMusicqHint2());
			vo.setHint3(vo2.getMusicqHint3());
			vo.setHint4(vo2.getMusicqHint4());
			vo.setHint5(vo2.getMusicqHint5());
			mv.addObject("quiz", vo);
		} else {
		}

		mv.setViewName("/quiz/quizAfter");
		return mv;
	}

	@RequestMapping(value = "/quizuploadf")
	public ModelAndView quizuploadf(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		mv.setViewName("/quiz/quizUpload");
		return mv;
	}

	@RequestMapping(value = "/quizupload", method = RequestMethod.POST)
	public ModelAndView quizupload(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, QuizVO vo, RedirectAttributes rttr)
			throws IOException {

		String realPath = request.getSession().getServletContext().getRealPath("/");

		String type = vo.getQuizType();
		int quizNo = 1;
		if ("movie".equals(type)) {
			if (service.movieMaxNo() > 0) {
				quizNo = service.movieMaxNo() + 1;
			}
		} else if ("music".equals(type)) {
			if (service.musicMaxNo() > 0) {
				quizNo = service.musicMaxNo() + 1;
			}
		}

		String hintPath = type + quizNo;

		if (realPath.contains("wtpwebapps")) {
			realPath = "E:\\HiKim\\back\\MyWork\\TeamTermQuiz\\src\\main\\webapp\\resources\\quizhint\\" + type + "\\"
					+ hintPath + "\\";
		} else {
			realPath += "resources\\quizhint\\" + type + "\\" + hintPath + "\\";
		}

		File f1 = new File(realPath);
		if (!f1.exists()) {
			f1.mkdir();
		}

		MultipartFile[] hintUp = new MultipartFile[5];

		hintUp[0] = vo.getHint1up();
		hintUp[1] = vo.getHint2up();
		hintUp[2] = vo.getHint3up();
		hintUp[3] = vo.getHint4up();
		hintUp[4] = vo.getHint5up();

		String[] hint = new String[5];
		String[] hintUrl = new String[5];

		for (int i = 0; i < hintUrl.length; i++) {
			hintUrl[i] = "resources/quizhint/" + type + "/" + hintPath + "/";
		}

		for (int i = 0; i < hintUrl.length; i++) {
			if (hintUp[i] != null && !hintUp[i].isEmpty()) {
				hint[i] = realPath + hintUp[i].getOriginalFilename(); // 경로완성
				hintUp[i].transferTo(new File(hint[i])); // Image저장
				hintUrl[i] = "resources/quizhint/" + type + "/" + hintPath + "/" + hintUp[i].getOriginalFilename();
			}
		}
		vo.setHint1(hintUrl[0]);
		vo.setHint2(hintUrl[1]);
		vo.setHint3(hintUrl[2]);
		vo.setHint4(hintUrl[3]);
		vo.setHint5(hintUrl[4]);

		if (type == "movie" || "movie".equals(type)) {
			if (service.movieQuizInsert(vo) > 0) {
				rttr.addFlashAttribute("alertMessage", "영화 퀴즈 업로드에 성공하였습니다");
			}else {
				rttr.addFlashAttribute("alertMessage2", "영화 퀴즈 업로드에 실패하였습니다");
			}
		} else if (type == "music" || "music".equals(type)) {
			if (service.musicQuizInsert(vo) > 0) {
				rttr.addFlashAttribute("alertMessage", "음악 퀴즈 업로드에 성공하였습니다");
			}else {
				rttr.addFlashAttribute("alertMessage2", "음악 퀴즈 업로드에 실패하였습니다");
			}
		}

		mv.setViewName("redirect:home");
		return mv;
	}

	@RequestMapping(value = "/quizanswer")
	public ModelAndView quizanswer(HttpServletRequest request, HttpServletResponse response, ModelAndView mv ) {
		mv = new ModelAndView("jsonView");
		String id = (String) request.getSession().getAttribute("nick");
		String type = (String) request.getParameter("quizType");
		int quizNo = Integer.parseInt((String)request.getParameter("quizNo"));
		int score = Integer.parseInt((String)request.getParameter("score"));
		boolean correct = "true".equals((String)request.getParameter("quizCorrect"));
		if (!correct) {
			score = 1;
		}
		
		if ("movie".equals(type)) {
			MovieQuizVO vo = new MovieQuizVO();
			vo.setMovieqId(id);
			vo.setMovieqNo(quizNo);
			vo.setScore(score);
			if (service.movieScore(vo)>0) {
				service.movieScoreUpdate(vo);
			} else {
				service.movieScoreInsert(vo);
			}
		}else if("music".equals(type)) {
			MusicQuizVO vo = new MusicQuizVO();
			vo.setMusicqId(id);
			vo.setMusicqNo(quizNo);
			vo.setScore(score);
			if (service.musicScore(vo) > 0) {
				service.musicScoreUpdate(vo);
			} else {
				service.musicScoreInsert(vo);
			}
		}
		mv.setViewName("home");
		return mv;
	}
	
	@RequestMapping(value = "/quizdelete")
	public ModelAndView quizdelete(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, RedirectAttributes rttr) {
		String type = (String)request.getParameter("type");
		int qno = Integer.parseInt((String)request.getParameter("qNo"));
		String uri = "home";
		String path = "";
		boolean delete = false;
		if ("movie".equals(type)) {
			MovieQuizVO vo = new MovieQuizVO();
			vo.setMovieqNo(qno);
			uri = "redirect:moviequiz";
			path = "resources/quizhint/movie/movie"+qno;
			if (service.movieQuizDelete(vo)>0) {
				delete = true;
			}
		}else if("music".equals(type)){
			MusicQuizVO vo = new MusicQuizVO();
			vo.setMusicqNo(qno);
			uri = "redirect:musicquiz";
			path = "resources/quizhint/music/music"+qno;
			if (service.musicQuizDelete(vo)>0) {
				delete = true;
			}
		}
		
		if (delete) {
			rttr.addAttribute("alertMessage", "퀴즈 삭제에 성공하였습니다");

			File folder = new File(path);
			try {
				while(folder.exists()) {
					File[] folder_list = folder.listFiles(); //파일리스트 얻어오기
							
					for (int i = 0; i < folder_list.length; i++) {
						folder_list[i].delete(); //파일 삭제 
					}
					if(folder_list.length == 0 && folder.isDirectory()){ 
						folder.delete(); //대상폴더 삭제
					}
				}
			}catch(Exception e) {
				e.getStackTrace();
			}
		}else {
			rttr.addAttribute("alertMessage2", "퀴즈 삭제에 실패하였습니다");
		}
		
		
		mv.setViewName(uri);
		return mv;
	}

}
