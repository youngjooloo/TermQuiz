package com.termquiz.team.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.termquiz.team.common.PageNation;
import com.termquiz.team.service.BoardService;
import com.termquiz.team.vo.BoardCommentsVO;
import com.termquiz.team.vo.BoardVO;

@Controller
public class BoardController {
	@Autowired
	BoardService service;

	@RequestMapping(value = "/boardlist")
	public ModelAndView boardlist(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,PageNation maker) {
		maker.setSnoEno();
		
		if(request.getParameter("rowsPerPage") != null) {
			int rpp = Integer.parseInt(request.getParameter("rowsPerPage"));
			maker.setRowsPerPage(rpp);
		}
		
		mv.addObject("boardList", service.searchList(maker));
		maker.setTotalRowsCount((service.searchCount(maker)));

		mv.addObject("maker", maker);
		mv.setViewName("board/boardList");
	 return mv;
    	
	}//boardpagenation

	@RequestMapping(value = "/boarddetail")
	public ModelAndView boarddetail(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, BoardVO vo,BoardCommentsVO cvo) {
		
		String uri = "/board/boardDetail";
		int bno = Integer.parseInt((String)request.getParameter("bno"));
		vo.setBno(bno);
		vo = service.selectOne(vo);
		
		if (vo != null) {
			String nick = (String) request.getSession().getAttribute("nick");
		
			if (!vo.getBid().equals(nick) && !"U".equals(request.getParameter("jCode"))) {
				if (service.countUp(vo)>0) {
					vo.setBcount(vo.getBcount() + 1);
				}
			} 
			if ("U".equals(request.getParameter("jCode"))) {
				uri = "/board/boardUpdate";
			}
			mv.addObject("board", vo);
			
			cvo.setBno(vo.getBno());
			
			List<BoardCommentsVO> cvoList = new ArrayList<BoardCommentsVO>();
			
			cvoList = service.commentList(cvo);
			
			mv.addObject("commentList",cvoList);
			System.out.println(cvo);
			
		} else {
			mv.addObject("message", "");
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
	
	@RequestMapping(value = "/boardupdate", method = RequestMethod.POST)
	public ModelAndView boardupdate(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, BoardVO vo) {
		String uri = "board/boardUpdate";

		int bno = Integer.parseInt((String)request.getParameter("bno"));
		vo.setBno(bno);
		mv.addObject("board", vo);
		if (service.update(vo) > 0) {
			mv.addObject("message", "~~ 글 수정 성공 ~~");
			uri = "redirect:boarddetail?bno=" + vo.getBno();
		} else {
			mv.addObject("message", "~~ 글 수정 실패, 다시 하세요 ~~");
		}

		mv.setViewName(uri);
		return mv;
	}

	@RequestMapping(value = "/boarddelete")
	public ModelAndView boarddelete(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, BoardVO vo, RedirectAttributes rttr) {
		
		String uri = "redirect:/boardlist";
		int bno = Integer.parseInt((String)request.getParameter("bno"));
		vo.setBno(bno);
		
		if (service.delete(vo) > 0) {
			rttr.addFlashAttribute("message", "~~ 글 삭제 성공 ~~");
		} else {
			rttr.addFlashAttribute("message", "~~ 글 삭제 실패, 다시 시도하세요 ~~");
			uri = "redirect:/boarddetail?bno=" + vo.getBno();
		}
		
		mv.setViewName(uri);
		return mv;
	}
	
	@RequestMapping(value="/rinsert", method=RequestMethod.POST)
	public ModelAndView rinsert(HttpServletRequest request,
			HttpServletResponse response, ModelAndView mv, RedirectAttributes rttr, BoardCommentsVO cvo) {
		
		String uri = "board/boardList";
		int bno = Integer.parseInt((String)request.getParameter("bno"));
		cvo.setBno(bno);
		cvo.setBcId((String)request.getSession().getAttribute("nick"));
		
		Date nowDate = new Date();
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd H:m:s");
		String today = (simple.format(nowDate)).toString();
		cvo.setBcommentTime(today);
		
		// 2. Service 처리
		if ( service.rinsert(cvo)>0 ) {
			rttr.addFlashAttribute("message", "댓글 등록 성공");
			uri="redirect:boarddetail?bno="+cvo.getBno();
		}else {
			mv.addObject("message", "댓글 등록 실패, 다시 시도하세요.");
		}
		
		// 3. 결과(ModelAndView) 전달 
		mv.setViewName(uri);
		return mv;
	} //rinsert	

}
