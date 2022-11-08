package com.termquiz.team.mapperInterface;

import com.termquiz.team.vo.MemberVO;

public interface MemberMapper {
	
	int insert(MemberVO vo);

	MemberVO selectOne(MemberVO vo);

	int update(MemberVO vo);
}
