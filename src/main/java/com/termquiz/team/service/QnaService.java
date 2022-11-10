package com.termquiz.team.service;

import java.util.List;

import com.termquiz.team.vo.QnaVO;

public interface QnaService {

	List<QnaVO> selectList();

	QnaVO selectOne(QnaVO vo);
	
	int insert(QnaVO vo);
	
	int qnaAnswer(QnaVO vo);

	int qnaAnswerDelete(QnaVO vo);
}