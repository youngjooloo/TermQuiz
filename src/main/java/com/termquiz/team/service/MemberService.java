package com.termquiz.team.service;

import com.termquiz.team.vo.MemberVO;

public interface MemberService {

	int insert(MemberVO vo);

	MemberVO selectOne(MemberVO vo);

	int update(MemberVO vo);

}