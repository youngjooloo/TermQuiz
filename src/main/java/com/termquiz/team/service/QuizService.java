package com.termquiz.team.service;

import java.util.List;

import com.termquiz.team.vo.MovieQuizVO;
import com.termquiz.team.vo.QuizVO;

public interface QuizService {
	List<MovieQuizVO> movieQuizList(MovieQuizVO vo);

	List<MovieQuizVO> movieLoginQuizList(MovieQuizVO vo);
	
	int movieMaxNo();
	
	int movieQuizInsert(QuizVO vo);
	
	MovieQuizVO movieQuizDetail(MovieQuizVO vo);
	
	int movieScore(MovieQuizVO vo);

	int movieScoreInsert(MovieQuizVO vo);
	
	int movieScoreUpdate(MovieQuizVO vo);

}
