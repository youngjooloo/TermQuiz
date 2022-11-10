package com.termquiz.team.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.termquiz.team.common.PageNation;
import com.termquiz.team.mapperInterface.BoardMapper;
import com.termquiz.team.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper dao;

	@Override
	public List<BoardVO> searchList(PageNation cri) {
		return dao.searchList(cri);
	}
	
	@Override
	public int searchCount(PageNation cri) {
		return dao.searchCount(cri);
	}

	@Override
	public BoardVO selectOne(BoardVO vo) {
		return dao.selectOne(vo);
	}

	@Override
	public int countUp(BoardVO vo) {
		return dao.countUp(vo);
	}
	
	@Override
	 public int insert(BoardVO vo) {
	    return dao.insert(vo);
	}


} //class
