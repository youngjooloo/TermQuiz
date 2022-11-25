package com.termquiz.team.service;

import java.util.List;

import com.termquiz.team.vo.MovieQuizVO;
import com.termquiz.team.vo.MusicQuizVO;
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
	
	List<MusicQuizVO> musicQuizList(MusicQuizVO vo);

	List<MusicQuizVO> musicLoginQuizList(MusicQuizVO vo);
	
	int musicMaxNo();
	
	int musicQuizInsert(QuizVO vo);
	
	MusicQuizVO musicQuizDetail(MusicQuizVO vo);
	
	int musicScore(MusicQuizVO vo);

	int musicScoreInsert(MusicQuizVO vo);
	
	int musicScoreUpdate(MusicQuizVO vo);
	
	int movieQuizDelete(MovieQuizVO vo);
	
	int musicQuizDelete(MusicQuizVO vo);
}
