package com.termquiz.team.service;

import java.util.List;

import com.termquiz.team.vo.QuizVO;

public interface QuizService {
	List<QuizVO> quizList(QuizVO vo);

	List<QuizVO> loginQuizList(QuizVO vo);
}
