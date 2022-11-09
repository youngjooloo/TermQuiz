package com.termquiz.team.service;

import java.util.List;

import com.termquiz.team.vo.BoardVO;

public interface BoardService {
	
	List<BoardVO> selectList();

	BoardVO selectOne(BoardVO vo);

}
