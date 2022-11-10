package com.termquiz.team.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.termquiz.team.service.BoardService;
import com.termquiz.team.vo.BoardVO;

@Controller
public class BoardController {
	@Autowired
	BoardService service;

	@RequestMapping(value = "/boardlist")
	public ModelAndView boardlist(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, BoardVO vo) {
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		list = service.selectList();
		
		if (list != null) {
			mv.addObject("board", list);
		}
		
		mv.setViewName("/board/boardList");
		return mv;
		
	}// boardlist

	@RequestMapping(value = "/boarddetail")
	public ModelAndView boarddetail(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, BoardVO vo) {
		
		String uri = "/board/boardDetail";
		int bno = Integer.parseInt((String)request.getParameter("bNo"));
		vo.setBno(bno);
		
		vo = service.selectOne(vo);
		
		if (vo != null) {

			String loginID = (String) request.getSession().getAttribute("loginID");
			if (!vo.getBid().equals(loginID) && !"U".equals(request.getParameter("jCode"))) {

				if (service.countUp(vo) > 0) {
					if (service.countUp(vo)>0) {vo.setBcount(vo.getBcount() + 1);}
				}

				if ("U".equals(request.getParameter("jCode"))) {
					uri = "/board/boardDetail";
				}

				mv.addObject("board", vo);

			} else {
				mv.addObject("message", "");
			}

		}
		mv.setViewName(uri);
		return mv;
	}

}
