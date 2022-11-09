package com.termquiz.team.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.termquiz.team.mapperInterface.BoardMapper;
import com.termquiz.team.vo.BoardVO;
import com.termquiz.team.vo.QnaVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper dao;

	// ** selectList
	@Override
	public List<BoardVO> selectList() {
		return dao.selectList();
	}
	// ** selectOne
	@Override
	public BoardVO selectOne(BoardVO vo) {
		return dao.selectOne(vo);
	}



} //class
