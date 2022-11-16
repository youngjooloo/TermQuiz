package com.termquiz.team.mapperInterface;

import java.util.List;

import com.termquiz.team.common.PageNation;
import com.termquiz.team.vo.QnaVO;

public interface QnaMapper {

	List<QnaVO> searchList(PageNation cri);
	
	int searchCount(PageNation cri);

	QnaVO selectOne(QnaVO vo);
	
	int insert(QnaVO vo);

	int qnaAnswer(QnaVO vo);

	int qnaAnswerDelete(QnaVO vo);

	int qnaUpdate(QnaVO vo);
	
	int qnadelete(QnaVO vo);
}
