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
}
