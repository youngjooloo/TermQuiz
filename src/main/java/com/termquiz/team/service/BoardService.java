package com.termquiz.team.service;

import java.util.List;

import com.termquiz.team.common.PageNation;
import com.termquiz.team.vo.BoardVO;

public interface BoardService {
	
	List <BoardVO> searchList(PageNation cri);//common==searchCriteria
	
	int searchCount(PageNation cri);

	BoardVO selectOne(BoardVO vo);
	
	int countUp(BoardVO vo);

	int insert(BoardVO vo);

}
