package com.termquiz.team.mapperInterface;

import java.util.List;

import com.termquiz.team.vo.MovieQuizVO;
import com.termquiz.team.vo.MusicQuizVO;

public interface QuizMapper {
	List<MovieQuizVO> movieQuizList(MovieQuizVO vo);

	List<MovieQuizVO> movieLoginQuizList(MovieQuizVO vo);
	
	Integer movieMaxNo();
	
	int movieQuizInsert(MovieQuizVO vo);
	
	MovieQuizVO movieQuizDetail(MovieQuizVO vo);
	
	int movieScore(MovieQuizVO vo);

	int movieScoreInsert(MovieQuizVO vo);

	int movieScoreUpdate(MovieQuizVO vo);
	
	List<MusicQuizVO> musicQuizList(MusicQuizVO vo);

	List<MusicQuizVO> musicLoginQuizList(MusicQuizVO vo);
	
	Integer musicMaxNo();
	
	int musicQuizInsert(MusicQuizVO vo);
	
	MusicQuizVO musicQuizDetail(MusicQuizVO vo);
	
	int musicScore(MusicQuizVO vo);

	int musicScoreInsert(MusicQuizVO vo);

	int musicScoreUpdate(MusicQuizVO vo);
	
	int movieQuizDelete(MovieQuizVO vo);
	
	int musicQuizDelete(MusicQuizVO vo);
}
