package com.termquiz.team.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.termquiz.team.service.MemberService;
import com.termquiz.team.vo.MemberVO;

@RestController
@RequestMapping("/rest")
public class CommonController {
	
	@Autowired
	MemberService service;
	
	@PostMapping(value = "/emailcheck")
	public String emailcheck(MemberVO vo) {
		int dup = service.emailCheck(vo);
		return dup+"";
	}

	@PostMapping(value = "/nicknamecheck")
	public String nicknamecheck(HttpServletRequest request, MemberVO vo) {
		String check = (String)request.getSession().getAttribute("nick");
		int dup = 0;
		if (!(vo.getNickname()).equals(check)) {
			dup = service.nicknameCheck(vo);
		}
		return dup+"";
	}
}
