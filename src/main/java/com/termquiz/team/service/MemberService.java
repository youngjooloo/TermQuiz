package com.termquiz.team.service;


import java.util.List;

import com.termquiz.team.vo.MemberVO;

public interface MemberService {

	int insert(MemberVO vo);

	MemberVO selectOne(MemberVO vo);

	int update(MemberVO vo);
	
	int emailCheck(MemberVO vo);

	int nicknameCheck(MemberVO vo);
	
	List<MemberVO> selectList();
	
	void scoreUpdate(MemberVO vo);
	
	List<MemberVO> rankingSort(MemberVO vo);
	
}