package com.termquiz.team.mapperInterface;

import java.util.List;

import com.termquiz.team.common.PageNation;
import com.termquiz.team.vo.BoardCommentsVO;
import com.termquiz.team.vo.BoardVO;

public interface BoardMapper {
	
	List<BoardVO> searchList(PageNation cri);
	
	int searchCount(PageNation cri);

	BoardVO selectOne(BoardVO vo);

	int countUp(BoardVO vo);
	
	int insert(BoardVO vo);
	
	int update(BoardVO vo);
	
	int delete(BoardVO vo);

	List<BoardCommentsVO> commentList(BoardCommentsVO cvo);

	int rinsert(BoardCommentsVO cvo);
	
	int bcommentdelete(BoardCommentsVO cvo);
}
