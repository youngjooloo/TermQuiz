package com.termquiz.team.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.termquiz.team.common.PageNation;
import com.termquiz.team.service.MemberService;
import com.termquiz.team.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@Autowired
	JavaMailSenderImpl mailsender;

	PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	@RequestMapping(value = "/mloginf")
	public ModelAndView mloginf(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		String loginUrl = request.getParameter("loginUrl");
		if ("/".equals(loginUrl.substring(loginUrl.length()-1, loginUrl.length()))) {
			loginUrl = "home";
		}else {
			loginUrl = loginUrl.split("/")[loginUrl.split("/").length-1];
		}
		loginUrl = loginUrl.replaceAll("&relogin=1","");
		loginUrl = loginUrl.replaceAll("\\?relogin=1","");
		mv.addObject("loginUrl", loginUrl);
		mv.setViewName("member/login");
		return mv;
	}

	@RequestMapping(value = "/mlogin", method = RequestMethod.POST)
	public ModelAndView mlogin(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, RedirectAttributes rttr, MemberVO vo) {
//      request 처리
		String loginUrl = request.getParameter("loginUrl");
		String password = vo.getPassword();
		String url = "redirect:";
		if (loginUrl.contains("?")) {
			url = url + loginUrl+"&relogin=1";
		}else if (!loginUrl.contains("?")) {
			url = url + loginUrl+"?relogin=1";
		}
		
//      service 처리
		vo = service.selectOne(vo);

		if (vo != null) { // email 확인
			if (passwordEncoder.matches(password, vo.getPassword())) { // email이 일치하면 password 확인\
				request.getSession().setAttribute("loginID", vo.getEmail());
				request.getSession().setAttribute("nick", vo.getNickname());
				request.getSession().setAttribute("admin", vo.isAdminRight());
				request.getSession().setAttribute("level", vo.getMlevel());
				url = "redirect:"+loginUrl;
				rttr.addFlashAttribute("alertMessage", "로그인에 성공하였습니다");
			}else {
				rttr.addFlashAttribute("alertMessage2", "로그인에 실패하였습니다");
			}
		}else {
			rttr.addFlashAttribute("alertMessage2", "로그인에 실패하였습니다");
		}
		mv.setViewName(url);
		return mv;

	}

	@RequestMapping(value = "/mlogout")
	public ModelAndView mlogout(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, RedirectAttributes rttr) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
			rttr.addFlashAttribute("alertMessage", "로그아웃에 성공하였습니다");
		}else {
			rttr.addFlashAttribute("alertMessage2", "로그아웃에 실패하였습니다");
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
	public ModelAndView mjoin(HttpServletRequest request, HttpServletResponse response,RedirectAttributes rttr, ModelAndView mv, MemberVO vo) {

		String uri = "redirect:home";

		vo.setPassword(passwordEncoder.encode(vo.getPassword()));

		if (service.insert(vo) > 0) {
			rttr.addFlashAttribute("alertMessage", "회원가입에 성공하였습니다");
		} else {
			uri = "member/join";
			rttr.addFlashAttribute("alertMessage2", "회원가입에 실패하였습니다");
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
		vo.level();
		
		if (vo != null) {
			mv.addObject("user", vo);
			// ** Update 요청이면 updateForm.jsp 로
			if ("U".equals(request.getParameter("jCode")))
				uri = "/member/updateForm";
		}
		
		request.getSession().setAttribute("level", vo.getMlevel());
		mv.setViewName(uri);
		return mv;
	} // mdetail

	@RequestMapping(value = "/mdetailup", method = RequestMethod.POST)
	public ModelAndView mdetailup(HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr, ModelAndView mv,
			MemberVO vo) {

		String uri = "/member/mDetail";

		MemberVO vo2 = new MemberVO();
		vo2.setEmail(vo.getEmail());
		vo2 = service.selectOne(vo2);
		vo.setPassword(vo2.getPassword());
		
		// 2. Service 처리
		if (service.update(vo) > 0) {
			uri = "redirect:home";
			rttr.addFlashAttribute("alertMessage", "정보 수정에 성공하였습니다");
		}else {
			rttr.addFlashAttribute("alertMessage2", "정보 수정에 실패하였습니다");
		}

		mv.setViewName(uri);
		return mv;
	}

	@RequestMapping(value = "/changepwf")
	public ModelAndView changepwf(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		mv.setViewName("member/changePW");
		return mv;
	}
	
	@RequestMapping(value = "/changepw")
	public ModelAndView changepw(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,RedirectAttributes rttr, MemberVO vo) {
		vo.setEmail((String)request.getSession().getAttribute("loginID"));
		String oldPW = vo.getPassword();
		String newPW = (String)request.getParameter("newPassword");
		vo = service.selectOne(vo);
		String uri = "redirect:mdetail";
		
		if (passwordEncoder.matches(oldPW,vo.getPassword())) {
			vo.setPassword(passwordEncoder.encode(newPW));
			service.changePW(vo);
			rttr.addFlashAttribute("alertMessage", "비밀번호 변경에 성공하였습니다");
		}else {
			uri = "redirect:home";
			rttr.addFlashAttribute("alertMessage2", "비밀번호 변경에 실패하였습니다");
		}
		
		mv.setViewName(uri);
		return mv;
	}

//	@RequestMapping(value = "/emailcheck", method = RequestMethod.POST)
//	public ModelAndView emailcheck(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
//			MemberVO vo) {
//		mv = new ModelAndView("jsonView");
//		int dup = service.emailCheck(vo);
//		mv.addObject("dup", dup);
//		return mv;
//	}
//
//	@RequestMapping(value = "/nicknamecheck", method = RequestMethod.POST)
//	public ModelAndView nicknamecheck(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
//			MemberVO vo) {
//		mv = new ModelAndView("jsonView");
//		int dup = 0;
//		String check = (String)request.getSession().getAttribute("nick");
//		if (!check.equals(vo.getNickname())) {
//			dup = service.nicknameCheck(vo);
//		}
//		mv.addObject("dup", dup);
//		return mv;
//	}

	@RequestMapping(value = "/ranking")
	public ModelAndView ranking(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		mv.setViewName("member/ranking");
		return mv;
	}

	@RequestMapping(value = "/rankingajax")
	public ModelAndView rankingajax(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			MemberVO vo, PageNation maker) {
		List<MemberVO> list = new ArrayList<MemberVO>();
		service.scoreUpdate();
		String sortName = (String)request.getParameter("sortName");
		
		if (sortName != null) {
			maker.setSortName(sortName+"Score");
		} else {
			maker.setSortName("totalScore");
		}
		
		maker.setSnoEno();
		maker.setRowsPerPage(10);
		
		list = service.rankingSort(maker);

		maker.setTotalRowsCount((service.rankingCount(maker)));
		mv.addObject("maker", maker);
		
		if (list != null) {
			mv.addObject("member", list);
			mv.setViewName("member/rankingAjax");
		}else {
			mv.setViewName("home");
		}
		
		return mv;
	}

	@RequestMapping(value = "/memberlist")
	public ModelAndView memberlist(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			MemberVO vo) {

		List<MemberVO> list = new ArrayList<MemberVO>();
		service.scoreUpdate();
		list = service.selectList();

		if (list != null) {
			mv.addObject("member", list);
			mv.setViewName("member/memberlist");
		}else {
			mv.setViewName("home");
		}
		return mv;
	}
	
	
	@RequestMapping(value = "/findpwf")
	public ModelAndView findpwf(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		mv.setViewName("member/findPW");
		return mv;
	}

	@RequestMapping(value = "/sendverifynumber")
	public ModelAndView authPW(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, MemberVO vo, RedirectAttributes rttr,
			HttpSession session) throws Exception {
		
		String email = (String) request.getParameter("email");
		String name = (String) request.getParameter("name");

		vo = service.selectOne(vo);
		if (vo != null) {
			Random r = new Random();
			int checkNum = r.nextInt(899999)+100000; // 랜덤난수설정

			if (vo.getName().equals(name)) {

				session.setAttribute("email", vo.getEmail());

				String setfrom = ""; // naver
				String tomail = email; // 받는사람
				String title = "비밀번호변경 인증 이메일 입니다";
				String content = System.getProperty("line.separator") + "안녕하세요 회원님"
						+ System.getProperty("line.separator") + "비밀번호찾기(변경) 인증번호는 " + checkNum + " 입니다."
						+ System.getProperty("line.separator");

				try {
					MimeMessage message = mailsender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

					messageHelper.setFrom(setfrom);
					messageHelper.setTo(tomail);
					messageHelper.setSubject(title);
					messageHelper.setText(content);

					mailsender.send(message);
				} catch (Exception e) {
					rttr.addFlashAttribute("alertMessage2","이메일 발송에 실패했습니다");
				}
				
				mv.setViewName("member/authPW");
				session.setAttribute("checkNum", checkNum);

			} else {
				mv.setViewName("redirect:findpwf");
				rttr.addFlashAttribute("alertMessage2","이메일과 이름이 일치하지않습니다");
			}
		}else {
			mv.setViewName("redirect:findpwf");
			rttr.addFlashAttribute("alertMessage2","없는 이메일입니다");
		}
		return mv;
	}// 인증번호발송

	@RequestMapping(value = "/verifynumber", method = RequestMethod.POST)
	public String verifynumber(HttpServletRequest request,@RequestParam(value = "verifynumber") String verifynumber) throws IOException {
		String checkNum = request.getSession().getAttribute("checkNum").toString();
		if (verifynumber.equals(checkNum)) {
			return "member/newPW";
		} else {
			return "member/findPW";
		}
	} // 이메일 인증번호 확인

	@RequestMapping(value = "/passwordupdate", method = RequestMethod.POST)
	public ModelAndView passwordupdate(MemberVO vo, ModelAndView mv, HttpSession session, RedirectAttributes rttr,HttpServletRequest request) throws IOException {
		
		vo.setEmail((String)request.getSession().getAttribute("email"));	
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		if (service.changePW(vo) > 0) {
			mv.setViewName("redirect:home?relogin=1");
			rttr.addFlashAttribute("alertMessage", "비밀번호 변경에 성공하였습니다");
		} else {
			mv.setViewName("member/newPW");
			rttr.addFlashAttribute("alertMessage2", "비밀번호 변경에 실패하였습니다");
		}

		return mv;
	}
	
	@RequestMapping(value = "/mdeletef")
	public ModelAndView mdeletef(ModelAndView mv) throws Exception {
		mv.setViewName("member/memberDelete");
		return mv;
	}
	
	@RequestMapping(value = "/mdelete", method = RequestMethod.POST)
	public ModelAndView mdelete(HttpServletRequest request, HttpServletResponse response, MemberVO vo, ModelAndView mv, RedirectAttributes rttr) throws Exception {
		HttpSession session = request.getSession(false);
		String url = "redirect:home";
		
		String email = (String)request.getParameter("email");
		MemberVO vo2 = new MemberVO();
		vo2.setEmail(email);		
		vo2 = service.selectOne(vo2);
		
		if (vo != null) { // email 확인
			if (passwordEncoder.matches(vo.getPassword(), vo2.getPassword())) { 
				if (service.deleteMember(vo)>0) {
					if (session != null) {
						session.invalidate();
					}
					rttr.addFlashAttribute("alertMessage", "회원 탈퇴에 성공하였습니다");
				}else {
					url = "member/memberDelete";
					rttr.addFlashAttribute("alertMessage2", "회원 탈퇴에 실패하였습니다");
				}
			}else {
				url = "member/memberDelete";
				rttr.addFlashAttribute("alertMessage2", "회원 탈퇴에 실패하였습니다");
			}
		}else {
			url = "member/memberDelete";
			rttr.addFlashAttribute("alertMessage2", "회원 탈퇴에 실패하였습니다");
		}
		
		mv.setViewName(url);
		return mv;
	}
	
	@RequestMapping(value = "/mdeletea")
	public ModelAndView mdeletea(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, MemberVO vo, RedirectAttributes rttr) {
		String uri = "redirect:memberlist";
		HttpSession session = request.getSession(false);
		
		if (service.mdeletea(vo)>0) {
			if (session != null && "loginID".equals(vo.getEmail())) {
				session.invalidate();
			}
			rttr.addFlashAttribute("alertMessage", "회원 삭제에 성공하였습니다");
		}else {
			uri = "/member/memberlist";
			rttr.addFlashAttribute("alertMessage2", "회원 삭제에 실패하였습니다");
		}
		
		mv.setViewName(uri);
		return mv;
	}
	
	@RequestMapping(value = "/addadmin")
	public ModelAndView addadmin(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, RedirectAttributes rttr, MemberVO vo) {
		vo.setNickname((String)request.getParameter("nickname"));
		if(service.addAdmin(vo)>0) {
			rttr.addFlashAttribute("alertMessage", "관리자 변경에 성공하였습니다");
		}else {
			rttr.addFlashAttribute("alertMessage2", "관리자 변경에 실패하였습니다");
		}
		mv.setViewName("redirect:memberlist");
		return mv;
	}
	
	@RequestMapping(value = "/removeadmin")
	public ModelAndView removeadmin(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, RedirectAttributes rttr, MemberVO vo) {
		vo.setNickname((String)request.getParameter("nickname"));
		
		if(service.removeAdmin(vo)>0) {
			rttr.addFlashAttribute("alertMessage", "관리자 변경에 성공하였습니다");
		}else {
			rttr.addFlashAttribute("alertMessage2", "관리자 변경에 실패하였습니다");
		}
		
		mv.setViewName("redirect:memberlist");
		return mv;
	}
}