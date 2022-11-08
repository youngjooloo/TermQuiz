package com.termquiz.team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.termquiz.team.mapperInterface.MemberMapper;
import com.termquiz.team.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper dao;
	
	@Override
	public int insert(MemberVO vo) {
		return dao.insert(vo);
	}

	@Override
	public MemberVO selectOne(MemberVO vo) {
	
		return dao.selectOne(vo);
	}

	@Override
	public int update(MemberVO vo) {
	
		return dao.update(vo);
	}

}
