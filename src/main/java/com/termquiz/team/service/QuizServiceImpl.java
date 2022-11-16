package com.termquiz.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.termquiz.team.mapperInterface.QuizMapper;
import com.termquiz.team.vo.MovieQuizVO;
import com.termquiz.team.vo.QuizVO;

@Service
public class QuizServiceImpl implements QuizService {
	@Autowired
	QuizMapper mapper;
	
	@Override
	public List<MovieQuizVO> movieQuizList(MovieQuizVO vo) {
		return mapper.movieQuizList(vo);
	}
	
	@Override
	public List<MovieQuizVO> movieLoginQuizList(MovieQuizVO vo) {
		return mapper.movieLoginQuizList(vo);
	}
	
	@Override
	public int movieMaxNo() {
		return mapper.movieMaxNo();
	}
	
	@Override
	public int movieQuizInsert(QuizVO vo) {
		MovieQuizVO vo2 = new MovieQuizVO();
		vo2.setMovieqAnswer(vo.getAnswer());
		vo2.setMovieqHint1(vo.getHint1());
		vo2.setMovieqHint2(vo.getHint2());
		vo2.setMovieqHint3(vo.getHint3());
		vo2.setMovieqHint4(vo.getHint4());
		vo2.setMovieqHint5(vo.getHint5());
		
		System.out.println(vo2);
		return mapper.movieQuizInsert(vo2);
	}
	
	@Override
	public MovieQuizVO movieQuizDetail(MovieQuizVO vo) {
		return mapper.movieQuizDetail(vo);
	}
}
