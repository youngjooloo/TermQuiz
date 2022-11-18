package com.termquiz.team.mapperInterface;

import java.util.List;

import com.termquiz.team.vo.MemberVO;

public interface MemberMapper {
	
	int insert(MemberVO vo);

	MemberVO selectOne(MemberVO vo);

	int update(MemberVO vo);
	
	int emailCheck(MemberVO vo);
	
	int nicknameCheck(MemberVO vo);
	
	List<MemberVO> selectList();
	
	void movieScoreUpdate(MemberVO vo);
	
	void musicScoreUpdate(MemberVO vo);
	
	void totalScoreUpdate(MemberVO vo);
	
	List<MemberVO> rankingSort(MemberVO vo);
}
