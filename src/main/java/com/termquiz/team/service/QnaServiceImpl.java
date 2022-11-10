package com.termquiz.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.termquiz.team.common.PageNation;
import com.termquiz.team.mapperInterface.QnaMapper;
import com.termquiz.team.vo.QnaVO;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	QnaMapper dao;
	
	@Override
	public List<QnaVO> searchList(PageNation cri) {
		
	   return dao.searchList(cri);
	}
	
	@Override
	public int searchCount(PageNation cri) {
		
		return dao.searchCount(cri);
	}

    @Override
    public QnaVO selectOne(QnaVO vo) {
    	return dao.selectOne(vo);
    }

    @Override
    public int insert(QnaVO vo) {
    	return dao.insert(vo);
    }
    
    @Override
    public int qnaAnswer(QnaVO vo) {
    	return dao.qnaAnswer(vo);
    }
    
    @Override
    public int qnaAnswerDelete(QnaVO vo) {
    	return dao.qnaAnswerDelete(vo);
    }
    
    @Override
    public int qnaUpdate(QnaVO vo) {
    	return dao.qnaUpdate(vo);
    }
}
