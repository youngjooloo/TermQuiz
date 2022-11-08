package com.termquiz.team.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.termquiz.team.service.QnaService;
import com.termquiz.team.vo.QnaVO;


@Controller
public class QnaController {
	
	@Autowired
	QnaService service;
	
	@RequestMapping(value = "/qnaboardlist")
	public ModelAndView qnaboardlist(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, QnaVO vo) {
		List<QnaVO> list = new ArrayList<QnaVO>();
		list = service.selectList();
		if (list != null) {
			mv.addObject("qna", list);
		}
		mv.setViewName("/qna/qnaBoardList");
		return mv;

	}// qnaboardlist

	@RequestMapping(value = "/qnadetail")
	public ModelAndView qnadetail(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, QnaVO vo) {

		String uri = "/qna/qnaDetail";
		int qno = Integer.parseInt((String)request.getParameter("qnaNo"));
		vo.setQnaNo(qno);
		
		vo = service.selectOne(vo);
		if (vo != null) {
			if ("U".equals(request.getParameter("jCode")))
				uri = "/qna/qnaupdate";
			mv.addObject("qna", vo);
		} else {
			mv.addObject("message", "~~ 글번호에 해당하는 자료가 없습니다. ~~");
		}

		mv.setViewName(uri);
		return mv;

	}// qnadetail
}
