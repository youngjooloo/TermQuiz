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
	
	void movieScoreUpdate();
	
	void musicScoreUpdate();
	
	void totalScoreUpdate();
	
	List<MemberVO> rankingSort(MemberVO vo);
	
	int addAdmin(MemberVO vo);

	int removeAdmin(MemberVO vo);
	
	int changePW(MemberVO vo);
	
	int deleteMember(MemberVO vo);
	
	int levelCheck(MemberVO vo);
}
