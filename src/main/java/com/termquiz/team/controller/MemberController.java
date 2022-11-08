package com.termquiz.team.controller;

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

    	mv.setViewName("member/login");
    	return mv;
	}
	
	@RequestMapping(value = "/mlogin", method = RequestMethod.POST)
	public ModelAndView mlogin(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,MemberVO vo) {
        
//      request 처리
      String email = request.getParameter("email");
      String password = request.getParameter("password");
      String url = "member/login";
      
//      service 처리
      vo.setEmail(email);
      vo = service.selectOne(vo);

      if (vo != null) {   // email 확인
    	  System.out.println(vo.getNickname());
    	  if (passwordEncoder.matches(password, vo.getPassword())) {   // email이 일치하면 password 확인\
    		  request.getSession().setAttribute("loginID", email);
    		  request.getSession().setAttribute("loginPW", password);
    		  request.getSession().setAttribute("nick", vo.getNickname());
    		  request.getSession().setAttribute("admin", vo.isAdminRight());
    		  
    		  url = "home";
            
         } else {   // password 오류
        	 mv.addObject("message", "Password 오류");
         }
      } else {   // email 오류
    	  mv.addObject("message", "E-mail 오류");
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
		mv.addObject("message", "로그아웃 되었습니다");
		
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
		
		System.out.println(vo.getName());
		
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
	public ModelAndView mdefailf(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,MemberVO vo) {
		
		HttpSession session = request.getSession(false);
		
		if ( vo.getEmail()==null || vo.getEmail().length()<1 ) {
			// => parameter id 의 값이 없으면 session에서 가져온다.
			
			if ( session!=null && session.getAttribute("loginID")!=null ) 
				vo.setEmail((String)session.getAttribute("loginID")); 
			else {
				request.setAttribute("message", "=> 출력할 id 없음, 로그인후 이용하세요 ~~");
			    mv.setViewName("home");
			    return mv;
			}
			
		} //getParameter_else
		
		String uri = "/member/mDetail";
		
		// 2. Service 처리
		// => Service 에서 selectOne
		vo = service.selectOne(vo);
		if ( vo !=null ) {
			mv.addObject("user", vo);
			// ** Update 요청이면 updateForm.jsp 로
			if ( "U".equals(request.getParameter("jCode")))
				uri = "/member/updateForm";
		}else { // 없는 ID
			mv.addObject("message","~~ "+request.getParameter("id")+"님의 자료는 존재하지 않습니다 ~~");
		}
		mv.setViewName(uri);
		return mv;
	} //mdetail
	
	@RequestMapping(value = "/mdetailup", method = RequestMethod.POST)
	public ModelAndView mdetailup(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,MemberVO vo) {

		String uri = "/member/mDetail";
		
        vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		
		// 2. Service 처리
		if ( service.update(vo) > 0 ) {
			mv.addObject("message", "~~ 회원정보 수정 성공 ~~"); 
		    mv.addObject("user",vo); 
		}else {
			mv.addObject("message", "~~ 회원정보 수정 실패, 다시 하세요 ~~");
		}
		
    	mv.setViewName(uri);
    	return mv;
	}
	
	@RequestMapping(value = "/changepwf")
	public ModelAndView changepwf(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
    	mv.setViewName("member/changePW");
    	return mv;
	}
}
