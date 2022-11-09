package com.termquiz.team.mapperInterface;

import java.util.List;

import com.termquiz.team.vo.BoardVO;
import com.termquiz.team.vo.QnaVO;

public interface BoardMapper {
	List<BoardVO> selectList();

	BoardVO selectOne(BoardVO vo);

	int countUp(BoardVO vo);
}
