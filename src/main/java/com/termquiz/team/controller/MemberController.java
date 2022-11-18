package com.termquiz.team.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.termquiz.team.service.MemberService;
import com.termquiz.team.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	MemberService service;

	PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	@RequestMapping(value = "/mloginf")
	public ModelAndView mloginf(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		String thisUrl = request.getParameter("thisUrl");
		mv.addObject("thisUrl", thisUrl);

		mv.setViewName("member/login");
		return mv;
	}

	@RequestMapping(value = "/mlogin", method = RequestMethod.POST)
	public ModelAndView mlogin(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, MemberVO vo) {

//      request 처리
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String thisUrl = request.getParameter("thisUrl");
		thisUrl = thisUrl.split("/")[thisUrl.split("/").length - 1];
		String url = "home";

		if (thisUrl == "team" || "team".endsWith(thisUrl)) {
			thisUrl = "home";
		}

		if (!thisUrl.contains("relogin")) {
			if (thisUrl.contains("?")) {
				url = "redirect:" + thisUrl + "&relogin=1";
			} else {
				url = "redirect:" + thisUrl + "?relogin=1";
			}
		}

//      service 처리
		vo.setEmail(email);
		vo = service.selectOne(vo);

		if (vo != null) { // email 확인
			if (passwordEncoder.matches(password, vo.getPassword())) { // email이 일치하면 password 확인\
				request.getSession().setAttribute("loginID", email);
				request.getSession().setAttribute("loginPW", password);
				request.getSession().setAttribute("nick", vo.getNickname());
				request.getSession().setAttribute("admin", vo.isAdminRight());
				url = "redirect:" + thisUrl;
			}
		}

		mv.setViewName(url);
		return mv;

	}

	@RequestMapping(value = "/mlogout")
	public ModelAndView mlogout(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}

		mv.setViewName("redirect:home");
		return mv;
	}

	@RequestMapping(value = "/mjoinf")
	public ModelAndView mjoinf(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		mv.setViewName("member/join");
		return mv;
	}

	@RequestMapping(value = "/mjoin", method = RequestMethod.POST)
	public ModelAndView mjoin(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, MemberVO vo) {

		String uri = "redirect:home";

		vo.setPassword(passwordEncoder.encode(vo.getPassword()));

		if (service.insert(vo) > 0) {
			mv.addObject("join", true);
		} else {
			uri = "member/join";
		}

		mv.setViewName(uri);
		return mv;
	}

	@RequestMapping(value = "/mdetail")
	public ModelAndView mdefailf(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			MemberVO vo) {

		HttpSession session = request.getSession(false);

		if (vo.getEmail() == null || vo.getEmail().length() < 1) {
			// => parameter id 의 값이 없으면 session에서 가져온다.

			if (session != null && session.getAttribute("loginID") != null)
				vo.setEmail((String) session.getAttribute("loginID"));
			else {
				mv.setViewName("home");
				return mv;
			}

		} // getParameter_else

		String uri = "/member/mDetail";

		// 2. Service 처리
		// => Service 에서 selectOne
		vo = service.selectOne(vo);
		if (vo != null) {
			mv.addObject("user", vo);
			// ** Update 요청이면 updateForm.jsp 로
			if ("U".equals(request.getParameter("jCode")))
				uri = "/member/updateForm";
		}
		mv.setViewName(uri);
		return mv;
	} // mdetail

	@RequestMapping(value = "/mdetailup", method = RequestMethod.POST)
	public ModelAndView mdetailup(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			MemberVO vo) {

		String uri = "/member/mDetail";

		MemberVO vo2 = new MemberVO();
		vo2.setEmail(vo.getEmail());
		vo2 = service.selectOne(vo2);
		vo.setPassword(vo2.getPassword());

		// 2. Service 처리
		if (service.update(vo) > 0) {
			mv.addObject("user", vo);
			uri = "redirect:mdetail";
		}

		mv.setViewName(uri);
		return mv;
	}

	@RequestMapping(value = "/changepwf")
	public ModelAndView changepwf(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		mv.setViewName("member/changePW");
		return mv;
	}

	@RequestMapping(value = "/emailcheck", method = RequestMethod.POST)
	public ModelAndView emailcheck(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			MemberVO vo) {

		mv = new ModelAndView("jsonView");

		int dup = service.emailCheck(vo);

		mv.addObject("dup", dup);

		return mv;
	}

	@RequestMapping(value = "/nicknamecheck", method = RequestMethod.POST)
	public ModelAndView nicknamecheck(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			MemberVO vo) {

		mv = new ModelAndView("jsonView");

		int dup = service.nicknameCheck(vo);

		mv.addObject("dup", dup);

		return mv;
	}

	@RequestMapping(value = "/ranking")
	public ModelAndView ranking(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		mv.setViewName("member/ranking");
		return mv;
	}

	@RequestMapping(value = "/memberlist")
	public ModelAndView memberlist(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		mv.setViewName("member/memberlist");
		return mv;
	}

	@RequestMapping(value = "/rankingajax")
	public ModelAndView rankingajax(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			MemberVO vo) {
		List<MemberVO> list = new ArrayList<MemberVO>();
		service.scoreUpdate(vo);
		String cname = (String)request.getParameter("cname");
		String adType = (String)request.getParameter("adType");
		
		
		if (cname != null) {
			vo.setCname(cname+"Score");
		} else {
			vo.setCname("totalScore");
		}

		if (adType != null) {
			vo.setAdType(adType);
		} else {
			vo.setAdType("desc");
		}

		list = service.rankingSort(vo);

		if (list != null) {
			mv.addObject("member", list);
			mv.setViewName("member/rankingAjax");
		}else {
			mv.setViewName("home");
		}
		System.out.println(list);
		

		return mv;
	}

	@RequestMapping(value = "/memberlistajax")
	public ModelAndView memberlistajax(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			MemberVO vo) {

		List<MemberVO> list = new ArrayList<MemberVO>();
		service.scoreUpdate(vo);
		list = service.selectList();

		if (list != null) {
			mv.addObject("member", list);
			mv.setViewName("member/memberlistAjax");
		}else {
			mv.setViewName("home");
		}

		return mv;

	}

}