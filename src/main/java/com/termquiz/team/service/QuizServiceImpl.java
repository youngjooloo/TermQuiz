package com.termquiz.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.termquiz.team.mapperInterface.QuizMapper;
import com.termquiz.team.vo.MovieQuizVO;
import com.termquiz.team.vo.MusicQuizVO;
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
		Integer no = mapper.movieMaxNo();
		if (no != null) {
			return no.intValue();
		}
		return 0;
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
		
		return mapper.movieQuizInsert(vo2);
	}
	
	@Override
	public MovieQuizVO movieQuizDetail(MovieQuizVO vo) {
		return mapper.movieQuizDetail(vo);
	}
	
	@Override
	public int movieScore(MovieQuizVO vo) {
		return mapper.movieScore(vo);
	}
	
	@Override
	public int movieScoreInsert(MovieQuizVO vo) {
		return mapper.movieScoreInsert(vo);
	}
	
	@Override
	public int movieScoreUpdate(MovieQuizVO vo) {
		return mapper.movieScoreUpdate(vo);
	}
	
	@Override
	public List<MusicQuizVO> musicQuizList(MusicQuizVO vo) {
		return mapper.musicQuizList(vo);
	}
	
	@Override
	public List<MusicQuizVO> musicLoginQuizList(MusicQuizVO vo) {
		return mapper.musicLoginQuizList(vo);
	}
	
	@Override
	public int musicMaxNo() {
		Integer no = mapper.musicMaxNo();
		if (no != null) {
			return no.intValue();
		}
		return 0;
	}
	
	@Override
	public int musicQuizInsert(QuizVO vo) {
		MusicQuizVO vo2 = new MusicQuizVO();
		vo2.setMusicqAnswer(vo.getAnswer());
		vo2.setMusicqHint1(vo.getHint1());
		vo2.setMusicqHint2(vo.getHint2());
		vo2.setMusicqHint3(vo.getHint3());
		vo2.setMusicqHint4(vo.getHint4());
		vo2.setMusicqHint5(vo.getHint5());
		
		return mapper.musicQuizInsert(vo2);
	}
	
	@Override
	public MusicQuizVO musicQuizDetail(MusicQuizVO vo) {
		return mapper.musicQuizDetail(vo);
	}
	
	@Override
	public int musicScore(MusicQuizVO vo) {
		return mapper.musicScore(vo);
	}
	
	@Override
	public int musicScoreInsert(MusicQuizVO vo) {
		return mapper.musicScoreInsert(vo);
	}
	
	@Override
	public int musicScoreUpdate(MusicQuizVO vo) {
		return mapper.musicScoreUpdate(vo);
	}

}
