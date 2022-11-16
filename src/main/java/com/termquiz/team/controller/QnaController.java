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
import com.termquiz.team.service.QnaService;
import com.termquiz.team.vo.QnaVO;


@Controller
public class QnaController {
	
	@Autowired
	QnaService service;
	
	@RequestMapping(value = "/qnaboardlist")
	public ModelAndView qnaboardlist(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,PageNation maker) {
		maker.setSnoEno();
		if(request.getParameter("rowsPerPage") != null) {
			int rpp = Integer.parseInt(request.getParameter("rowsPerPage"));
			maker.setRowsPerPage(rpp);
		}
		
		mv.addObject("qna", service.searchList(maker));
		maker.setTotalRowsCount((service.searchCount(maker)));

		mv.addObject("maker", maker);
		mv.setViewName("qna/qnaBoardList");
	 return mv;
    	
	}//qnapagenation

	@RequestMapping(value = "/qnadetail")
	public ModelAndView qnadetail(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, QnaVO vo) {

		String uri = "/qna/qnaDetail";
		int qno = Integer.parseInt((String)request.getParameter("qnaNo"));
		vo.setQnaNo(qno);
		
		vo = service.selectOne(vo);
		
		if (vo != null) {
			mv.addObject("qna", vo);
		
			if ("U".equals(request.getParameter("jCode"))){
				uri = "qna/qnaUpdate";
			}
		} else {
			uri = "qnaboardlist";
		}

		mv.setViewName(uri);
		return mv;

	}// qnadetail
	
	@RequestMapping(value = "/qnainsertf")
	public ModelAndView qnainsertf(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		mv.setViewName("/qna/qnaInsertf");
		return mv;
	}
	
	@RequestMapping(value = "/qnainsert", method = RequestMethod.POST)
	public ModelAndView qnainsert(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, QnaVO vo) {

		String uri = "qnainsertf";
		Date nowDate = new Date();
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		String today = (simple.format(nowDate)).toString();
	
		String qnaId = (String)request.getSession().getAttribute("nick");
		
		vo.setQnaId(qnaId);
		vo.setQnaTime(today);
		
		String content = vo.getQnaContent().replace("\r\n","<br>");
		vo.setQnaContent(content);
		
		if(service.insert(vo) > 0) {
			uri = "redirect:qnaboardlist";
		}		
		
		mv.setViewName(uri);
		return mv;
	}
	
	@RequestMapping(value = "/qnaanswer")
	public ModelAndView qnaanswer(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, QnaVO vo) {

		String uri = "qnadetail";
		
		vo.setQnaNo(Integer.parseInt((String)request.getParameter("qnaNo")));
		
		String content = vo.getQnaAnswer().replace("\r\n","<br>");
		vo.setQnaAnswer(content);
		
		if( service.qnaAnswer(vo) > 0) {
			uri = "redirect:qnadetail?qnaNo="+vo.getQnaNo();
		}
		
		mv.setViewName(uri);
		return mv;
	}
	
	@RequestMapping(value = "/qnaanswerdelete")
	public ModelAndView qnaanswerdelete(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, QnaVO vo) {
		
		vo.setQnaNo(Integer.parseInt((String)request.getParameter("qnaNo")));
		String uri = "redirect:qnadetail?qnaNo="+vo.getQnaNo();

		service.qnaAnswerDelete(vo);
		
		mv.setViewName(uri);
		return mv;
	}
	
	@RequestMapping(value = "/qnaupdate", method = RequestMethod.POST)
	public ModelAndView qnaupdate(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, QnaVO vo) {

		String uri = "qna/qnaUpdate";
		
		QnaVO vo2 = new QnaVO();
		vo2.setQnaNo(vo.getQnaNo());
		service.selectOne(vo2);
		vo2.setQnaTitle(vo.getQnaTitle());
		vo2.setQnaContent(vo.getQnaContent());
		
		if(service.qnaUpdate(vo2)>0) {
			uri = "redirect:qnadetail?qnaNo="+vo.getQnaNo();
		}
		
		mv.setViewName(uri);
		return mv;
	}
	
	@RequestMapping(value = "/qnadelete")
	public ModelAndView qnadelete(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, QnaVO vo) {
		
		String uri = "qna/qnadetail";

	    int qno=Integer.parseInt((String)request.getParameter("qnaNo"));
	    vo.setQnaNo(qno);
	      
	    if(service.qnadelete(vo)>0) {
	    	uri = "redirect:qnaboardlist";
	    }

	    mv.setViewName(uri);
	    return mv;
	}
}
