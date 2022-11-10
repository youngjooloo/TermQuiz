package com.termquiz.team.mapperInterface;

import java.util.List;

import com.termquiz.team.common.PageNation;
import com.termquiz.team.vo.BoardVO;

public interface BoardMapper {
	
	List<BoardVO> searchList(PageNation cri);
	
	int searchCount(PageNation cri);

	BoardVO selectOne(BoardVO vo);

	int countUp(BoardVO vo);
	
	int insert(BoardVO vo);
}
