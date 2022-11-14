package com.termquiz.team.mapperInterface;

import java.util.List;

import com.termquiz.team.vo.QuizVO;

public interface QuizMapper {
	List<QuizVO> quizList(QuizVO vo);

	List<QuizVO> loginQuizList(QuizVO vo);
}
