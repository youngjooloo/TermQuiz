package com.termquiz.team.mapperInterface;

import java.util.List;

import com.termquiz.team.vo.MovieQuizVO;

public interface QuizMapper {
	List<MovieQuizVO> movieQuizList(MovieQuizVO vo);

	List<MovieQuizVO> movieLoginQuizList(MovieQuizVO vo);
	
	int movieMaxNo();
	
	int movieQuizInsert(MovieQuizVO vo);
	
	MovieQuizVO movieQuizDetail(MovieQuizVO vo);
}
