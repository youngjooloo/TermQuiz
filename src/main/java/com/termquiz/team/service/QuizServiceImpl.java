package com.termquiz.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.termquiz.team.mapperInterface.QuizMapper;
import com.termquiz.team.vo.QuizVO;

@Service
public class QuizServiceImpl implements QuizService {
	@Autowired
	QuizMapper mapper;
	
	@Override
	public List<QuizVO> quizList(QuizVO vo) {
		return mapper.quizList(vo);
	}
	
	@Override
	public List<QuizVO> loginQuizList(QuizVO vo) {
		return mapper.loginQuizList(vo);
	}
}
