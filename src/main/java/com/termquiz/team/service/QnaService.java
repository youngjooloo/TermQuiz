package com.termquiz.team.service;

import java.util.List;


import com.termquiz.team.vo.QnaVO;

public interface QnaService {

	List <QnaVO> selectList();

	List <QnaVO> selectOne(QnaVO VO);
	
	
	
	
	
	
}