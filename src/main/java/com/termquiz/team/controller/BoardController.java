package com.termquiz.team.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.termquiz.team.common.PageNation;
import com.termquiz.team.service.BoardService;
import com.termquiz.team.vo.BoardVO;

@Controller
public class BoardController {
	@Autowired
	BoardService service;

	@RequestMapping(value = "/boardlist")
	public ModelAndView boardlist(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,PageNation maker) {
		maker.setSnoEno();
		
		mv.addObject("boardList", service.searchList(maker));
		maker.setTotalRowsCount((service.searchCount(maker)));

		mv.addObject("maker", maker);
		mv.setViewName("board/boardList");
	 return mv;
    	
	}//boardpagenation

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
	
	@RequestMapping(value = "/boardinsertf")
	public ModelAndView boardinsertf(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		mv.setViewName("/board/boardInsertf");
		return mv;
	}
	
	@RequestMapping(value = "/boardinsert", method = RequestMethod.POST)
	public ModelAndView boardinsert(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, BoardVO vo) {

		String uri = "boardinsertf";
		Date nowDate = new Date();
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd H:m:s");
		String today = (simple.format(nowDate)).toString();
	
		String bid = (String)request.getSession().getAttribute("nick");
		
		vo.setBid(bid);
		vo.setBtime(today);
		if(service.insert(vo) > 0) {
			uri = "redirect:boardlist";
		}		
	
		mv.setViewName(uri);
		return mv;
	}

}
